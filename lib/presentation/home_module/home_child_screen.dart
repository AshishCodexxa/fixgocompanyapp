import 'dart:async';
import 'package:dio/dio.dart';
import 'package:fixgocompanyapp/all_dialogs/load_more_info_dialog.dart';
import 'package:fixgocompanyapp/common_file/common_color.dart';
import 'package:fixgocompanyapp/common_file/size_config.dart';
import 'package:fixgocompanyapp/data/api_constant/api_url.dart';
import 'package:fixgocompanyapp/data/data_constant/constant_data.dart';
import 'package:fixgocompanyapp/data/dio_client.dart';
import 'package:fixgocompanyapp/data/model/get_all_pending_post_response_model.dart';
import 'package:fixgocompanyapp/presentation/home_module/booking_details_screen.dart';
import 'package:fixgocompanyapp/presentation/home_module/create_new_load_form_layout.dart';
import 'package:fixgocompanyapp/presentation/home_module/interested_transporter_list.dart';
import 'package:fixgocompanyapp/presentation/home_module/transporter_info_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

String _printDuration(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
}

class HomeChildScreen extends StatefulWidget {
  final HomeChildScreenListener mListener;

  const HomeChildScreen({Key? key, required this.mListener}) : super(key: key);

  @override
  State<HomeChildScreen> createState() => _HomeChildScreenState();
}

class _HomeChildScreenState extends State<HomeChildScreen> {
  int? selectedIndex;
  int? selectedTransListIndex;

  int index = 0;

  final Dio _dio = Dio();

  bool isLoading = false;
  bool transportList = false;
  bool transportEmptyDialog = false;

  double advancePay = 0.0;

  final items = <Docs>[];
  String? pickUpDate;
  String? pickUpTime;
  String? createPostTime;
  String? createPostDate;
  String? pickUpLocation;
  String? finalLocation;

  String? passPickIndexAddress;
  String? passLastIndexAddress;
  String? pickUpIndexDate;
  String? pickUpIndexTime;

  var bidData;

  String companyName = "";

  startTimer() {
    var durtaion = new Duration(seconds: 2);
    return Timer(durtaion, dialogHide);
  }

  void dialogHide() {
    if (mounted) {
      setState(() {
        selectedTransListIndex = -1;
      });
    }
  }

  Timer? _timer;

  AlertDialog alert = const AlertDialog(
    title: Text("Bid Book"),
    content: Text("Bid Book Successful."),
  );

