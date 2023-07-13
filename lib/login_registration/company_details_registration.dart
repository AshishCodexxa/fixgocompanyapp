import 'package:fixgocompanyapp/all_dialogs/register_success_dialog.dart';
import 'package:fixgocompanyapp/common_file/common_color.dart';
import 'package:fixgocompanyapp/common_file/size_config.dart';
import 'package:fixgocompanyapp/data/data_constant/constant_data.dart';
import 'package:fixgocompanyapp/data/dio_client.dart';
import 'package:fixgocompanyapp/login_registration/kyc_verification_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';




class CompanyDetailsRegistrationScreen extends StatefulWidget {
  const CompanyDetailsRegistrationScreen({Key? key}) : super(key: key);

  @override
  State<CompanyDetailsRegistrationScreen> createState() => _CompanyDetailsRegistrationScreenState();
}

class _CompanyDetailsRegistrationScreenState extends State<CompanyDetailsRegistrationScreen> {

  TextEditingController userNameController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController companyLocationController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  final _userNameFocus = FocusNode();
  final _companyNameFocus = FocusNode();
  final _companyLocationFocus = FocusNode();

  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    if(mounted){
      setState(() {
        isLoading = true;
      });
    }

    ApiClient().getUserProfileData().then((value){

      GetStorage().write(ConstantData.userName, value['data']['name']);
      GetStorage().write(ConstantData.companyName, value['data']['companyName']);
      GetStorage().write(ConstantData.companyAddress, value['data']['companyAddress']);

      userNameController.text = value['data']['name'];
      companyNameController.text = value['data']['companyName'];
      companyLocationController.text = value['data']['companyAddress'];

      if(mounted){
        setState(() {
          isLoading = false;
        });
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [

          Container(
            height: SizeConfig.screenHeight*0.12,
            color: CommonColor.APP_BAR_COLOR,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.05),
                  child: Text("Registration",
                    style: TextStyle(
                        color: CommonColor.WHITE_COLOR,
                        fontSize: SizeConfig.blockSizeHorizontal*6.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto_Medium'
                    ),),
                ),
              ],
            ),
          ),

