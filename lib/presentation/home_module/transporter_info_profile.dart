import 'package:fixgocompanyapp/common_file/common_color.dart';
import 'package:fixgocompanyapp/common_file/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';



class TransporterProfile extends StatefulWidget {
  const TransporterProfile({Key? key}) : super(key: key);

  @override
  State<TransporterProfile> createState() => _TransporterProfileState();
}

class _TransporterProfileState extends State<TransporterProfile> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: ListView(
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
                getTransporterProfile(SizeConfig.screenHeight, SizeConfig.screenWidth)
              ],
            ),
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
            child: Text("Transporter",
              style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal*6.0,
                  fontFamily: "Roboto_Medium",
                  fontWeight: FontWeight.w500,
                  color: CommonColor.WHITE_COLOR
              ),),
          ),
          const Icon(Icons.more_vert,
            color: Colors.transparent,)
        ],
      ),
    );
  }


  Widget getTransporterProfile(double parentHeight, double parentWidth){
    return Container(
      color: CommonColor.PROFILE_INFO_BACK_COLOR,
      child: Column(
        children: [

            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Stack(
                  children: [
                    Container(
                      height: parentHeight*0.27,
                      color: Colors.transparent,
                    ),
                    Container(
                      height: parentHeight*0.2,
                      color: CommonColor.UNSELECT_TYPE_COLOR,
                      child: Center(
                        child: Text("FixGo",
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeHorizontal*6.0,
                              fontFamily: "Roboto_Medium",
                              fontWeight: FontWeight.w500,
                              color: CommonColor.BLACK_COLOR
                          ),),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: parentWidth*0.05),
                  child: Container(
                    height: parentHeight*0.12,
                    width: parentWidth*0.26,
                    decoration: BoxDecoration(
                      color: CommonColor.TRANSPORTER_PROFILE_COLOR,
                      shape: BoxShape.circle
                    ),
                  ),
                )
              ],
            ),

          Padding(
            padding: EdgeInsets.only(left: parentWidth*0.05,
            right: parentWidth*0.05,
            top: parentHeight*0.03),
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
                      child: Image(image: AssetImage("assets/images/adhar_tag.png")),
                    )

                  ],
                ),

                Padding(
                  padding: EdgeInsets.only(top: parentHeight*0.01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Text("Pune, Maharashtra",
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
                      Container(
                        color: Colors.transparent,
                        width: parentWidth*0.45,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Text("Transporter",
                              style: TextStyle(
                                  fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                  fontFamily: "Roboto_Regular",
                                  fontWeight: FontWeight.w400,
                                  color: CommonColor.BLACK_COLOR
                              ),),

                            Container(
                              height: parentHeight*0.03,
                              width: parentWidth*0.003,
                              color: Colors.black12,
                            ),

                            Text("99 Trips",
                              style: TextStyle(
                                  fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                  fontFamily: "Roboto_Regular",
                                  fontWeight: FontWeight.w400,
                                  color: CommonColor.BLACK_COLOR
                              ),),


                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: parentWidth * 0.03),
                      child: RatingBar.builder(
                        initialRating: 4.5,
                        itemSize: 20,
                        glow: false,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        ignoreGestures: true,
                        itemCount: 5,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.black,
                        ),
                        onRatingUpdate: (rating) {
                          // myraiting = rating;
                        },
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),

          SizedBox(
            height: parentHeight*0.03,
          )

        ],
      ),
    );
  }
}
