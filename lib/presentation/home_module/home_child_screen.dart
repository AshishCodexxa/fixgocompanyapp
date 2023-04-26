import 'package:fixgocompanyapp/all_dialogs/filter__transporter_list_dialog.dart';
import 'package:fixgocompanyapp/all_dialogs/load_more_info_dialog.dart';
import 'package:fixgocompanyapp/common_file/common_color.dart';
import 'package:fixgocompanyapp/common_file/size_config.dart';
import 'package:fixgocompanyapp/presentation/home_module/booking_details_screen.dart';
import 'package:fixgocompanyapp/presentation/home_module/create_new_load_form_layout.dart';
import 'package:fixgocompanyapp/presentation/home_module/interested_transporter_list.dart';
import 'package:fixgocompanyapp/presentation/home_module/transporter_info_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class HomeChildScreen extends StatefulWidget {

  final HomeChildScreenListener mListener;

  const HomeChildScreen({Key? key, required this.mListener}) : super(key: key);

  @override
  State<HomeChildScreen> createState() => _HomeChildScreenState();
}

class _HomeChildScreenState extends State<HomeChildScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomScrollView(
            slivers: <Widget>[

              SliverList(
                delegate: SliverChildListDelegate(
                  [
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
                                offset: const Offset(2, 6)),
                          ],
                        ),
                        child: getInfoCardLayout(SizeConfig.screenHeight, SizeConfig.screenWidth),
                      ),
                    )
                  ],
                ),
              ),

              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    getTransporterListHeading(SizeConfig.screenHeight, SizeConfig.screenWidth)
                  ],
                ),
              ),

             SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: 3,
                          (context, index) {
                        return Padding(
                            padding: EdgeInsets.only(
                              top: SizeConfig.screenHeight*0.02,
                            left: SizeConfig.screenWidth*0.05,
                            right: SizeConfig.screenWidth*0.05,
                            ),
                          child: GestureDetector(
                            onDoubleTap: (){},
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>TransporterProfile()));
                            },
                            child: Container(
                              color: Colors.transparent,
                              child: Column(
                                children: [

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [

                                      Text("Mahesh Transporter",
                                        style: TextStyle(
                                            color: CommonColor.BLACK_COLOR,
                                            fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Roboto_Regular'
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
                                                      fontSize: SizeConfig.blockSizeHorizontal*3.7,
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.w400))
                                            ]),
                                      ),

                                    ],
                                  ),

                                  Padding(
                                    padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.005),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text("Pune",
                                          style: TextStyle(
                                              color: CommonColor.BLACK_COLOR,
                                              fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Roboto_Regular'
                                          ),),
                                      ],
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.005),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text("Vehicle Available on : 1 Feb 23",
                                          style: TextStyle(
                                              color: CommonColor.BLACK_COLOR,
                                              fontSize: SizeConfig.blockSizeHorizontal*3.5,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Roboto_Regular'
                                          ),),
                                      ],
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.005),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: SizeConfig.screenWidth*0.13,
                                          height: SizeConfig.screenHeight*0.026,
                                          decoration: BoxDecoration(
                                            color: CommonColor.SIGN_UP_TEXT_COLOR,
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [

                                              Padding(
                                                padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.02),
                                                child: Text("4.5",
                                                  style: TextStyle(
                                                      color: CommonColor.WHITE_COLOR,
                                                      fontSize: SizeConfig.blockSizeHorizontal*3.5,
                                                      fontWeight: FontWeight.w500,
                                                      fontFamily: 'Roboto_Medium'
                                                  ),),
                                              ),

                                              Padding(
                                                padding: EdgeInsets.only(right: SizeConfig.screenWidth*0.017),
                                                child: Icon(Icons.star,
                                                size: SizeConfig.blockSizeHorizontal*3.0,
                                                color: Colors.white,),
                                              )

                                            ],
                                          ),
                                        ),

                                        GestureDetector(
                                          onDoubleTap: (){},
                                          onTap: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>BookingDetailsScreen()));
                                          },
                                          child: Container(
                                            width: SizeConfig.screenWidth*0.2,
                                            height: SizeConfig.screenHeight*0.033,
                                            decoration: BoxDecoration(
                                              color: CommonColor.SIGN_UP_TEXT_COLOR,
                                              borderRadius: BorderRadius.circular(7),
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [

                                                Text("Book Now",
                                                  style: TextStyle(
                                                      color: CommonColor.WHITE_COLOR,
                                                      fontSize: SizeConfig.blockSizeHorizontal*3.2,
                                                      fontWeight: FontWeight.w500,
                                                      fontFamily: 'Roboto_Medium'
                                                  ),),

                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.015),
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

                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    )
             ),


              SliverPadding(
                padding: EdgeInsets.only(bottom: SizeConfig.screenHeight*0.15),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Padding(
                        padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.02),
                        child: GestureDetector(
                          onDoubleTap: (){},
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>InterestedTransporterList()));
                          },
                          child: Container(
                            width: SizeConfig.screenWidth*0.21,
                            height: SizeConfig.screenHeight*0.04,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Text("View All",
                                  style: TextStyle(
                                      color: CommonColor.BLACK_COLOR,
                                      fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Roboto_Medium'
                                  ),),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.only(bottom: SizeConfig.screenHeight*0.03),
            child: GestureDetector(
              onDoubleTap: (){},
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>NewLoadScreenForm()));
              },
              child: Container(
                height: SizeConfig.screenHeight*0.05,
                width: SizeConfig.screenWidth*0.33,
                decoration: BoxDecoration(
                  color: CommonColor.SIGN_UP_TEXT_COLOR,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.03),
                  child: Row(
                    children: [

                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: SizeConfig.screenHeight*0.035,
                            width: SizeConfig.screenWidth*0.07,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle
                            ),
                          ),
                          Icon(Icons.add)
                        ],
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.02),
                        child: Text(
                          "New Load",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: SizeConfig.blockSizeHorizontal*4.0,
                              fontFamily: "Roboto_Medium",
                              fontWeight: FontWeight.w400
                          ),
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
    );
  }

  Widget getInfoCardLayout(double parentHeight, double parentWidth){
    return Padding(
      padding: EdgeInsets.only(top: parentHeight*0.01),
      child: Column(
        children: [

          Padding(
            padding: EdgeInsets.only(left: parentWidth*0.051),
            child: Row(
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
                          "City Avenue, Wakad",
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
                            text: ' 12000/-',
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
                      "Pune Station",
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
            padding: EdgeInsets.only(left: parentWidth*0.05, top: parentHeight*0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Post on 26th Jan 2023 | 10:30 am",
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
                                 "28 Jan 2023",
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
                               "Bid End Date",
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
                                 "27 Jan 2023",
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
                            text: '10 Ton(s)',
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
                          color: Colors.black,
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

  Widget getTransporterListHeading(double parentHeight, double parentWidth){
    return Padding(
      padding: EdgeInsets.only(
        top: parentHeight*0.025,
      left: parentWidth*0.05,
      right: parentWidth*0.05,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Text("Interested Transporter List",
            style: TextStyle(
                color: CommonColor.BLACK_COLOR,
                fontSize: SizeConfig.blockSizeHorizontal*5.0,
                fontWeight: FontWeight.w500,
                fontFamily: 'Roboto_Medium'
            ),),

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
                  child: Image(image: AssetImage("assets/images/filter_icon.png")),
                )
            ),
          )

        ],
      ),
    );
  }
}


abstract class HomeChildScreenListener{

}