          SizedBox(
            height: SizeConfig.screenHeight*0.88,
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(bottom: SizeConfig.screenHeight*0.03),
              children: [
                getAllFieldLayout(SizeConfig.screenHeight, SizeConfig.screenWidth)
              ],
            ),
          )

        ],
      ),
    );
  }

  Widget getAllFieldLayout(double parentHeight, double parentWidth){
    return Column(
      children: [

        Padding(
          padding: EdgeInsets.only(
            top: parentHeight*0.02,
            left: parentWidth*0.03,
            right: parentWidth*0.03,
          ),
          child: Container(
            height: parentHeight*0.11,
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
                    left: parentWidth*0.03,
                    right: parentWidth*0.03,
                  ),
                  child: TextFormField(
                    controller: userNameController,
                    focusNode: _userNameFocus,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person,
                        color: Colors.black,),
                      label: RichText(
                        text: TextSpan(
                            text: 'User Name',
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w400,
                              fontSize: SizeConfig.blockSizeHorizontal*3.5,
                            ),
                            children: [
                              TextSpan(
                                  text: '*',
                                  style: TextStyle(
                                      fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold))
                            ]),
                      ),
                      labelStyle: TextStyle(
                          color: CommonColor.REGISTER_HINT_COLOR,
                          fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                          fontFamily: 'Roboto_Regular'),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: parentWidth*0.04, top: parentHeight*0.01),
                      child: Text("( Write User Full Name )",
                        style: TextStyle(
                            color: CommonColor.REGISTER_HINT_COLOR,
                            fontSize: SizeConfig.blockSizeHorizontal*3.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto_Regular'
                        ),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.only(
            top: parentHeight*0.02,
            left: parentWidth*0.03,
            right: parentWidth*0.03,
          ),
          child: Container(
            height: parentHeight*0.09,
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
            child:  Padding(
              padding: EdgeInsets.only(
                top: parentHeight*0.0,
                left: parentWidth*0.03,
                right: parentWidth*0.03,
              ),
              child: TextFormField(
                controller: companyNameController,
                focusNode: _companyNameFocus,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  prefixIcon: const Image(image: AssetImage("assets/images/company.png"),),
                  label: RichText(
                    text: TextSpan(
                        text: 'Company Name',
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w400,
                          fontSize: SizeConfig.blockSizeHorizontal*3.5,
                        ),
                        children: [
                          TextSpan(
                              text: '*',
                              style: TextStyle(
                                  fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold))
                        ]),
                  ),
                  labelStyle: TextStyle(
                      color: CommonColor.REGISTER_HINT_COLOR,
                      fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                      fontFamily: 'Roboto_Regular'),
                ),
              ),
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.only(
            top: parentHeight*0.02,
            left: parentWidth*0.03,
            right: parentWidth*0.03,
          ),
          child: Container(
            height: parentHeight*0.09,
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
            child:  Padding(
              padding: EdgeInsets.only(
                top: parentHeight*0.0,
                left: parentWidth*0.03,
                right: parentWidth*0.03,
              ),
              child: TextFormField(
                controller: companyLocationController,
                focusNode: _companyLocationFocus,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  prefixIcon: const Image(image: AssetImage("assets/images/company_location.png"),),
                  label: RichText(
                    text: TextSpan(
                        text: 'Company Location',
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w400,
                          fontSize: SizeConfig.blockSizeHorizontal*3.5,
                        ),
                        children: [
                          TextSpan(
                              text: '*',
                              style: TextStyle(
                                  fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold))
                        ]),
                  ),
                  labelStyle: TextStyle(
                      color: CommonColor.REGISTER_HINT_COLOR,
                      fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                      fontFamily: 'Roboto_Regular'),
                ),
              ),
            ),
          ),
        ),

        /*Padding(
          padding: EdgeInsets.only(
            top: parentHeight*0.02,
            left: parentWidth*0.03,
            right: parentWidth*0.03,
          ),
          child: Container(
            height: parentHeight*0.09,
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
            child:  Padding(
              padding: EdgeInsets.only(
                top: parentHeight*0.0,
                left: parentWidth*0.03,
                right: parentWidth*0.03,
              ),
              child: TextFormField(
                controller: mobileNumberController,
                focusNode: _mobileNumberFocus,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.phone_android_outlined,
                    color: Colors.black,),
                  label: RichText(
                    text: TextSpan(
                        text: 'Mobile Number',
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w400,
                          fontSize: SizeConfig.blockSizeHorizontal*3.5,
                        ),
                        children: [
                          TextSpan(
                              text: '*',
                              style: TextStyle(
                                  fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold))
                        ]),
                  ),
                  labelStyle: TextStyle(
                      color: CommonColor.REGISTER_HINT_COLOR,
                      fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                      fontFamily: 'Roboto_Regular'),
                ),
              ),
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.only(
            top: parentHeight*0.02,
            left: parentWidth*0.03,
            right: parentWidth*0.03,
          ),
          child: Container(
            height: parentHeight*0.09,
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
            child:  Padding(
              padding: EdgeInsets.only(
                top: parentHeight*0.0,
                left: parentWidth*0.03,
                right: parentWidth*0.03,
              ),
              child: TextFormField(
                controller: otpController,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.phone_android_outlined,
                    color: Colors.black,),
                  label: RichText(
                    text: TextSpan(
                        text: 'Enter Your OTP',
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w400,
                          fontSize: SizeConfig.blockSizeHorizontal*3.5,
                        ),
                        children: [

                        ]),
                  ),
                  labelStyle: TextStyle(
                      color: CommonColor.REGISTER_HINT_COLOR,
                      fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                      fontFamily: 'Roboto_Regular'),
                ),
              ),
            ),
          ),
        ),
*/

        Padding(
          padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.07,
            left: SizeConfig.screenWidth*0.05,
            right: SizeConfig.screenWidth*0.05,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  // showCupertinoDialog(
                  //   context: context,
                  //   barrierDismissible: true,
                  //   builder: (context) {
                  //     return const AnimatedOpacity(
                  //         opacity: 1.0,
                  //         duration: Duration(seconds: 2),
                  //         child: RegisterSuccessDialog());
                  //   },
                  // );

                  if(mounted){
                    setState(() {
                      isLoading = true;
                    });
                  }

                  ApiClient().editUserProfileData(
                    userNameController.text,
                    companyNameController.text,
                    '',
                    companyLocationController.text,
                    [],
                    [],
                    '',
                    '',
                    '',
                    '',
                    isLoading
                  ).then((value){

                    if(mounted){
                      setState(() {
                        isLoading = false;
                      });
                    }


                    ApiClient().getUserProfileData().then((value) {
                      if (value.isEmpty) return;

                      GetStorage().write(ConstantData.userName, value['data']['name']);
                      GetStorage().write(ConstantData.companyName, value['data']['companyName']);
                      GetStorage().write(ConstantData.companyAddress, value['data']['companyAddress']);

                      Navigator.push(context, MaterialPageRoute(builder: (context) => const KYCVerifyScreen()));

                    });


                  });


                },
                child: Container(
                  height: SizeConfig.screenHeight*0.057,
                  width: SizeConfig.screenWidth*0.7,
                  decoration: BoxDecoration(
                      color: CommonColor.SIGN_UP_TEXT_COLOR,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text("Submit",
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

        SizedBox(
          height: parentHeight*0.03,
        )

      ],
    );
  }
}
