import 'package:fixgocompanyapp/all_dialogs/post_delete_confirm_dialog.dart';
import 'package:fixgocompanyapp/common_file/common_color.dart';
import 'package:fixgocompanyapp/common_file/size_config.dart';
import 'package:fixgocompanyapp/data/api_constant/api_url.dart';
import 'package:fixgocompanyapp/data/model/get_all_pending_post_response_model.dart';
import 'package:fixgocompanyapp/data/model/get_post_info_by_id_reponse_model.dart';
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';




const kTileHeight = 50.0;

const completeColor = Color(0xff5e6172);
const inProgressColor = CommonColor.SIGN_UP_TEXT_COLOR;
const todoColor = Color(0xffd1d2d7);


// setState(() {
// _processIndex = (_processIndex + 1) % _processes.length;
// });


class SingleLoadMoreInfoDialog extends StatefulWidget {

  final Map<String, dynamic> model;
  final String pickupDate;
  final String pickupTime;
  final String pickupLocation;
  final String finalLocation;

  const SingleLoadMoreInfoDialog({Key? key, this.pickupDate = '', this.pickupTime ='', this.pickupLocation = '', this.finalLocation = '', required this.model}) : super(key: key);

  @override
  State<SingleLoadMoreInfoDialog> createState() => _SingleLoadMoreInfoDialogState();
}

class _SingleLoadMoreInfoDialogState extends State<SingleLoadMoreInfoDialog> {


  final _processes = [
    'Order Confirm',
    'Pick-up',
    'Transit',
    'Deliverd',
  ];

  int _processIndex = 0;

  Color getColor(int index) {
    if (index == _processIndex) {
      return inProgressColor;
    } else if (index < _processIndex) {
      return completeColor;
    } else {
      return todoColor;
    }
  }

  double advancePay = 0.0;
  double deliveryPay = 0.0;

  String postId = "0";

  @override
  void initState() {
    super.initState();
    // print(widget.postIndex);


    int totalFare = widget.model['fare'];

    print(totalFare);
    double ratio = widget.model['advancePayment']['ratio'] / 100;
    advancePay = totalFare * ratio;

    postId = widget.model['_id'];

    int totalsFare = widget.model['fare'];
    double ratios = widget.model['deliveryPayment']['ratio'] / 100;
    deliveryPay = totalsFare * ratios;

    if(widget.model['status'] == "PENDING"){
      setState(() {
        _processIndex = 0;
      });
    }else if(widget.model['status'] == "ACCEPTED"){
      setState(() {
        _processIndex = (_processIndex + 1) % _processes.length ;
      });
    }else if(widget.model['status'] == "IN_TRANSIT"){
      setState(() {
        _processIndex = (_processIndex + 2) % _processes.length ;
      });
    }else if(widget.model['status'] == "COMPLETED"){
      setState(() {
        _processIndex = (_processIndex + 3) % _processes.length ;
      });
    }



  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(
            left: SizeConfig.screenWidth * .01,
            right: SizeConfig.screenWidth * .01,
            top: SizeConfig.screenHeight*0.02),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child:  Container(
              height: SizeConfig.screenHeight*0.96,
              decoration:  const BoxDecoration(
                borderRadius:  BorderRadius.all(Radius.circular(25.0)),
                //color: CommonColor.RED_COLOR,
              ),
              child:  ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                children: [

                  Container(
                    height: SizeConfig.screenHeight*0.05,
                    decoration: const BoxDecoration(
                        color: CommonColor.SIGN_UP_TEXT_COLOR,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10)
                        )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.05),
                          child: const Icon(Icons.clear,
                            color: Colors.transparent,),
                        ),
                        Text("More Info",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Roboto_Medium',
                              fontWeight: FontWeight.w500,
                              fontSize: SizeConfig.blockSizeHorizontal*4.5
                          ),),
                        Padding(
                          padding: EdgeInsets.only(right: SizeConfig.screenWidth*0.05),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Container(
                              color: Colors.transparent,
                              child: const Icon(Icons.clear,
                                color: Colors.white,),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    height: SizeConfig.screenHeight*0.13,
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        Expanded(
                          child: Timeline.tileBuilder(
                            physics: const NeverScrollableScrollPhysics(),
                            theme: TimelineThemeData(
                              direction: Axis.horizontal,
                              connectorTheme: const ConnectorThemeData(
                                space: 20.0,
                                thickness: 3.0,
                              ),
                            ),
                            builder: TimelineTileBuilder.connected(
                              contentsAlign: ContentsAlign.reverse,
                              connectionDirection: ConnectionDirection.before,
                              itemExtentBuilder: (_, __) =>
                              MediaQuery.of(context).size.width / _processes.length,
                              oppositeContentsBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01),
                                  child: Container(
                                    width: SizeConfig.screenWidth*0.125,
                                    color: Colors.transparent,
                                    child: Text("2:00 PM 28 Jan 23",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black26,
                                          height: SizeConfig.screenHeight*0.0017,
                                          fontSize: SizeConfig.blockSizeHorizontal*2.5,
                                          fontFamily: 'Roboto_Regular'
                                      ),
                                      textAlign: TextAlign.center,),
                                  ),
                                );
                              },
                              indicatorBuilder: (_, index) {
                                Color color;
                                var child;
                                if (index == _processIndex) {
                                  color = inProgressColor;
                                  child = const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: CircularProgressIndicator(
                                      strokeWidth: 3.0,
                                      valueColor: AlwaysStoppedAnimation(Colors.white),
                                    ),
                                  );
                                } else if (index < _processIndex) {
                                  color = completeColor;
                                  child = const Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 15.0,
                                  );
                                } else {
                                  color = todoColor;
                                }

