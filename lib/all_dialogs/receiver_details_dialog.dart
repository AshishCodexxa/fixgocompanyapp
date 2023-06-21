import 'package:fixgocompanyapp/common_file/common_color.dart';
import 'package:fixgocompanyapp/common_file/draw_dash_border_class.dart';
import 'package:fixgocompanyapp/common_file/size_config.dart';
import 'package:fixgocompanyapp/data/dio_client.dart';
import 'package:fixgocompanyapp/data/model/get_user_verify_info_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class ReceiverVerifyDialog extends StatefulWidget {

  final String customerId;

  const ReceiverVerifyDialog({Key? key, this.customerId = ''}) : super(key: key);

  @override
  State<ReceiverVerifyDialog> createState() => _ReceiverVerifyDialogState();
}

class _ReceiverVerifyDialogState extends State<ReceiverVerifyDialog> {

  var jsonList;

  String name = '';
  String number = '';
  String location = '';
  String describe = '';

  bool isLoader = false;

  @override
  void initState() {
    super.initState();

    print(widget.customerId);

    isLoader = true;

    ApiClient().getVerifyDetailingApi(widget.customerId).then((value){

      if(mounted){
        setState(() {

          jsonList = GetVerifyDetailingResponseModel.fromJson(value);

          print(jsonList.data);

          isLoader = false;

          if(jsonList.data != null){
            name = jsonList.data.name ?? '';
            number = jsonList.data.phone ?? '';
          }

        });
      }

    });



  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.screenHeight * 0.35,
      color: Colors.transparent,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
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
                        child: Text(name,
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
                        child: Text(number,
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
          Visibility(
            visible: isLoader,
              child: CircularProgressIndicator()
          )
        ],
      ),
    );
  }
}
