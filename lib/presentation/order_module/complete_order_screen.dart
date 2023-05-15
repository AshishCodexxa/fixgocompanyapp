import 'package:fixgocompanyapp/all_dialogs/load_more_info_dialog.dart';
import 'package:fixgocompanyapp/all_dialogs/receiver_details_dialog.dart';
import 'package:fixgocompanyapp/all_dialogs/transporter_amount_pay_dialog.dart';
import 'package:fixgocompanyapp/all_dialogs/transporter_verify_details_dialog.dart';
import 'package:fixgocompanyapp/common_file/common_color.dart';
import 'package:fixgocompanyapp/common_file/draw_dash_border_class.dart';
import 'package:fixgocompanyapp/common_file/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class CompleteOrderScreen extends StatefulWidget {
  const CompleteOrderScreen({Key? key}) : super(key: key);

  @override
  State<CompleteOrderScreen> createState() => _CompleteOrderScreenState();
}

class _CompleteOrderScreenState extends State<CompleteOrderScreen> {

  bool vehicleDetailsHide = true;
  bool arrowShow = true;


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: [


          Container(
            height: SizeConfig.screenHeight * 0.8,
            color: Colors.transparent,
            child: ListView.builder(
                itemCount: 1,
                padding: EdgeInsets.only(
                    bottom: SizeConfig.screenHeight * 0.02),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        top: SizeConfig.screenHeight * 0.02,
                        left: SizeConfig.screenWidth * 0.03,
                        right: SizeConfig.screenWidth * 0.03),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: const Offset(2, 6)),
                        ],
                      ),
                      child: getInfoCardLayout(
                          SizeConfig.screenHeight, SizeConfig.screenWidth),
                    ),
                  );
                }
            ),
          ),

        ],
      ),
    );
  }

  Widget getInfoCardLayout(double parentHeight, double parentWidth) {
    return Padding(
      padding: EdgeInsets.only(top: parentHeight * 0.012,),
      child: Column(
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: parentWidth * 0.05,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      children: [
                        Container(
                          height: parentHeight * 0.01,
                          width: parentWidth * 0.021,
                          decoration: BoxDecoration(
                              color: CommonColor.FROM_AREA_COLOR,
                              shape: BoxShape.circle
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(
                              left: SizeConfig.screenWidth * 0.02),
                          child: Container(
                            width: parentWidth * 0.5,
                            color: Colors.transparent,
                            child: Text(
                              "City Avenue, Wakad",
                              style: TextStyle(
                                  color: CommonColor.BLACK_COLOR,
                                  fontSize: SizeConfig.blockSizeHorizontal *
                                      3.0,
                                  fontFamily: "Roboto_Medium",
                                  fontWeight: FontWeight.w400
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: parentHeight * 0.013,
                            width: parentWidth * 0.003,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [

                        Container(
                          height: parentHeight * 0.01,
                          width: parentWidth * 0.021,
                          decoration: BoxDecoration(
                              color: CommonColor.TO_AREA_COLOR,
                              shape: BoxShape.circle
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(left: parentWidth * 0.02),
                          child: Container(
                            width: parentWidth * 0.5,
                            color: Colors.transparent,
                            child: Text(
                              "Pune Station",
                              style: TextStyle(
                                  color: CommonColor.BLACK_COLOR,
                                  fontSize: SizeConfig.blockSizeHorizontal *
                                      3.0,
                                  fontFamily: "Roboto_Medium",
                                  fontWeight: FontWeight.w400
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),

                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: parentWidth * 0.05,
                ),
                child: Column(
                  children: [
                    RichText(
                      text: TextSpan(
                          text: '\u{20B9}',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: SizeConfig.blockSizeHorizontal * 3.7,
                          ),
                          children: [
                            TextSpan(
                                text: ' 99999/-',
                                style: TextStyle(
                                    fontSize:
                                    SizeConfig.blockSizeHorizontal * 4.5,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold))
                          ]),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "(Transport Fare)",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: SizeConfig.blockSizeHorizontal * 2.0,
                              fontFamily: "Roboto_Regular",
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.only(
                left: parentWidth * 0.05, top: parentHeight * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onDoubleTap: () {},
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        elevation: 10,
                        isScrollControlled: true,
                        isDismissible: true,
                        builder: (BuildContext bc) {
                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom,
                            ),
                            child: TransporterVerifyDialog(),
                          );
                        });
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Transporter Name",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize:
                                  SizeConfig.blockSizeHorizontal * 3.0,
                                  fontFamily: "Roboto_Regular",
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: parentHeight * 0.007),
                          child: Row(
                            children: [
                              Text(
                                "Mahesh Transporter",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                    SizeConfig.blockSizeHorizontal * 3.5,
                                    fontFamily: "Roboto_Regular",
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onDoubleTap: () {},
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        elevation: 10,
                        isScrollControlled: true,
                        isDismissible: true,
                        builder: (BuildContext bc) {
                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom,
                            ),
                            child: ReceiverVerifyDialog(),
                          );
                        });
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Receiver Name",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: SizeConfig.blockSizeHorizontal * 3.0,
                                fontFamily: "Roboto_Regular",
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: parentHeight * 0.007),
                        child: Row(
                          children: [
                            Text(
                              "Nikita Mahindrakar",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize:
                                  SizeConfig.blockSizeHorizontal * 3.5,
                                  fontFamily: "Roboto_Regular",
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: parentWidth * 0.05, top: parentHeight * 0.0),
                  child: Container(
                    width: parentWidth * 0.15,
                    height: parentHeight * 0.02,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: CommonColor.FROM_AREA_COLOR),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          "Completed",
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeHorizontal * 2.0,
                              fontFamily: "Roboto_Medium",
                              fontWeight: FontWeight.w500,
                              color: CommonColor.FROM_AREA_COLOR),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),



          Padding(
            padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.015,
                left: parentWidth * 0.012),
            child: CustomPaint(painter: DrawDottedhorizontalline()),
          ),

          Padding(
            padding: EdgeInsets.only(
                left: parentWidth * 0.05, top: parentHeight * 0.005),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /* Row(
                      mainAxisAlignment: MainAxisAlignment.start,
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
                                    text: '10 Ton(s)',
                                    style: TextStyle(
                                        fontSize: SizeConfig.blockSizeHorizontal*3.7,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Roboto_Regular'))
                              ]),
                        ),
                      ],
                    ),*/
                    Padding(
                      padding: EdgeInsets.only(top: parentHeight * 0.005),
                      child: Row(
                        children: [
                          Container(
                            width: parentWidth * 0.45,
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Adv. - 1000/- (Online)",
                                  style: TextStyle(
                                    color: CommonColor.FROM_AREA_COLOR,
                                    fontWeight: FontWeight.w400,
                                    fontSize:
                                    SizeConfig.blockSizeHorizontal * 2.5,
                                  ),
                                ),
                                Text(
                                  "Due. - 1000/- ",
                                  style: TextStyle(
                                    color: CommonColor.TO_AREA_COLOR,
                                    fontWeight: FontWeight.w400,
                                    fontSize:
                                    SizeConfig.blockSizeHorizontal * 2.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                /* Padding(
                  padding: EdgeInsets.only(right: parentWidth*0.05,),
                  child: GestureDetector(
                    onDoubleTap: (){},
                    onTap: (){
                      showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          elevation: 10,
                          isScrollControlled: true,
                          isDismissible: true,
                          builder: (BuildContext bc) {
                            return Padding(
                              padding: EdgeInsets.only(
                                bottom: MediaQuery.of(context).viewInsets.bottom,
                              ),
                              child: TransporterVerifyDialog(),
                            );
                          });
                    },
                    child: Container(
                      height: parentHeight*0.025,
                      width: parentWidth*0.16,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.black26,)
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: parentWidth*0.01,
                            right: parentWidth*0.01),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Icon(Icons.verified_user,
                              size: parentHeight*0.016,),

                            Text("Verified",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Roboto_Medium',
                                fontSize: SizeConfig.blockSizeHorizontal*2.7,
                              ),)

                          ],
                        ),
                      ),
                    ),
                  ),
                )*/
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: parentHeight * 0.007, right: parentWidth * 0.05),
                      child: GestureDetector(
                        onTap: () {
                          showCupertinoDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (context) {
                              return const AnimatedOpacity(
                                  opacity: 1.0,
                                  duration: Duration(seconds: 2),
                                  child: LoadMoreInfoDialog());
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
                                fontSize: SizeConfig.blockSizeHorizontal * 3.7,
                                fontFamily: "Roboto_Regular ",
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: parentWidth * 0.05,
                top: parentHeight * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (mounted) {
                          setState(() {
                            vehicleDetailsHide = !vehicleDetailsHide;
                            arrowShow = !arrowShow;
                          });
                        }
                      },
                      child: Text("Vehicle Details",
                        style: TextStyle(
                            color: CommonColor.BLACK_COLOR,
                            fontSize: SizeConfig.blockSizeHorizontal * 3.7,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto_Medium'
                        ),),
                    ),
                    Stack(
                      children: [
                        Visibility(
                          visible: arrowShow,
                          child: GestureDetector(
                            onDoubleTap: () {},
                            onTap: () {
                              if (mounted) {
                                setState(() {
                                  vehicleDetailsHide = !vehicleDetailsHide;
                                  arrowShow = !arrowShow;
                                });
                              }
                            },
                            child: Container(
                              color: Colors.transparent,
                              child: Icon(Icons.keyboard_arrow_down_outlined,
                                color: Colors.black,),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: !arrowShow,
                          child: GestureDetector(
                            onTap: () {
                              if (mounted) {
                                setState(() {
                                  vehicleDetailsHide = !vehicleDetailsHide;
                                  arrowShow = !arrowShow;
                                });
                              }
                            },
                            child: Container(
                              color: Colors.transparent,
                              child: Icon(Icons.keyboard_arrow_up_outlined,
                                color: Colors.black,),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),

                Padding(
                  padding: EdgeInsets.only(
                    right: SizeConfig.screenWidth*0.05,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onDoubleTap: (){},
                        onTap: (){

                          showCupertinoDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (context) {
                              return const AnimatedOpacity(
                                  opacity: 1.0,
                                  duration: Duration(seconds: 2),
                                  child: TransporterAmountPayDialog(isComeFrom: '2',));
                            },
                          );

                        },
                        child: Container(
                          height: SizeConfig.screenHeight*0.03,
                          width: SizeConfig.screenWidth*0.2,
                          decoration: BoxDecoration(
                              color: CommonColor.SIGN_UP_TEXT_COLOR,
                              borderRadius: BorderRadius.circular(7)
                          ),
                          child: Center(
                            child: Text("Pay",
                              style: TextStyle(
                                  color: CommonColor.WHITE_COLOR,
                                  fontSize: SizeConfig.blockSizeHorizontal*3.5,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Roboto_Medium'
                              ),),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),


          for(int i = 0; i < 3; i++)

            Visibility(
              visible: !vehicleDetailsHide,
              child: Padding(
                padding: EdgeInsets.only(left: parentWidth * 0.05,
                    right: parentWidth * 0.05,
                    top: parentHeight * 0.01),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black)
                  ),
                  child: Column(
                    children: [

                      Padding(
                        padding: EdgeInsets.only(left: parentWidth * 0.02,
                            top: parentHeight * 0.01),
                        child: Row(
                          children: [

                            Column(
                              children: [
                                Container(
                                  height: parentHeight * 0.085,
                                  width: parentWidth * 0.2,
                                  decoration: BoxDecoration(
                                      color: CommonColor
                                          .VEHICLE_DRIVER_IMG_COLOR,
                                      borderRadius: BorderRadius.circular(12)
                                  ),
                                ),
                                Text("MH12 NT3456",
                                  style: TextStyle(
                                      color: CommonColor.BLACK_COLOR,
                                      fontSize: SizeConfig.blockSizeHorizontal *
                                          3.5,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Roboto_Medium',
                                      height: parentHeight * 0.002
                                  ),),
                              ],
                            ),

                            Padding(
                              padding: EdgeInsets.only(
                                  left: parentWidth * 0.03),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Container(
                                    width: parentWidth*0.53,
                                    color: Colors.transparent,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Raj Vehicle",
                                          style: TextStyle(
                                              color: CommonColor.BLACK_COLOR,
                                              fontSize: SizeConfig
                                                  .blockSizeHorizontal * 3.5,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Roboto_Medium'
                                          ),),
                                        Padding(
                                          padding: EdgeInsets.only(top: parentHeight * 0.0),
                                          child: Container(
                                            width: parentWidth * 0.15,
                                            height: parentHeight * 0.02,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: CommonColor.FROM_AREA_COLOR),
                                                borderRadius: BorderRadius.circular(20)),
                                            child: Center(
                                              child: Padding(
                                                padding: const EdgeInsets.all(2.0),
                                                child: Text(
                                                  "Completed",
                                                  style: TextStyle(
                                                      fontSize: SizeConfig.blockSizeHorizontal * 2.5,
                                                      fontFamily: "Roboto_Medium",
                                                      fontWeight: FontWeight.w500,
                                                      color: CommonColor.FROM_AREA_COLOR),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: parentHeight * 0.005),
                                    child: Text("Type Of Vehicle",
                                      style: TextStyle(
                                          color: Colors.black38,
                                          fontSize: SizeConfig
                                              .blockSizeHorizontal * 3.0,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Roboto_Medium'
                                      ),),
                                  ),


                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: parentHeight * 0.005),
                                    child: RichText(
                                      text: TextSpan(
                                          text: 'Pack Body',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: SizeConfig
                                                  .blockSizeHorizontal * 3.5,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Roboto_Regular'
                                          ),
                                          children: [
                                            TextSpan(
                                                text: '  (LxW: 40x08 ft)',
                                                style: TextStyle(
                                                    fontSize: SizeConfig
                                                        .blockSizeHorizontal *
                                                        3.0,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Roboto_Regular'))
                                          ]),
                                    ),
                                  ),


                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: parentHeight * 0.01),
                                    child: Container(
                                      color: Colors.transparent,
                                      width: parentWidth * 0.53,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        children: [

                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start,
                                            children: [

                                              Row(
                                                children: [
                                                  Text(
                                                    "Mobile No.",
                                                    style: TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: SizeConfig
                                                            .blockSizeHorizontal *
                                                            3.0,
                                                        fontFamily: "Roboto_Regular",
                                                        fontWeight: FontWeight
                                                            .w400
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: parentHeight * 0.007),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "8965247632",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: SizeConfig
                                                              .blockSizeHorizontal *
                                                              3.1,
                                                          fontFamily: "Roboto_Regular",
                                                          fontWeight: FontWeight
                                                              .w400
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),

                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start,
                                            children: [

                                              Row(
                                                children: [
                                                  Text(
                                                    "RLW Kgs",
                                                    style: TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: SizeConfig
                                                            .blockSizeHorizontal *
                                                            3.0,
                                                        fontFamily: "Roboto_Regular",
                                                        fontWeight: FontWeight
                                                            .w400
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: parentHeight * 0.007),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "1550Kg",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: SizeConfig
                                                              .blockSizeHorizontal *
                                                              3.1,
                                                          fontFamily: "Roboto_Regular",
                                                          fontWeight: FontWeight
                                                              .w400
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),

                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start,
                                            children: [

                                              Row(
                                                children: [
                                                  Text(
                                                    "Driver Assign",
                                                    style: TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: SizeConfig
                                                            .blockSizeHorizontal *
                                                            3.0,
                                                        fontFamily: "Roboto_Regular",
                                                        fontWeight: FontWeight
                                                            .w400
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: parentHeight * 0.007),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      color: Colors.transparent,
                                                      width: parentWidth * 0.17,
                                                      child: Center(
                                                        child: Text(
                                                          "Vinay",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black,
                                                              fontSize: SizeConfig
                                                                  .blockSizeHorizontal *
                                                                  3.1,
                                                              fontFamily: "Roboto_Regular",
                                                              fontWeight: FontWeight
                                                                  .w400
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),

                                            ],
                                          ),


                                        ],
                                      ),
                                    ),
                                  )

                                ],
                              ),
                            ),

                          ],
                        ),
                      ),

                      SizedBox(
                        height: parentHeight * 0.01,
                      )

                    ],
                  ),
                ),
              ),
            ),

          SizedBox(
            height: parentHeight * 0.02,
          )

        ],
      ),
    );
  }
}