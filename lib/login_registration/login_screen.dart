import 'package:fixgocompanyapp/common_file/common_color.dart';
import 'package:fixgocompanyapp/common_file/size_config.dart';
import 'package:fixgocompanyapp/data/data_constant/constant_data.dart';
import 'package:fixgocompanyapp/data/dio_client.dart';
import 'package:fixgocompanyapp/login_registration/otp_put_screen.dart';
import 'package:fixgocompanyapp/login_registration/sign_up_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl_phone_field/intl_phone_field.dart';




class LoginScreen extends StatefulWidget {

  final int userType;

  const LoginScreen({Key? key, required this.userType}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool isChecked = false;

  TextEditingController phoneNumberController = TextEditingController();

  String countryCode = "0";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: CommonColor.APP_BAR_COLOR,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          Container(
            // height: SizeConfig.screenWidth*0.99,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: CommonColor.WHITE_COLOR,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Sign In",
                        style: TextStyle(
                            color: CommonColor.SIGN_UP_TEXT_COLOR,
                            fontSize: SizeConfig.blockSizeHorizontal*6.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto_Medium'
                        ),),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(
                    top: SizeConfig.screenHeight*0.03,
                    left: SizeConfig.screenWidth*0.03,
                    right: SizeConfig.screenWidth*0.03,
                  ),
                  child: Container(
                    height: SizeConfig.screenHeight*0.11,
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
                    child:  Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: SizeConfig.screenWidth*0.03,
                            right: SizeConfig.screenWidth*0.03,
                          ),
                          child:   IntlPhoneField(
                            controller: phoneNumberController,
                            decoration: const InputDecoration(
                              labelText: 'Phone Number',
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black26)
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black26)
                              ),
                            ),
                            initialCountryCode: 'IN',
                           /* onCountryChanged: (Country){

                              countryCode = Country.dialCode;

                              print(Country.dialCode);

                              countryCode == "0" ? "+91" : "+$countryCode";


                            },*/
                          )
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.04,
                    left: SizeConfig.screenWidth*0.05,
                    right: SizeConfig.screenWidth*0.05,
                  ),
                  child: Row(
                    children: [
                      Container(
                        color: Colors.transparent,
                        height: SizeConfig.screenHeight * 0.07,
                        width: SizeConfig.screenWidth * 0.07,
                        child: Column(
                          children: <Widget>[
                            Checkbox(
                              checkColor: Colors.white,
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                  // print(isChecked);
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: SizeConfig.screenWidth * 0.01),
                            child: RichText(
                                text: const TextSpan(
                                    text: "I have read and agree to Fix Go",
                                    style: TextStyle(
                                        color: CommonColor.BLACK_COLOR,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Roboto-Regular',
                                        fontSize: 13),
                                    children: [
                                      TextSpan(
                                          text: " Privacy Policy ",
                                          style: TextStyle(
                                              color: CommonColor.BLACK_COLOR,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Roboto-Regular',
                                              fontSize: 13)),
                                      TextSpan(
                                          text: "and\n",
                                          style: TextStyle(
                                              color: CommonColor.BLACK_COLOR,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Roboto-Regular',
                                              fontSize: 13)),
                                      TextSpan(
                                        text: "Terms of Service.\n",
                                        style: TextStyle(
                                            color: CommonColor.BLACK_COLOR,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Roboto-Regular',
                                            fontSize: 13),
                                      )
                                    ])),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.02,
                    left: SizeConfig.screenWidth*0.05,
                    right: SizeConfig.screenWidth*0.05,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){

                          if(phoneNumberController.text.isEmpty || phoneNumberController.text.length < 10){
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(content: Text("Please Enter a Valid Mobile Number")));
                          }else if(isChecked == false){
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(content: Text("Please Check the Privacy Policy and Terms of Service.")));
                          }else{
                             ApiClient().login(phoneNumberController.text.trim()).then((value){

                              if(value.isEmpty) return;

                              // print(value['data']['hash']);

                              GetStorage().write(ConstantData.otpHashKey, value['data']['hash']);

                              GetStorage().write(ConstantData.userMobileNumber, value['data']['phone']);

                              // print(GetStorage().read<String>(ConstantData.userMobileNumber));

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(content: Text("${value['message']}")));

                              phoneNumberController.clear();

                              Navigator.push(context, MaterialPageRoute(builder: (context)=>const OtpPutScreen()));

                             });
                          }


                        },
                        child: Container(
                          height: SizeConfig.screenHeight*0.055,
                          width: SizeConfig.screenWidth*0.7,
                          decoration: BoxDecoration(
                              color: CommonColor.SIGN_UP_TEXT_COLOR,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Center(
                            child: Text("Send OTP",
                              style: TextStyle(
                                  color: CommonColor.WHITE_COLOR,
                                  fontSize: SizeConfig.blockSizeHorizontal*5.0,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Roboto_Medium'
                              ),),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: SizeConfig.screenWidth * 0.01,
                          top: SizeConfig.screenHeight*0.02),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUpDialog()));
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: RichText(
                              text: TextSpan(
                                  text: "New User?",
                                  style: const TextStyle(
                                      color: CommonColor.BLACK_COLOR,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Roboto-Regular',
                                      fontSize: 13),
                                  children: [
                                    TextSpan(
                                        text: " Create an account",
                                        style: TextStyle(
                                          color: CommonColor.SIGN_UP_TEXT_COLOR,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Roboto-Regular',
                                          fontSize: SizeConfig.blockSizeHorizontal*3.5,
                                          decoration: TextDecoration.underline,)),
                                  ])),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: SizeConfig.screenHeight*0.03,
                )

              ],
            ),
          )

        ],
      ),
    );
  }
}
