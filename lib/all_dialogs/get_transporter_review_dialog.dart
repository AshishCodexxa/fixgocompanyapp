import 'package:fixgocompanyapp/common_file/common_color.dart';
import 'package:fixgocompanyapp/common_file/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';




class GetTransporterReview extends StatefulWidget {

  const GetTransporterReview({Key? key}) : super(key: key);

  @override
  State<GetTransporterReview> createState() => _GetTransporterReviewState();
}

class _GetTransporterReviewState extends State<GetTransporterReview> {


  IconData? _selectedIcon;
  double _rating = 0.0;

  TextEditingController feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(
            left: SizeConfig.screenWidth * .09,
            right: SizeConfig.screenWidth * .09),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child:  Container(
            decoration:  const BoxDecoration(
              borderRadius:  BorderRadius.all(Radius.circular(25.0)),
              //color: CommonColor.RED_COLOR,
            ),
            child:  Stack(
              alignment: Alignment.topRight,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[

                    Padding(
                      padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.03),
                      child: Text("Mahesh Transporter",
                        style: TextStyle(
                            color: CommonColor.BLACK_COLOR,
                            fontSize: SizeConfig.blockSizeHorizontal*5.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto_Medium'
                        ),),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01),
                      child: Text("Pune",
                        style: TextStyle(
                            color: CommonColor.BLACK_COLOR,
                            fontSize: SizeConfig.blockSizeHorizontal*3.5,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto_Regular'
                        ),),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.02, left: SizeConfig.screenWidth*0.1,
                          right: SizeConfig.screenWidth*0.1),
                      child: RatingBar.builder(
                        initialRating: 0.5,
                        minRating: 0.5,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        unratedColor: CommonColor.BLACK_COLOR,
                        itemCount: 5,
                        itemSize: 30.0,
                        itemPadding: EdgeInsets.symmetric(horizontal: 5.0),
                        itemBuilder: (context, _) => Icon(
                          _selectedIcon ?? Icons.star_outlined,
                          color: CommonColor.SIGN_UP_TEXT_COLOR,
                        ),
                        ignoreGestures: false,
                        onRatingUpdate: (rating) {
                          setState(() {
                            _rating = rating;
                          });
                        },
                        updateOnDrag: false,
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.03,
                      right: SizeConfig.screenWidth*0.03,
                      top: SizeConfig.screenHeight*0.02),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black)
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01),
                          child: Container(
                            color: Colors.transparent,
                            child: TextFormField(
                              controller: feedbackController,
                              // focusNode: _userNameFocus,
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                label: Text("Write your Feedback here...",
                                  style: TextStyle(
                                    color:Colors.black54,
                                    fontWeight: FontWeight.w400,
                                    fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                  ),),
                                contentPadding: EdgeInsets.only(left: SizeConfig.screenWidth*0.05, right: SizeConfig.screenWidth*0.05),
                                enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.transparent)
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.transparent)
                                ),
                              ),
                              maxLines: 5,
                              minLines: 1,
                            ),

                          ),
                        ),
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
                            onDoubleTap: (){},
                            onTap: (){
                              // showCupertinoDialog(
                              //   context: context,
                              //   barrierDismissible: true,
                              //   builder: (context) {
                              //     return const AnimatedOpacity(
                              //         opacity: 1.0,
                              //         duration: Duration(seconds: 2),
                              //         child: GetTransporterReview());
                              //   },
                              // );

                            },
                            child: Container(
                              height: SizeConfig.screenHeight*0.04,
                              width: SizeConfig.screenWidth*0.4,
                              decoration: BoxDecoration(
                                  color: CommonColor.SIGN_UP_TEXT_COLOR,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Center(
                                child: Text("Submit",
                                  style: TextStyle(
                                      color: CommonColor.WHITE_COLOR,
                                      fontSize: SizeConfig.blockSizeHorizontal*4.5,
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
                      height: SizeConfig.screenHeight*0.03,
                    )

                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: GestureDetector(
                    onDoubleTap: (){},
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Icon(Icons.clear,
                        color: Colors.black,
                        size: SizeConfig.screenHeight*0.025,),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
