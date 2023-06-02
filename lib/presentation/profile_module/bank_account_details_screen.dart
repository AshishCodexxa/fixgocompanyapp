import 'package:fixgocompanyapp/common_file/common_color.dart';
import 'package:fixgocompanyapp/common_file/size_config.dart';
import 'package:flutter/material.dart';




class BankAccountDetailsScreen extends StatefulWidget {
  const BankAccountDetailsScreen({Key? key}) : super(key: key);

  @override
  State<BankAccountDetailsScreen> createState() => _BankAccountDetailsScreenState();
}

class _BankAccountDetailsScreenState extends State<BankAccountDetailsScreen> {


  TextEditingController bankNameController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController reAccountNumberController = TextEditingController();
  TextEditingController bankIFSCController = TextEditingController();

  final _bankNameFocus = FocusNode();
  final _accountNumberFocus = FocusNode();
  final _reAccountNumberFocus = FocusNode();
  final _bankIFSCFocus = FocusNode();


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
            height: SizeConfig.screenHeight*0.88,
            child: getAllBankFields(SizeConfig.screenHeight, SizeConfig.screenWidth)
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
            child: Text("Bank Account",
              style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal*5.5,
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

  Widget getAllBankFields(double parentHeight, double parentWidth){
    return Padding(
      padding: EdgeInsets.only(left: parentWidth*0.015,
      top: parentHeight*0.03,
      right: parentWidth*0.015),
      child: Column(
        children: [

          Padding(
            padding: EdgeInsets.only(left: parentWidth*0.02,
                right: parentWidth*0.02),
            child: Row(
              children: [
                Text("Enter Bank Details",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Roboto_Medium',
                      fontSize: SizeConfig.blockSizeHorizontal*4.5,
                      fontWeight: FontWeight.w500
                  ),),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(
              top: parentHeight*0.02,
              left: parentWidth*0.01,
              right: parentWidth*0.01,
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
                  top: parentHeight*0.01,
                  left: parentWidth*0.03,
                  right: parentWidth*0.03,
                ),
                child: TextFormField(
                  controller: bankNameController,
                  focusNode: _bankNameFocus,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: parentWidth*0.03),
                    label: RichText(
                      text: TextSpan(
                          text: 'Name',
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

          Padding(
            padding: EdgeInsets.only(
              top: parentHeight*0.02,
              left: parentWidth*0.01,
              right: parentWidth*0.01,
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
                  top: parentHeight*0.01,
                  left: parentWidth*0.03,
                  right: parentWidth*0.03,
                ),
                child: TextFormField(
                  controller: accountNumberController,
                  focusNode: _accountNumberFocus,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: parentWidth*0.03),
                    label: RichText(
                      text: TextSpan(
                          text: 'Account Number',
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

          Padding(
            padding: EdgeInsets.only(
              top: parentHeight*0.02,
              left: parentWidth*0.01,
              right: parentWidth*0.01,
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
                  top: parentHeight*0.01,
                  left: parentWidth*0.03,
                  right: parentWidth*0.03,
                ),
                child: TextFormField(
                  controller: reAccountNumberController,
                  focusNode: _reAccountNumberFocus,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: parentWidth*0.03),
                    label: RichText(
                      text: TextSpan(
                          text: 'Re-enter Account Number',
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

          Padding(
            padding: EdgeInsets.only(
              top: parentHeight*0.02,
              left: parentWidth*0.01,
              right: parentWidth*0.01,
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
                  top: parentHeight*0.01,
                  left: parentWidth*0.03,
                  right: parentWidth*0.03,
                ),
                child: TextFormField(
                  controller: bankIFSCController,
                  focusNode: _bankIFSCFocus,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: parentWidth*0.03),
                    label: RichText(
                      text: TextSpan(
                          text: 'IFSC',
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

          Padding(
            padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.07,
              left: SizeConfig.screenWidth*0.03,
              right: SizeConfig.screenWidth*0.03,
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
                  },
                  child: Container(
                    height: SizeConfig.screenHeight*0.057,
                    width: SizeConfig.screenWidth*0.7,
                    decoration: BoxDecoration(
                        color: CommonColor.SIGN_UP_TEXT_COLOR,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: Text("Confirm",
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

        ],
      ),
    );
  }
}