  @override
  void initState() {
    super.initState();

    companyName = GetStorage().read(ConstantData.companyName) ?? "";

    print(companyName);

    if (mounted) {
      setState(() {
        isLoading = true;
      });
    }

    ApiClient().getCompanyAllPost().then((value) {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }

      var jsonList = GetAllPendingPostResponseModel.fromJson(value);

      items.addAll(jsonList.data.docs);

      if (mounted) {
        setState(() {
          for (int i = 0; i < items.length; i++) {
            DateTime dt = DateTime.parse(items[i].postExpiryDate);

            getAllBidsAgainstPostLimited(items[i].id).then((value) {
              setState(() {});
            });

            int totalFare = items[i].fare;
            double ratio = items[i].advancePayment.ratio / 100;
            advancePay = totalFare * ratio;

          }
        });
      }

      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if(mounted) {
          setState(
                () {},
          );
        }
      });
    });


  }

  Future<Null> refreshList() async {
    items.clear();
    await Future.delayed(const Duration(seconds: 2));
    ApiClient().getCompanyAllPost().then((value) {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }

      var jsonList = GetAllPendingPostResponseModel.fromJson(value);

      items.addAll(jsonList.data.docs);

      if (mounted) {
        setState(() {
          for (int i = 0; i < items.length; i++) {
            DateTime dt = DateTime.parse(items[i].postExpiryDate);

            getAllBidsAgainstPostLimited(items[i].id).then((value) {
              setState(() {});
            });

            int totalFare = items[i].fare;
            double ratio = items[i].advancePayment.ratio / 100;
            advancePay = totalFare * ratio;

          }
        });
      }

      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if(mounted) {
          setState(
                () {},
          );
        }
      });
    });
    return;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: refreshList,
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CustomScrollView(
                  slivers: <Widget>[
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          getAdvContainer(
                              SizeConfig.screenHeight, SizeConfig.screenWidth)
                        ],
                      ),
                    ),
                    SliverPadding(
                      padding:
                          EdgeInsets.only(bottom: SizeConfig.screenHeight * 0.1),
                      sliver: SliverList(
                          delegate: SliverChildBuilderDelegate(
                        childCount: items.length,
                        (context, index) {
                          return bidData == null
                              ? Container()
                              : Padding(
                                  padding: EdgeInsets.only(
                                    bottom: selectedIndex == index
                                        ? SizeConfig.screenHeight * 0.02
                                        : SizeConfig.screenHeight * 0.0,
                                    left: SizeConfig.screenWidth * 0.03,
                                    right: SizeConfig.screenWidth * 0.03,
                                  ),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: selectedIndex == index
                                                ? Colors.white
                                                : Colors.transparent,
                                            boxShadow: <BoxShadow>[
                                              selectedIndex == index
                                                  ? BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(0.1),
                                                      blurRadius: 5,
                                                      spreadRadius: 1,
                                                      offset: const Offset(2, 6))
                                                  : const BoxShadow(
                                                      color: Colors.transparent),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Column(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                print(items[index].id);
                                                getAllBidsAgainstPostLimited(
                                                        items[index].id)
                                                    .then((value) {
                                                  print(
                                                      "dddddd ${bidData.length}");

                                                  if (bidData.length != 0) {
                                                    if (selectedIndex != index) {
                                                      selectedIndex = index;
                                                      print(
                                                          "hhhhhhh $selectedIndex");
                                                      if (mounted) {
                                                        setState(() {
                                                          if (mounted) {
                                                            setState(() {});
                                                          }
                                                        });
                                                      }
                                                    } else {
                                                      selectedIndex = -1;
                                                      if (mounted) {
                                                        setState(() {});
                                                      }
                                                    }
                                                  } else {
                                                    if (mounted) {
                                                      setState(() {
                                                        // transportEmptyDialog = true;
                                                        selectedTransListIndex =
                                                            index;
                                                        startTimer();
                                                      });
                                                    }
                                                  }
                                                });

                                                print("llll ${bidData.length}");
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  boxShadow: <BoxShadow>[
                                                    index != selectedIndex
                                                        ? BoxShadow(
                                                            color: Colors.black
                                                                .withOpacity(0.1),
                                                            blurRadius: 5,
                                                            spreadRadius: 1,
                                                            offset: const Offset(
                                                                2, 6))
                                                        : const BoxShadow(
                                                            color: Colors
                                                                .transparent),
                                                  ],
                                                ),
                                                child: getInfoCardLayout(
                                                    SizeConfig.screenHeight,
                                                    SizeConfig.screenWidth,
                                                    index),
                                              ),
                                            ),
                                            Visibility(
                                              visible: index == selectedIndex,
                                              child: bidData.length != 0
                                                  ? Stack(
                                                      alignment: Alignment.center,
                                                      children: [
                                                        Column(
                                                          children: [
                                                            getTransporterListHeading(
                                                                SizeConfig
                                                                    .screenHeight,
                                                                SizeConfig
                                                                    .screenWidth),
                                                            Container(
                                                              height: bidData
                                                                          .length ==
                                                                      1
                                                                  ? SizeConfig
                                                                          .screenHeight *
                                                                      0.14
                                                                  : bidData.length ==
                                                                          2
                                                                      ? SizeConfig
                                                                              .screenHeight *
                                                                          0.26
                                                                      : bidData.length ==
                                                                              3
                                                                          ? SizeConfig.screenHeight *
                                                                              0.38
                                                                          : 0.0,
                                                              color: Colors
                                                                  .transparent,
                                                              child: ListView
                                                                  .builder(
                                                                      itemCount: bidData == null
                                                                          ? 0
                                                                          : bidData
                                                                              .length,
                                                                      physics:
                                                                          const NeverScrollableScrollPhysics(),
                                                                      padding: EdgeInsets.only(
                                                                          bottom: SizeConfig.screenHeight *
                                                                              0.0),
                                                                      itemBuilder:
                                                                          (BuildContext
                                                                                  context,
                                                                              int index) {
                                                                        return Padding(
                                                                          padding:
                                                                              EdgeInsets.only(
                                                                            top: SizeConfig.screenHeight *
                                                                                0.02,
                                                                            left: SizeConfig.screenWidth *
                                                                                0.05,
                                                                            right:
                                                                                SizeConfig.screenWidth * 0.05,
                                                                          ),
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              Navigator.push(
                                                                                  context,
                                                                                  MaterialPageRoute(
                                                                                      builder: (context) => TransporterProfile(
                                                                                            transporterName: "${bidData[index]['customer']['name']}",
                                                                                            transporterLocation: '',
                                                                                            transporterTrip: '',
                                                                                            transporterRating: '${bidData[index]['customer']['rating']['rate']}',
                                                                                            transporterAddress: "${bidData[index]['customer']['companyAddress']}",
                                                                                          )));
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              color:
                                                                                  Colors.transparent,
                                                                              child:
                                                                                  Column(
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Text(
                                                                                        bidData[index]['customer']['name'],
                                                                                        style: TextStyle(color: CommonColor.BLACK_COLOR, fontSize: SizeConfig.blockSizeHorizontal * 4.0, fontWeight: FontWeight.w500, fontFamily: 'Roboto_Regular'),
                                                                                      ),
                                                                                      RichText(
                                                                                        text: TextSpan(
                                                                                            text: '\u{20B9}',
                                                                                            style: TextStyle(
                                                                                              color: Colors.black,
                                                                                              fontWeight: FontWeight.w400,
                                                                                              fontSize: SizeConfig.blockSizeHorizontal * 4.0,
                                                                                            ),
                                                                                            children: [
                                                                                              TextSpan(text: ' ${bidData[index]['bidAmount']}/-', style: TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 3.7, color: Colors.black, fontWeight: FontWeight.w400))
                                                                                            ]),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.007),
                                                                                    child: Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                      children: [
                                                                                        Container(
                                                                                          width: SizeConfig.screenWidth * 0.6,
                                                                                          color: Colors.transparent,
                                                                                          child: Text(
                                                                                            bidData[index]['customer']['companyAddress'],
                                                                                            style: TextStyle(color: CommonColor.BLACK_COLOR, fontSize: SizeConfig.blockSizeHorizontal * 3.0, fontWeight: FontWeight.w500, fontFamily: 'Roboto_Regular'),
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
                                                                                    padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.005),
                                                                                    child: Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Container(
                                                                                          width: SizeConfig.screenWidth * 0.1,
                                                                                          height: SizeConfig.screenHeight * 0.023,
                                                                                          decoration: BoxDecoration(
                                                                                            color: CommonColor.SELECT_TYPE_COLOR,
                                                                                            borderRadius: BorderRadius.circular(5),
                                                                                          ),
                                                                                          child: Row(
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsets.only(left: SizeConfig.screenWidth * 0.02),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsets.only(right: SizeConfig.screenWidth * 0.005),
                                                                                                  child: Text(
                                                                                                    "${bidData[index]['customer']['rating']['rate']}",
                                                                                                    style: TextStyle(color: CommonColor.WHITE_COLOR, fontSize: SizeConfig.blockSizeHorizontal * 2.7, fontWeight: FontWeight.w500, fontFamily: 'Roboto_Medium'),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsets.only(right: SizeConfig.screenWidth * 0.017),
                                                                                                child: Icon(
                                                                                                  Icons.star,
                                                                                                  size: SizeConfig.blockSizeHorizontal * 2.5,
                                                                                                  color: Colors.white,
                                                                                                ),
                                                                                              )
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        GestureDetector(
                                                                                          onTap: () {
                                                                                           /* if (items[index].advancePayment.mode == "CASH") {
                                                                                              ApiClient().getAcceptTransporterBid(bidData[index]['_id']).then((value) {
                                                                                                showDialog(
                                                                                                  context: context,
                                                                                                  builder: (BuildContext context) {
                                                                                                    return alert;
                                                                                                  },
                                                                                                ).then((value){
                                                                                                  Navigator.pop(context);
                                                                                                });
                                                                                                widget.mListener.addOrderPrentScreen("1");
                                                                                              });
                                                                                            } else if (items[index].advancePayment.mode == "ONLINE") {
                                                                                              Navigator.push(
                                                                                                  context,
                                                                                                  MaterialPageRoute(
                                                                                                      builder: (context) => BookingDetailsScreen(
                                                                                                            postId: items[index].id,
                                                                                                          )));
                                                                                            } else {
                                                                                              Container();
                                                                                            }*/
                                                                                            ApiClient().getAcceptTransporterBid(bidData[index]['_id']).then((value) {
                                                                                              showDialog(
                                                                                                context: context,
                                                                                                builder: (BuildContext context) {
                                                                                                  return alert;
                                                                                                },
                                                                                              ).then((value){
                                                                                                Navigator.pop(context);
                                                                                              });
                                                                                              widget.mListener.addOrderPrentScreen("1");
                                                                                            });
                                                                                          },
                                                                                          child: Container(
                                                                                            width: SizeConfig.screenWidth * 0.18,
                                                                                            height: SizeConfig.screenHeight * 0.03,
                                                                                            decoration: BoxDecoration(
                                                                                              color: CommonColor.SIGN_UP_TEXT_COLOR,
                                                                                              borderRadius: BorderRadius.circular(7),
                                                                                            ),
                                                                                            child: Row(
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              children: [
                                                                                                Text(
                                                                                                  "Book Now",
                                                                                                  style: TextStyle(color: CommonColor.WHITE_COLOR, fontSize: SizeConfig.blockSizeHorizontal * 3.0, fontWeight: FontWeight.w500, fontFamily: 'Roboto_Medium'),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.02),
                                                                                    child: Container(
                                                                                      height: SizeConfig.screenWidth * 0.003,
                                                                                      color: Colors.black12,
                                                                                      child: const Row(
                                                                                        children: [
                                                                                          Text(
                                                                                            "hii",
                                                                                            style: TextStyle(color: Colors.transparent),
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
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets.only(
                                                                top: SizeConfig
                                                                        .screenHeight *
                                                                    0.02,
                                                              ),
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              InterestedTransporterList(
                                                                                postId: items[index].id,
                                                                              )));
                                                                },
                                                                child: Container(
                                                                  width: SizeConfig
                                                                          .screenWidth *
                                                                      0.21,
                                                                  height: SizeConfig
                                                                          .screenHeight *
                                                                      0.04,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .transparent,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                10),
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        "View All",
                                                                        style: TextStyle(
                                                                            color: CommonColor
                                                                                .BLACK_COLOR,
                                                                            fontSize: SizeConfig.blockSizeHorizontal *
                                                                                4.0,
                                                                            fontWeight: FontWeight
                                                                                .w500,
                                                                            fontFamily:
                                                                                'Roboto_Medium'),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        // Visibility(
                                                        //   visible: transportList,
                                                        //     child: const CircularProgressIndicator()
                                                        // )
                                                      ],
                                                    )
                                                  : Container(),
                                            ),
                                            SizedBox(
                                              height:
                                                  SizeConfig.screenHeight * 0.02,
                                            )
                                          ],
                                        ),
                                      ),
                                      Visibility(
                                        visible: index == selectedTransListIndex,
                                        child: Container(
                                          height: SizeConfig.screenHeight * 0.04,
                                          width: SizeConfig.screenWidth * 0.4,
                                          decoration: BoxDecoration(
                                            color: CommonColor.SIGN_UP_TEXT_COLOR
                                                .withOpacity(0.9),
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          child: Center(
                                              child: Text(
                                            "No Bid Available.",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: SizeConfig
                                                        .blockSizeHorizontal *
                                                    3.7,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Roboto_Medium'),
                                          )),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                        },
                      )),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      EdgeInsets.only(bottom: SizeConfig.screenHeight * 0.03),
                  child: GestureDetector(
                    onDoubleTap: () {},
                    onTap: () {

                      if(companyName.isEmpty) {
                        showDialog<void>(
                          context: context,
                          barrierDismissible: false, // user must tap button!
                          builder: (BuildContext context) {
                            return AlertDialog(
                              shape:  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              title: const Text('Update Profile'),
                              content: const SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    Text('Please Firstly Update Your Profile.'),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: Container(
                                    height: SizeConfig.screenHeight*0.04,
                                    width: SizeConfig.screenWidth*0.15,
                                    decoration: BoxDecoration(
                                      color: CommonColor.APP_BAR_COLOR,
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                      child: const Center(child: Text('OK',
                                      style: TextStyle(
                                        color: Colors.white
                                      ),))
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }else{
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (
                                    context) => const NewLoadScreenForm()));
                      }
                    },
                    child: Container(
                      height: SizeConfig.screenHeight * 0.05,
                      width: SizeConfig.screenWidth * 0.33,
                      decoration: BoxDecoration(
                          color: CommonColor.SIGN_UP_TEXT_COLOR,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding:
                            EdgeInsets.only(left: SizeConfig.screenWidth * 0.03),
                        child: Row(
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: SizeConfig.screenHeight * 0.035,
                                  width: SizeConfig.screenWidth * 0.07,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle),
                                ),
                                const Icon(Icons.add)
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: SizeConfig.screenWidth * 0.02),
                              child: Text(
                                "New Load",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal * 4.0,
                                    fontFamily: "Roboto_Medium",
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Visibility(
                visible: isLoading, child: const CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }

  Widget getAdvContainer(double parentHeight, double parentWidth) {
    return Padding(
      padding: EdgeInsets.only(
          top: SizeConfig.screenHeight * 0.02,
          bottom: SizeConfig.screenHeight * 0.02,
          left: SizeConfig.screenWidth * 0.03,
          right: SizeConfig.screenWidth * 0.03),
      child: Container(
        height: SizeConfig.screenHeight * 0.2,
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
        child: const Image(
          image: AssetImage("assets/images/adv_demo.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget getInfoCardLayout(double parentHeight, double parentWidth, int index) {
    DateTime tempDate = DateFormat("yyyy-MM-dd").parse(items[index].pickupDate);
    var inputDate = DateTime.parse(tempDate.toString());
    var outputFormat = DateFormat('dd MMMM yyyy');
    pickUpDate = outputFormat.format(inputDate);

    DateTime parseDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
        .parse(items[index].pickupDate);
    var inputTime = DateTime.parse(parseDate.toString());
    var inputFormat = DateFormat('hh:mm a');
    pickUpTime = inputFormat.format(inputTime);

    DateTime tempCreateDate =
        DateFormat("yyyy-MM-dd").parse(items[index].createdAt);
    var inputCreateDate = DateTime.parse(tempCreateDate.toString());
    var outputCreateFormat = DateFormat('dd MMMM yyyy');
    createPostDate = outputCreateFormat.format(inputCreateDate);

    DateTime parseCreateDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
        .parse(items[index].createdAt);
    var inputCreateTime = DateTime.parse(parseCreateDate.toString());
    var inputCreateFormat = DateFormat('hh:mm a');
    createPostTime = inputCreateFormat.format(inputCreateTime);

    pickUpLocation =
        "${items[index].pickup.address.street}, ${items[index].pickup.address.city}, ${items[index].pickup.address.state}, ${items[index].pickup.address.country}, ${items[index].pickup.address.postalCode}";

    // print(pickUpLocation);

    finalLocation =
        "${items[index].receiver.address?.street}, ${items[index].receiver.address?.city}, ${items[index].receiver.address?.state}, ${items[index].receiver.address?.country}, ${items[index].receiver.address?.postalCode}";

    final endTime = DateTime.parse(items[index].postExpiryDate);
    Duration remainingTime = endTime.difference(DateTime.now());

    final formattedTime = _printDuration(remainingTime);

    return Padding(
      padding: EdgeInsets.only(top: parentHeight * 0.015),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(right: SizeConfig.screenWidth * 0.05, left: parentWidth*0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: items[index].lowestBid != 0 ? true : false,
                  child: Row(
                    children: [
                      Container(
                        height: parentHeight*0.007,
                        width: parentWidth*0.015,
                        decoration: BoxDecoration(
                            color: CommonColor.APP_BAR_COLOR,
                          borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: parentWidth*0.007),
                        child: Text(
                          "Tap to View Transporter Bid",
                          style: TextStyle(
                              color: CommonColor.APP_BAR_COLOR,
                              fontSize: SizeConfig.blockSizeHorizontal * 2.0,
                              fontFamily: "Roboto_Medium",
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Time Left  $formattedTime",
                  style: TextStyle(
                      color: CommonColor.TO_AREA_COLOR,
                      fontSize: SizeConfig.blockSizeHorizontal * 3.0,
                      fontFamily: "Roboto_Medium",
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: parentWidth * 0.05, top: parentHeight * 0.01),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: parentHeight * 0.01,
                          width: parentWidth * 0.021,
                          decoration: const BoxDecoration(
                              color: CommonColor.FROM_AREA_COLOR,
                              shape: BoxShape.circle),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: SizeConfig.screenWidth * 0.02),
                          child: Container(
                            width: parentWidth * 0.57,
                            color: Colors.transparent,
                            child: Text(
                              "$pickUpLocation",
                              style: TextStyle(
                                  color: CommonColor.BLACK_COLOR,
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal * 3.0,
                                  fontFamily: "Roboto_Medium",
                                  fontWeight: FontWeight.w400),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: SizeConfig.screenWidth * 0.01),
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
                          decoration: const BoxDecoration(
                              color: CommonColor.TO_AREA_COLOR,
                              shape: BoxShape.circle),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: parentWidth * 0.02),
                          child: Container(
                            width: parentWidth * 0.4,
                            color: Colors.transparent,
                            child: Text(
                              "$finalLocation",
                              style: TextStyle(
                                  color: CommonColor.BLACK_COLOR,
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal * 3.0,
                                  fontFamily: "Roboto_Medium",
                                  fontWeight: FontWeight.w400),
                              overflow: TextOverflow.ellipsis,
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
                                text: ' ${items[index].fare}/-',
                                style: TextStyle(
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal * 4.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold))
                          ]),
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Post on  $createPostDate | $createPostTime",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: SizeConfig.blockSizeHorizontal * 3.0,
                      fontFamily: "Roboto_Regular",
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: parentWidth * 0.05, top: parentHeight * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  color: Colors.transparent,
                  width: parentWidth * 0.53,
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
                                  "$pickUpDate",
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Pick-up Time",
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
                            child: Container(
                              width: parentWidth * 0.18,
                              color: Colors.transparent,
                              child: Center(
                                child: Text(
                                  "$pickUpTime",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal * 3.5,
                                      fontFamily: "Roboto_Regular",
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: parentWidth * 0.05,
                top: parentHeight * 0.01,
                right: parentWidth * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                      text: 'Qty Of Load : ',
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                        fontSize: SizeConfig.blockSizeHorizontal * 3.2,
                      ),
                      children: [
                        TextSpan(
                            text:
                                '${items[index].loadDetail.load} ${items[index].loadDetail.loadUnit}',
                            style: TextStyle(
                                fontSize: SizeConfig.blockSizeHorizontal * 3.7,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Roboto_Regular'))
                      ]),
                ),
                GestureDetector(
                  onTap: () {
                    passPickIndexAddress =
                        "${items[index].pickup.address.street}, ${items[index].pickup.address.city}, ${items[index].pickup.address.district}, ${items[index].pickup.address.laneNumber}, ${items[index].pickup.address.state}, ${items[index].pickup.address.country}, ${items[index].pickup.address.postalCode}";

                    // print(passPickIndexAddress);

                    passLastIndexAddress =
                        "${items[index].receiver.address?.street}, ${items[index].receiver.address?.city}, ${items[index].receiver.address?.district}, ${items[index].receiver.address?.laneNumber} ${items[index].receiver.address?.state}, ${items[index].receiver.address?.country}, ${items[index].receiver.address?.postalCode}";

                    DateTime tempDate =
                        DateFormat("yyyy-MM-dd").parse(items[index].pickupDate);
                    var inputDate = DateTime.parse(tempDate.toString());
                    var outputFormat = DateFormat('dd MMMM yyyy');
                    pickUpIndexDate = outputFormat.format(inputDate);

                    DateTime parseDate =
                        DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
                            .parse(items[index].pickupDate);
                    var inputTime = DateTime.parse(parseDate.toString());
                    var inputFormat = DateFormat('hh:mm a');
                    pickUpIndexTime = inputFormat.format(inputTime);

                    showCupertinoDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (context) {
                        return AnimatedOpacity(
                            opacity: 1.0,
                            duration: const Duration(seconds: 2),
                            child: LoadMoreInfoDialog(
                              postDetails: items,
                              postIndex: index,
                              pickupDate: pickUpIndexDate.toString(),
                              pickupTime: pickUpIndexTime.toString(),
                              pickupLocation: passPickIndexAddress.toString(),
                              finalLocation: passLastIndexAddress.toString(),
                              openFrom: "3",
                            ));
                      },
                    );
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "More",
                        style: TextStyle(
                            color: CommonColor.SIGN_UP_TEXT_COLOR,
                            fontSize: SizeConfig.blockSizeHorizontal * 3.7,
                            fontFamily: "Roboto_Medium",
                            fontWeight: FontWeight.w500),
                      ),
                    ),
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
    );
  }

  Widget getTransporterListHeading(double parentHeight, double parentWidth) {
    return Padding(
      padding: EdgeInsets.only(
        top: parentHeight * 0.025,
        left: parentWidth * 0.05,
        right: parentWidth * 0.05,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Interested Transporter List",
            style: TextStyle(
                color: CommonColor.BLACK_COLOR,
                fontSize: SizeConfig.blockSizeHorizontal * 5.0,
                fontWeight: FontWeight.w500,
                fontFamily: 'Roboto_Medium'),
          ),

          /*GestureDetector(
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
                  child: Image(image: AssetImage("assets/images/filter_icon.png")),
                )
            ),
          )*/
        ],
      ),
    );
  }

  Future<Map<String, dynamic>> getAllBidsAgainstPostLimited(
      String postId) async {
    String url = "${ApiConstants().baseUrl}post/bid/$postId/?limit=3";

    String? sessionToken =
        GetStorage().read<String>(ConstantData.userAccessToken);

    if (mounted) {
      setState(() {
        transportList = true;
      });
    }

    try {
      Response response = await _dio.get(
        url,
        options: Options(
          headers: {
            'Authorization': 'Bearer $sessionToken',
          },
        ),
      );

      print("getAllBidsAgainstPostLimitedSC --> ${response.statusCode}");
      print("getAllBidsAgainstPostLimitedData --> ${response.data}");

      if (response.statusCode == 200) {
        bidData = response.data['data'] as List;
        print("jsonList $bidData");
        if (mounted) {
          setState(() {
            transportList = false;
          });
        }
      }

      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }
}

abstract class HomeChildScreenListener {
  addOrderPrentScreen(String comeFrom);
}