                                if (index <= _processIndex) {
                                  return DotIndicator(
                                    size: 30.0,
                                    color: color,
                                    child: child,
                                  );
                                } else {
                                  return OutlinedDotIndicator(
                                    borderWidth: 4.0,
                                    color: color,
                                  );
                                }
                              },
                              connectorBuilder: (_, index, type) {
                                if (index > 0) {
                                  if (index == _processIndex) {
                                    final prevColor = getColor(index - 1);
                                    final color = getColor(index);
                                    List<Color> gradientColors;
                                    if (type == ConnectorType.start) {
                                      gradientColors = [Color.lerp(prevColor, color, 0.5)!, color];
                                    } else {
                                      gradientColors = [
                                        prevColor,
                                        Color.lerp(prevColor, color, 0.5)!
                                      ];
                                    }
                                    return DecoratedLineConnector(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: gradientColors,
                                        ),
                                      ),
                                    );
                                  } else {
                                    return SolidLineConnector(
                                      color: getColor(index),
                                    );
                                  }
                                } else {
                                  return null;
                                }
                              },
                              contentsBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(bottom: SizeConfig.screenHeight*0.01,),
                                  child: Text(
                                    _processes[index],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: getColor(index),
                                        fontSize: SizeConfig.blockSizeHorizontal*3.0
                                    ),
                                  ),
                                );
                              },
                              itemCount: _processes.length,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  getInfoLayout(SizeConfig.screenHeight, SizeConfig.screenWidth)



                ],
              )
          ),
        ),
      ),
    );
  }

  Widget getInfoLayout(double parentHeight, double parentWidth){
    return Padding(
      padding: EdgeInsets.only(top: parentHeight*0.02),
      child: Column(
        children: [

          Padding(
            padding: EdgeInsets.only(left: parentWidth*0.051),
            child: Row(
              children: [
                Container(
                  height: parentHeight*0.01,
                  width: parentWidth*0.021,
                  decoration: const BoxDecoration(
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
                      widget.pickupLocation,
                      style: TextStyle(
                          color: CommonColor.BLACK_COLOR,
                          fontSize: SizeConfig.blockSizeHorizontal*3.0,
                          fontFamily: "Roboto_Regular",
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
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
                  decoration: const BoxDecoration(
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
                      widget.finalLocation,
                      style: TextStyle(
                          color: CommonColor.BLACK_COLOR,
                          fontSize: SizeConfig.blockSizeHorizontal*3.0,
                          fontFamily: "Roboto_Regular",
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: parentHeight*0.02, right: parentWidth*0.07,
                left: parentWidth*0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text("Type Of Load",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: SizeConfig.blockSizeHorizontal*3.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto_Regular'
                  ),
                ),

                Container(
                  width: parentWidth*0.4,
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text("Qty. of Goods/Load",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: SizeConfig.blockSizeHorizontal*3.0,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto_Regular'
                          ),
                        ),
                      ),
                    ],
                  ),
                )

              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: parentHeight*0.01, right: parentWidth*0.07,
                left: parentWidth*0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text(widget.model['loadDetail']['loadType'],
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: SizeConfig.blockSizeHorizontal*3.2,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto_Regular'
                  ),
                ),

                Container(
                  width: parentWidth*0.4,
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text("${widget.model['loadDetail']['load']} ${widget.model['loadDetail']['loadUnit']}",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig.blockSizeHorizontal*3.2,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto_Regular'
                          ),
                        ),
                      ),
                    ],
                  ),
                )

              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: parentHeight*0.02, right: parentWidth*0.07,
                left: parentWidth*0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Text("Description",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: SizeConfig.blockSizeHorizontal*3.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto_Regular'
                  ),
                ),

              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: parentHeight*0.007, right: parentWidth*0.05,
                left: parentWidth*0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Container(
                  width: parentWidth*0.85,
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(widget.model['loadDetail']['description'],
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig.blockSizeHorizontal*3.0,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto_Regular'
                          ),
                        ),
                      ),
                    ],
                  ),
                )

              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: parentHeight*0.02, right: parentWidth*0.07,
                left: parentWidth*0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text("Pickup Date",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: SizeConfig.blockSizeHorizontal*3.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto_Regular'
                  ),
                ),

                Container(
                  width: parentWidth*0.4,
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text("Pickup Time",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: SizeConfig.blockSizeHorizontal*3.0,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto_Regular'
                          ),
                        ),
                      ),
                    ],
                  ),
                )

              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: parentHeight*0.01, right: parentWidth*0.07,
                left: parentWidth*0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text(widget.pickupDate,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: SizeConfig.blockSizeHorizontal*3.2,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto_Regular'
                  ),
                ),

                Container(
                  width: parentWidth*0.4,
                  // color: Colors.red,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(widget.pickupTime,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig.blockSizeHorizontal*3.2,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto_Regular'
                          ),
                        ),
                      ),
                    ],
                  ),
                )

              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: parentHeight*0.02, right: parentWidth*0.07,
                left: parentWidth*0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text("Type of Vehicle",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: SizeConfig.blockSizeHorizontal*3.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto_Regular'
                  ),
                ),

                Container(
                  width: parentWidth*0.4,
                  // color: Colors.red,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text("Carrying Capacity",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: SizeConfig.blockSizeHorizontal*3.0,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto_Regular'
                          ),
                        ),
                      ),
                    ],
                  ),
                )

              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: parentHeight*0.01, right: parentWidth*0.07,
                left: parentWidth*0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Row(
                  children: [
                    Text(widget.model['vehicle']['vehicleType'],
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: SizeConfig.blockSizeHorizontal*3.2,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Roboto_Regular'
                      ),
                    ),
                    Visibility(
                      visible: widget.model['vehicle']['vehicleType'] == "Trailor" ? true : false,
                      child: Padding(
                        padding: EdgeInsets.only(left: parentWidth*0.01),
                        child: Text("(${widget.model['vehicle']['trailorType']})",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig.blockSizeHorizontal*3.2,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Roboto_Regular'
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Container(
                  width: parentWidth*0.4,
                  // color: Colors.red,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text("${widget.model['vehicle']['capacity']} ${widget.model['vehicle']['capacityUnit']}",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig.blockSizeHorizontal*3.2,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto_Regular'
                          ),
                        ),
                      ),
                    ],
                  ),
                )

              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: parentHeight*0.02, right: parentWidth*0.07,
                left: parentWidth*0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text("No. of Vehicle",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: SizeConfig.blockSizeHorizontal*3.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto_Regular'
                  ),
                ),

                Container(
                  width: parentWidth*0.4,
                  // color: Colors.red,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text("ODC",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: SizeConfig.blockSizeHorizontal*3.0,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto_Regular'
                          ),
                        ),
                      ),
                    ],
                  ),
                )

              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: parentHeight*0.01, right: parentWidth*0.07,
                left: parentWidth*0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text("${widget.model['vehicle']['quantity']}",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: SizeConfig.blockSizeHorizontal*3.2,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto_Regular'
                  ),
                ),

                Container(
                  width: parentWidth*0.4,
                  // color: Colors.red,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text("Length - ${widget.model['vehicle']['length']} (Fts) ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig.blockSizeHorizontal*3.2,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto_Regular'
                          ),
                        ),
                      ),
                    ],
                  ),
                )

              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: parentHeight*0.02, right: parentWidth*0.07,
                left: parentWidth*0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Text("Total Fare ",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: SizeConfig.blockSizeHorizontal*3.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto_Regular'
                  ),
                ),

              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: parentHeight*0.01, right: parentWidth*0.07,
                left: parentWidth*0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

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
                            text: ' ${widget.model['fare']}/-',
                            style: TextStyle(
                                fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w400))
                      ]),
                ),

              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: parentHeight*0.02, right: parentWidth*0.07,
                left: parentWidth*0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text("Adv. Payment",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: SizeConfig.blockSizeHorizontal*3.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto_Regular'
                  ),
                ),

                Container(
                  width: parentWidth*0.4,
                  // color: Colors.red,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text("Delivery Payment",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: SizeConfig.blockSizeHorizontal*3.0,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto_Regular'
                          ),
                        ),
                      ),
                    ],
                  ),
                )

              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: parentHeight*0.01, right: parentWidth*0.07,
                left: parentWidth*0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

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
                            text: ' ${advancePay.toStringAsFixed(1)}/-',
                            style: TextStyle(
                                fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w400)),
                        TextSpan(
                            text: ' ${widget.model['advancePayment']['payBy']} (${widget.model['advancePayment']['mode']})',
                            style: TextStyle(
                                fontSize: SizeConfig.blockSizeHorizontal*2.5,
                                color: Colors.black,
                                fontWeight: FontWeight.w400))
                      ]),
                ),

                Container(
                  width: parentWidth*0.4,
                  // color: Colors.red,
                  child: Row(
                    children: [
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                              text: '\u{20B9}',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: SizeConfig.blockSizeHorizontal*3.5,
                              ),
                              children: [
                                TextSpan(
                                    text: ' ${deliveryPay.toStringAsFixed(1)}/-',
                                    style: TextStyle(
                                        fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400)),
                                TextSpan(
                                    text: ' ${widget.model['deliveryPayment']['payBy']} (${widget.model['deliveryPayment']['mode']})',
                                    style: TextStyle(
                                        fontSize: SizeConfig.blockSizeHorizontal*2.5,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400))
                              ]),
                        ),
                      ),
                    ],
                  ),
                )

              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: parentHeight*0.02,
                left: parentWidth*0.07,
                right: parentWidth*0.17),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: SizeConfig.screenWidth*0.3,
                  height: SizeConfig.screenHeight*0.04,
                  decoration: BoxDecoration(
                    color: CommonColor.SIGN_UP_TEXT_COLOR,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text("Load",
                        style: TextStyle(
                            color: CommonColor.WHITE_COLOR,
                            fontSize: SizeConfig.blockSizeHorizontal*3.2,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto_Medium'
                        ),),

                    ],
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: parentHeight*0.02,
                left: parentWidth*0.1,
                right: parentWidth*0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                for(int i = 0; i < widget.model['loadDetail']['goodsImage'].length; i++)
                  Padding(
                    padding: EdgeInsets.only(left: parentWidth*0.03),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image(
                          image: const AssetImage("assets/images/grid_loading.gif"),
                          height: SizeConfig.screenHeight*.05,
                          width: SizeConfig.screenWidth*.05,
                        ),
                        Container(
                          height: parentHeight*0.074,
                          width: parentWidth*0.172,
                          decoration: BoxDecoration(
                            // color: CommonColor.LOAD_IMAGE_COLOR,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.15),
                                  blurRadius: 7,
                                  spreadRadius: 3,
                                  offset: const Offset(2, 2.0))
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network("${ApiConstants().uploadImageUrl}${widget.model['loadDetail']['goodsImage'][i]}",
                              fit: BoxFit.cover,),
                          ),
                        ),
                      ],
                    ),
                  )


              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: parentHeight*0.03,
                right: parentWidth*0.07,
                left: parentWidth*0.05),
            child: GestureDetector(
              onDoubleTap: (){},
              onTap: (){
                // Navigator.pop(context);
                // ApiClient().getDeleteCompanyPost(widget.postDetails[0].id);
                // showGeneralDialog(
                //     barrierColor: Colors.black.withOpacity(0.5),
                //     transitionBuilder: (context, a1, a2, widget) {
                //       final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
                //       // return Transform(
                //       //   transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
                //       return Transform.scale(
                //         scale: a1.value,
                //         child: Opacity(
                //           opacity: a1.value,
                //           child: PostDeleteConfirmationDialog(
                //             message: "Are You Sure,\nYou Want To Delete a Post",
                //             postId: postId, openFrom: '',
                //           ),
                //         ),
                //       );
                //     },
                //     transitionDuration: const Duration(milliseconds: 200),
                //     barrierDismissible: true,
                //     barrierLabel: '',
                //     context: context,
                //     pageBuilder: (context, animation2, animation1) {
                //       return Container();
                //     });
              },
              child: Container(
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    Text("Cancel Load",
                      style: TextStyle(
                          color: CommonColor.TO_AREA_COLOR,
                          fontSize: SizeConfig.blockSizeHorizontal*4.0,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Roboto_Bold'
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),


        ],
      ),
    );
  }
}
