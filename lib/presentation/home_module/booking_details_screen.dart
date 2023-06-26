import 'dart:async';
import 'package:fixgocompanyapp/all_dialogs/single_post_more_info_dialog.dart';
import 'package:fixgocompanyapp/all_dialogs/transporter_amount_pay_dialog.dart';
import 'package:fixgocompanyapp/common_file/common_color.dart';
import 'package:fixgocompanyapp/common_file/size_config.dart';
import 'package:fixgocompanyapp/data/dio_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';




class BookingDetailsScreen extends StatefulWidget {


  final String postId;

  const BookingDetailsScreen({Key? key, required this.postId}) : super(key: key);

  @override
  State<BookingDetailsScreen> createState() => _BookingDetailsScreenState();
}

class _BookingDetailsScreenState extends State<BookingDetailsScreen> {


  var postData;
  var postsData;

  Timer? _timer;
  DateTime? endTime;
  String formattedTime = '';

  String pickUpLocation = '';
  String finalLocation = "";
  String createPostTime = "";
  String createPostDate = "";
  String pickUpDate = "";
  String pickUpTime = "";

  String? passPickIndexAddress;
  String? passLastIndexAddress;
  String? pickUpIndexDate;
  String? pickUpIndexTime;

  bool isLoading = false;


  @override
  void initState() {
    super.initState();

    if (mounted) {
      setState(() {
        isLoading = true;
      });
    }

    ApiClient().getPostById(widget.postId).then((value) {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
      postsData = value;
      postData = value['data'];
      print("postData $postData");

      if(mounted) {
        setState(() {
          DateTime dt = DateTime.parse(postData['createdAt']);

          endTime = dt.add(const Duration(days: 2));

          print("endTime $endTime");
        });
      }

    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);

    if(endTime != null){

      Duration remainingTime = endTime!.difference(DateTime.now());

      formattedTime = _printDuration(remainingTime);


      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (DateTime.now().isAfter(endTime!)) {
          _timer?.cancel();
          // Timer has finished, you can handle the desired action here.
        } else {
          if(mounted) {
            setState(() {});
          }
        }
      });

    }

