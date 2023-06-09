import 'dart:convert';

import 'package:fixgocompanyapp/all_dialogs/filter_transporter_list_dialog.dart';
import 'package:fixgocompanyapp/common_file/common_color.dart';
import 'package:fixgocompanyapp/common_file/size_config.dart';
import 'package:fixgocompanyapp/data/dio_client.dart';
import 'package:fixgocompanyapp/data/model/get_transport_bid_response_model.dart';
import 'package:fixgocompanyapp/presentation/home_module/booking_details_screen.dart';
import 'package:fixgocompanyapp/presentation/home_module/transporter_info_profile.dart';
import 'package:flutter/material.dart';




class InterestedTransporterList extends StatefulWidget {

  final String postId;

  const InterestedTransporterList({Key? key, required this.postId}) : super(key: key);

  @override
  State<InterestedTransporterList> createState() => _InterestedTransporterListState();
}

class _InterestedTransporterListState extends State<InterestedTransporterList> {


  var bidData;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    isLoading = true;

    ApiClient().getAllBidsAgainstPostUnLimited(widget.postId).then((value){

     if(mounted){
       setState(() {
         isLoading = false;
         bidData = value['data'] as List;
       });
     }

      print(bidData);

    });

  }




  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
                    getAllListLayout(SizeConfig.screenHeight, SizeConfig.screenWidth)
                  ],
                ),
              ),
            ],
          ),
          Visibility(
            visible: isLoading,
              child: CircularProgressIndicator(),
          )
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
                  color: CommonColor.WHITE_COLOR
              ),),
          ),
          GestureDetector(
            onDoubleTap: (){},
            onTap: (){
              showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  elevation: 20,
                  isScrollControlled: true,
                  isDismissible: true,
                  enableDrag: true,
                  builder: (BuildContext bc) {
                    return TransporterListFilter();
                  });
            },
            child: Container(
                color: Colors.transparent,
                child: Padding(
                  padding: EdgeInsets.all(3.0),
                  child: Image(image: AssetImage("assets/images/filter_icon.png"),
                  color: Colors.white,),
                )
            ),
          )
        ],
      ),
    );
  }
  
  Widget getAllListLayout(double parentHeight, double parentWidth){
    return Container(
      height: SizeConfig.safeUsedHeight * .88,
      color: Colors.transparent,
      child: ListView.builder(
          itemCount: bidData == null ? 0 : bidData.length,
          physics:
          const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(
              bottom:
              SizeConfig.screenHeight *
                  0.0),
          itemBuilder: (BuildContext context,
              int index) {
            return Padding(
              padding: EdgeInsets.only(
                top: SizeConfig.screenHeight *
                    0.02,
                left: SizeConfig.screenWidth *
                    0.05,
                right:
                SizeConfig.screenWidth *
                    0.05,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              TransporterProfile(transporterName: "${bidData[index]['customer']['name']}",
                                transporterLocation: '',
                                transporterTrip: '',
                                transporterRating: '${bidData[index]['customer']['rating']['rate']}',
                                transporterAddress: "${bidData[index]['customer']['companyAddress']}",

                              )));
                },
                child: Container(
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween,
                        children: [
                          Text(
                            bidData[index]['customer']['name'],
                            style: TextStyle(
                                color: CommonColor
                                    .BLACK_COLOR,
                                fontSize:
                                SizeConfig
                                    .blockSizeHorizontal *
                                    4.0,
                                fontWeight:
                                FontWeight
                                    .w500,
                                fontFamily:
                                'Roboto_Regular'),
                          ),
                          RichText(
                            text: TextSpan(
                                text:
                                '\u{20B9}',
                                style:
                                TextStyle(
                                  color: Colors
                                      .black,
                                  fontWeight:
                                  FontWeight
                                      .w400,
                                  fontSize:
                                  SizeConfig.blockSizeHorizontal *
                                      4.0,
                                ),
                                children: [
                                  TextSpan(
                                      text:
                                      ' ${bidData[index]['bidAmount']}/-',
                                      style: TextStyle(
                                          fontSize: SizeConfig.blockSizeHorizontal *
                                              3.7,
                                          color:
                                          Colors.black,
                                          fontWeight: FontWeight.w400))
                                ]),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: SizeConfig
                                .screenHeight *
                                0.007),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment
                              .start,
                          children: [
                            Container(
                              width: SizeConfig.screenWidth*0.6,
                              color: Colors.transparent,
                              child: Text(
                                bidData[index]['customer']['companyAddress'],
                                style: TextStyle(
                                    color: CommonColor
                                        .BLACK_COLOR,
                                    fontSize:
                                    SizeConfig.blockSizeHorizontal *
                                        3.0,
                                    fontWeight:
                                    FontWeight
                                        .w500,
                                    fontFamily:
                                    'Roboto_Regular'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      /*Padding(
                                                                  padding: EdgeInsets.only(
                                                                      top: SizeConfig
                                                                              .screenHeight *
                                                                          0.003),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        "Vehicle Available on : 1 Feb 23",
                                                                        style: TextStyle(
                                                                            color: CommonColor
                                                                                .BLACK_COLOR,
                                                                            fontSize:
                                                                                SizeConfig.blockSizeHorizontal *
                                                                                    3.5,
                                                                            fontWeight:
                                                                                FontWeight
                                                                                    .w500,
                                                                            fontFamily:
                                                                                'Roboto_Regular'),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),*/
                      Padding(
                        padding: EdgeInsets.only(
                            top: SizeConfig
                                .screenHeight *
                                0.005),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment
                              .spaceBetween,
                          children: [
                            Container(
                              width: SizeConfig
                                  .screenWidth *
                                  0.1,
                              height: SizeConfig
                                  .screenHeight *
                                  0.023,
                              decoration:
                              BoxDecoration(
                                color: CommonColor
                                    .SELECT_TYPE_COLOR,
                                borderRadius:
                                BorderRadius
                                    .circular(
                                    5),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment
                                    .center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: SizeConfig.screenWidth *
                                            0.02),
                                    child:
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right:
                                          SizeConfig.screenWidth * 0.005),
                                      child: Text(
                                        "${bidData[index]['customer']['rating']['rate']}",
                                        style: TextStyle(
                                            color: CommonColor
                                                .WHITE_COLOR,
                                            fontSize: SizeConfig.blockSizeHorizontal *
                                                2.7,
                                            fontWeight:
                                            FontWeight.w500,
                                            fontFamily: 'Roboto_Medium'),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        right:
                                        SizeConfig.screenWidth * 0.017),
                                    child:
                                    Icon(
                                      Icons
                                          .star,
                                      size: SizeConfig.blockSizeHorizontal *
                                          2.5,
                                      color: Colors
                                          .white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            BookingDetailsScreen(postId: '',)));
                              },
                              child:
                              Container(
                                width: SizeConfig
                                    .screenWidth *
                                    0.18,
                                height: SizeConfig
                                    .screenHeight *
                                    0.03,
                                decoration:
                                BoxDecoration(
                                  color: CommonColor
                                      .SIGN_UP_TEXT_COLOR,
                                  borderRadius:
                                  BorderRadius
                                      .circular(7),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .center,
                                  children: [
                                    Text(
                                      "Book Now",
                                      style: TextStyle(
                                          color: CommonColor
                                              .WHITE_COLOR,
                                          fontSize: SizeConfig.blockSizeHorizontal *
                                              3.0,
                                          fontWeight:
                                          FontWeight.w500,
                                          fontFamily: 'Roboto_Medium'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: SizeConfig
                                .screenHeight *
                                0.02),
                        child: Container(
                          height: SizeConfig
                              .screenWidth *
                              0.003,
                          color:
                          Colors.black12,
                          child: const Row(
                            children: [
                              Text(
                                "hii",
                                style: TextStyle(
                                    color: Colors
                                        .transparent),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
