import 'package:fixgocompanyapp/common_file/common_color.dart';
import 'package:fixgocompanyapp/common_file/draw_dash_border_class.dart';
import 'package:fixgocompanyapp/common_file/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class TransporterVerifyDialog extends StatefulWidget {
  const TransporterVerifyDialog({Key? key}) : super(key: key);

  @override
  State<TransporterVerifyDialog> createState() => _TransporterVerifyDialogState();
}

class _TransporterVerifyDialogState extends State<TransporterVerifyDialog> {


  IconData? _selectedIcon;
  double _rating = 0.0;


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.screenHeight * 0.4,
      color: Colors.transparent,
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            )),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: SizeConfig.screenHeight*0.05,
              decoration: const BoxDecoration(
                  color: CommonColor.SIGN_UP_TEXT_COLOR,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)
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
                  Text("Transporter Details",
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

            Padding(
              padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01),
              child: Row(
                children: [

                  Padding(
                    padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.02, left: SizeConfig.screenWidth*0.05),
                    child: Container(
                      height: SizeConfig.screenHeight*0.11,
                      width: SizeConfig.screenWidth*0.25,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        shape: BoxShape.circle
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.02, left: SizeConfig.screenWidth*0.05),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text("Mahesh Transporter",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Roboto_Bold',
                              fontWeight: FontWeight.w500,
                              fontSize: SizeConfig.blockSizeHorizontal*4.5
                          ),),

                        Padding(
                          padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.003),
                          child: RatingBar.builder(
                            initialRating: 4.5,
                            minRating: 0.5,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            unratedColor: CommonColor.BLACK_COLOR,
                            itemCount: 5,
                            itemSize: 25.0,
                            itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                            itemBuilder: (context, _) => Icon(
                              _selectedIcon ?? Icons.star_rate_rounded,
                              color: CommonColor.SIGN_UP_TEXT_COLOR,
                            ),
                            ignoreGestures: true,
                            onRatingUpdate: (rating) {
                              setState(() {
                                // _rating = rating;
                              });
                            },
                            updateOnDrag: false,
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Icon(Icons.location_on,
                              color: Colors.black,),

                              Container(
                                width: SizeConfig.screenWidth*0.55,
                                color: Colors.transparent,
                                child: Text("Pune , Maharashtra",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Roboto_Regular',
                                      fontWeight: FontWeight.w500,
                                      fontSize: SizeConfig.blockSizeHorizontal*4.5
                                  ),),
                              ),

                            ],
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01),
                          child: Row(
                            children: [

                              Icon(Icons.phone_android_outlined,
                                color: Colors.black,),

                              Text("9857624589",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Roboto_Regular',
                                    fontWeight: FontWeight.w500,
                                    fontSize: SizeConfig.blockSizeHorizontal*4.5
                                ),),

                            ],
                          ),
                        )

                      ],
                    ),
                  )

                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.1,
              right: SizeConfig.screenWidth*0.1,
              top: SizeConfig.screenHeight*0.02),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.black)
                ),
                child:  Padding(
                  padding:  EdgeInsets.only(top: SizeConfig.screenHeight*0.015,
                  bottom: SizeConfig.screenHeight*0.015),
                  child: Row(
                    children: [

                      Padding(
                        padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.0,
                            left: SizeConfig.screenWidth*0.05),
                        child: Container(
                          height: SizeConfig.screenHeight*0.054,
                          width: SizeConfig.screenWidth*0.13,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.0,
                            left: SizeConfig.screenWidth*0.05),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text("GST Verified",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Roboto_Medium',
                                  fontWeight: FontWeight.w500,
                                  fontSize: SizeConfig.blockSizeHorizontal*4.5
                              ),),

                            Padding(
                              padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.005),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("GST No : 8659566666 B7UL",
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontFamily: 'Roboto_Medium',
                                        fontWeight: FontWeight.w500,
                                        fontSize: SizeConfig.blockSizeHorizontal*3.5
                                    ),),

                                ],
                              ),
                            ),


                          ],
                        ),
                      )

                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