    if(postData != null) {
      pickUpLocation =
      "${postData['pickup']['address']['street']}, ${postData['pickup']['address']['city']}, ${postData['pickup']['address']['state']}, ${postData['pickup']['address']['country']}, ${postData['pickup']['address']['postalCode']}";

      finalLocation =
      "${postData['receiver']['address']['street']}, ${postData['receiver']['address']['city']}, ${postData['receiver']['address']['state']}, ${postData['receiver']['address']['country']}, ${postData['receiver']['address']['postalCode']}";


      DateTime tempCreateDate = DateFormat("yyyy-MM-dd").parse(postData['pickupDate']);
      var inputCreateDate = DateTime.parse(tempCreateDate.toString());
      var outputCreateFormat = DateFormat('dd MMMM yyyy');
      createPostDate = outputCreateFormat.format(inputCreateDate);

      DateTime parseCreateDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
          .parse(postData['pickupDate']);
      var inputCreateTime = DateTime.parse(parseCreateDate.toString());
      var inputCreateFormat = DateFormat('hh:mm a');
      createPostTime = inputCreateFormat.format(inputCreateTime);

      DateTime tempDate = DateFormat("yyyy-MM-dd").parse(postData['pickupDate']);
      var inputDate = DateTime.parse(tempDate.toString());
      var outputFormat = DateFormat('dd MMMM yyyy');
      pickUpDate = outputFormat.format(inputDate);

      DateTime parseDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
          .parse(postData['pickupDate']);
      var inputTime = DateTime.parse(parseDate.toString());
      var inputFormat = DateFormat('hh:mm a');
      pickUpTime = inputFormat.format(inputTime);
    }

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          ListView(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            children: [
              Container(
                color: CommonColor.APP_BAR_COLOR,
                height: SizeConfig.safeUsedHeight * .12,
                child: getTopText(SizeConfig.screenHeight, SizeConfig.screenWidth),
              ),

              Container(
                color: CommonColor.WHITE_COLOR,
                height: SizeConfig.safeUsedHeight * .88,
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(bottom: SizeConfig.screenHeight * 0.1),
                  children: [

                    Padding(
                      padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.02,
                          left: SizeConfig.screenWidth*0.03,
                          right: SizeConfig.screenWidth*0.03),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 5,
                                spreadRadius: 1,
                                offset: const Offset(2, 2)),
                          ],
                        ),
                        child: getInfoCardLayout(SizeConfig.screenHeight, SizeConfig.screenWidth),
                      ),
                    ),

                    getBookingPayDetailsAndAmount(SizeConfig.screenHeight, SizeConfig.screenWidth)

                  ],
                ),
              ),
            ],
          ),
          Visibility(
              visible: isLoading,
              child: const CircularProgressIndicator()
          ),
        ],
      ),
    );
  }

  Widget getTopText(double parentHeight, double parentWidth) {
    return Padding(
      padding: EdgeInsets.only(top: parentHeight * 0.05, left: parentWidth*0.035, right: parentWidth*0.035),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
                color: Colors.transparent,
                child: Icon(Icons.arrow_back_ios_new,
                  color: CommonColor.WHITE_COLOR,)),
          ),
          Padding(
            padding: EdgeInsets.only(left: parentHeight * 0.01),
            child: Text("Interested Transporter",
              style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal*6.0,
                  fontFamily: "Roboto_Medium",
                  fontWeight: FontWeight.w500,
                  color: Colors.transparent
              ),),
          ),
          const Icon(Icons.more_vert,
            color: Colors.transparent,)
        ],
      ),
    );
  }

  Widget getInfoCardLayout(double parentHeight, double parentWidth){
    return Padding(
      padding: EdgeInsets.only(top: parentHeight*0.01),
      child: Column(
        children: [

          Padding(
            padding: EdgeInsets.only(right: SizeConfig.screenWidth*0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Time Left  $formattedTime",
                  style: TextStyle(
                      color: CommonColor.TO_AREA_COLOR,
                      fontSize: SizeConfig.blockSizeHorizontal*3.0,
                      fontFamily: "Roboto_Medium",
                      fontWeight: FontWeight.w400
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: parentWidth*0.051, top: parentHeight*0.01, right: parentWidth*0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Row(
                  children: [
                    Container(
                      height: parentHeight*0.01,
                      width: parentWidth*0.021,
                      decoration: BoxDecoration(
                          color: CommonColor.FROM_AREA_COLOR,
                          shape: BoxShape.circle
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: parentWidth*0.02),
                      child: Container(
                        width: parentWidth*0.57,
                        color: Colors.transparent,
                        child: Text(
                          pickUpLocation,
                          style: TextStyle(
                              color: CommonColor.BLACK_COLOR,
                              fontSize: SizeConfig.blockSizeHorizontal*3.0,
                              fontFamily: "Roboto_Regular",
                              fontWeight: FontWeight.w400,
                            overflow: TextOverflow.ellipsis
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                RichText(
                  text: TextSpan(
                      text: '\u{20B9}',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: SizeConfig.blockSizeHorizontal*3.5,
                      ),
                      children: [
                        TextSpan(
                            text: ' ${postData != null ? postData['fare'] : ""}/-',
                            style: TextStyle(
                                fontSize: SizeConfig.blockSizeHorizontal*3.7,
                                color: Colors.black,
                                fontWeight: FontWeight.bold))
                      ]),
                ),

              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: parentWidth*0.061),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: parentHeight*0.013,
                  width: parentWidth*0.003,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: parentWidth*0.052, top: parentHeight*0.00),
            child: Row(
              children: [

                Container(
                  height: parentHeight*0.010,
                  width: parentWidth*0.021,
                  decoration: BoxDecoration(
                      color: CommonColor.TO_AREA_COLOR,
                      shape: BoxShape.circle
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(left: parentWidth*0.02),
                  child: Container(
                    width: parentWidth*0.6,
                    color: Colors.transparent,
                    child: Text(
                      finalLocation,
                      style: TextStyle(
                          color: CommonColor.BLACK_COLOR,
                          fontSize: SizeConfig.blockSizeHorizontal*3.0,
                          fontFamily: "Roboto_Regular",
                          fontWeight: FontWeight.w400,
                        overflow: TextOverflow.ellipsis
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: parentWidth*0.05, top: parentHeight*0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Post on  $createPostDate | $createPostTime",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: SizeConfig.blockSizeHorizontal*3.0,
                      fontFamily: "Roboto_Regular",
                      fontWeight: FontWeight.w400
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: parentWidth*0.05, top: parentHeight*0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  color: Colors.transparent,
                  width: parentWidth*0.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Row(
                            children: [
                              Text(
                                "Pick-up Date",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                    fontFamily: "Roboto_Regular",
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                            ],
                          ),

                          Padding(
                            padding: EdgeInsets.only(top: parentHeight*0.007),
                            child: Row(
                              children: [
                                Text(
                                  pickUpDate,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: SizeConfig.blockSizeHorizontal*3.5,
                                      fontFamily: "Roboto_Regular",
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Row(
                            children: [
                              Text(
                                "Pick-Up Time",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                    fontFamily: "Roboto_Regular",
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                            ],
                          ),

                          Padding(
                            padding: EdgeInsets.only(top: parentHeight*0.007),
                            child: Row(
                              children: [
                                Text(
                                  pickUpTime,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: SizeConfig.blockSizeHorizontal*3.5,
                                      fontFamily: "Roboto_Regular",
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      )

                    ],
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: parentWidth*0.05,
                top: parentHeight*0.01, right: parentWidth*0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                      text: 'Qty Of Load : ',
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                        fontSize: SizeConfig.blockSizeHorizontal*3.2,
                      ),
                      children: [
                        TextSpan(
                            text: postData != null ? '${postData['loadDetail']['load']} ${postData['loadDetail']['loadUnit']}' : "",
                            style: TextStyle(
                                fontSize: SizeConfig.blockSizeHorizontal*3.7,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Roboto_Regular'))
                      ]),
                ),
                GestureDetector(
                  onDoubleTap: (){},
                  onTap: (){


                    print(passPickIndexAddress);

                    showCupertinoDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (context) {
                        return AnimatedOpacity(
                            opacity: 1.0,
                            duration: Duration(seconds: 2),
                            child: SingleLoadMoreInfoDialog(
                              model: postData,
                              pickupDate: pickUpDate.toString(),
                              pickupTime: pickUpTime.toString(),
                              pickupLocation: pickUpLocation,
                              finalLocation: finalLocation,
                            )
                        );
                      },
                    );
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>ProcessTimelinePage()));
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Text(
                      "More",
                      style: TextStyle(
                          color: CommonColor.SIGN_UP_TEXT_COLOR,
                          fontSize: SizeConfig.blockSizeHorizontal*3.7,
                          fontFamily: "Roboto_Medium",
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: parentHeight*0.01,
          )

        ],
      ),
    );
  }

  Widget getBookingPayDetailsAndAmount(double parentHeight, double parentWidth){
    return Padding(
      padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.02,
          left: SizeConfig.screenWidth*0.03,
          right: SizeConfig.screenWidth*0.03),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 5,
                spreadRadius: 1,
                offset: const Offset(2, 2)),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.02,
              left: SizeConfig.screenWidth*0.03,
              right: SizeConfig.screenWidth*0.03),
          child: Column(
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text("Mahesh Transporter",
                    style: TextStyle(
                        fontSize: SizeConfig.blockSizeHorizontal*4.0,
                        fontFamily: "Roboto_Medium",
                        fontWeight: FontWeight.w500,
                        color: CommonColor.BLACK_COLOR
                    ),),


                  Padding(
                    padding: EdgeInsets.only(right: parentWidth*0.05),
                    child: Container(
                      width: parentWidth*0.25,
                      decoration: BoxDecoration(
                        border: Border.all(color: CommonColor.BOOKING_CONFIRM_COLOR),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child:  Center(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text("Booking Confirm",
                            style: TextStyle(
                                fontSize: SizeConfig.blockSizeHorizontal*2.7,
                                fontFamily: "Roboto_Medium",
                                fontWeight: FontWeight.w500,
                                color: CommonColor.BOOKING_CONFIRM_COLOR
                            ),),
                        ),
                      ),
                    ),
                  )

                ],
              ),

              Padding(
                padding: EdgeInsets.only(top: parentHeight*0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text("Pune",
                      style: TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal*3.5,
                          fontFamily: "Roboto_Regular",
                          fontWeight: FontWeight.w400,
                          color: CommonColor.BLACK_COLOR
                      ),),

                    Padding(
                      padding: EdgeInsets.only(right: parentWidth*0.12),
                      child: Image(image: AssetImage("assets/images/adhar_tag.png")),
                    )

                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: parentHeight*0.01),
                child: Row(
                  mainAxisAlignment:  MainAxisAlignment.start,
                  children: [
                  Text("Vehicle Available on : 1 Feb 23",
                  style: TextStyle(
                      fontSize: SizeConfig.blockSizeHorizontal*3.5,
                      fontFamily: "Roboto_Regular",
                      fontWeight: FontWeight.w400,
                      color: CommonColor.BLACK_COLOR
                  ),),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: parentHeight*0.01),
                child: Row(
                  mainAxisAlignment:  MainAxisAlignment.start,
                  children: [
                  Text("No. of Vehicle : 04",
                  style: TextStyle(
                      fontSize: SizeConfig.blockSizeHorizontal*3.5,
                      fontFamily: "Roboto_Regular",
                      fontWeight: FontWeight.w400,
                      color: CommonColor.BLACK_COLOR
                  ),),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01),
                child: Container(
                  height: SizeConfig.screenWidth*0.003,
                  color: Colors.black12,
                  child: Row(
                    children: const [
                      Text("hii",
                        style: TextStyle(
                            color: Colors.transparent
                        ),),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: parentHeight*0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text("Total Fare",
                      style: TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal*3.5,
                          fontFamily: "Roboto_Regular",
                          fontWeight: FontWeight.w400,
                          color: CommonColor.BLACK_COLOR
                      ),),

                    RichText(
                      text: TextSpan(
                          text: '\u{20B9}',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: SizeConfig.blockSizeHorizontal*4.0,
                          ),
                          children: [
                            TextSpan(
                                text: ' 10000/-',
                                style: TextStyle(
                                    fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                    color: Colors.black,
                                    fontFamily: 'Roboto_Medium',
                                    fontWeight: FontWeight.w500))
                          ]),
                    ),

                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: parentHeight*0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text("Advance Payment",
                      style: TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal*3.5,
                          fontFamily: "Roboto_Regular",
                          fontWeight: FontWeight.w400,
                          color: CommonColor.BLACK_COLOR
                      ),),

                    RichText(
                      text: TextSpan(
                          text: '\u{20B9}',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: SizeConfig.blockSizeHorizontal*4.0,
                          ),
                          children: [
                            TextSpan(
                                text: ' 5000/-',
                                style: TextStyle(
                                    fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                    color: Colors.black,
                                    fontFamily: 'Roboto_Medium',
                                    fontWeight: FontWeight.w500))
                          ]),
                    ),

                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.03,
                  left: SizeConfig.screenWidth*0.05,
                  right: SizeConfig.screenWidth*0.05,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){

                        showCupertinoDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (context) {
                            return const AnimatedOpacity(
                                opacity: 1.0,
                                duration: Duration(seconds: 2),
                                child: TransporterAmountPayDialog(isComeFrom: '1',));
                          },
                        );

                      },
                      child: Container(
                        height: SizeConfig.screenHeight*0.05,
                        width: SizeConfig.screenWidth*0.7,
                        decoration: BoxDecoration(
                            color: CommonColor.SIGN_UP_TEXT_COLOR,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(
                          child: Text("Pay Now",
                            style: TextStyle(
                                color: CommonColor.WHITE_COLOR,
                                fontSize: SizeConfig.blockSizeHorizontal*5.0,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Roboto_Medium'
                            ),),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: parentHeight*0.03,
              )
            ],
          ),
        ),
      ),
    );
  }

}
