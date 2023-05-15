import 'package:fixgocompanyapp/common_file/common_color.dart';
import 'package:fixgocompanyapp/common_file/draw_dash_border_class.dart';
import 'package:fixgocompanyapp/common_file/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class ReceiverVerifyDialog extends StatefulWidget {
  const ReceiverVerifyDialog({Key? key}) : super(key: key);

  @override
  State<ReceiverVerifyDialog> createState() => _ReceiverVerifyDialogState();
}

class _ReceiverVerifyDialogState extends State<ReceiverVerifyDialog> {


  IconData? _selectedIcon;
  double _rating = 0.0;


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.screenHeight * 0.35,
      color: Colors.transparent,
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            )),
        child: Column(
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
                  Text("Receiver Details",
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
              padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.02, left: SizeConfig.screenWidth*0.05),
              child: Row(
                children: [
                  Container(
                    height: SizeConfig.screenHeight*0.03,
                    width: SizeConfig.screenWidth*0.07,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.05),
                    child: Text("Nikita Mahindrakar",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Roboto_Medium',
                          fontWeight: FontWeight.w500,
                          fontSize: SizeConfig.blockSizeHorizontal*4.0
                      ),),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.02, left: SizeConfig.screenWidth*0.05),
              child: Row(
                children: [
                  Icon(Icons.phone_android_outlined),
                  Padding(
                    padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.05),
                    child: Text("9856321478",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Roboto_Regular',
                          fontWeight: FontWeight.w500,
                          fontSize: SizeConfig.blockSizeHorizontal*4.0
                      ),),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.02, left: SizeConfig.screenWidth*0.05),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.location_on),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.05),
                        child: Text("Receiver Location",
                          style: TextStyle(
                              color: Colors.black38,
                              fontFamily: 'Roboto_Regular',
                              fontWeight: FontWeight.w500,
                              fontSize: SizeConfig.blockSizeHorizontal*4.0
                          ),),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.05,
                            top: SizeConfig.screenHeight*0.01),
                        child: Container(
                          color: Colors.transparent,
                          width: SizeConfig.screenWidth*0.8,
                          child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                            style: TextStyle(
                                color: Colors.black38,
                                fontFamily: 'Roboto_Regular',
                                fontWeight: FontWeight.w500,
                                fontSize: SizeConfig.blockSizeHorizontal*4.0
                            ),),
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
    );
  }
}
