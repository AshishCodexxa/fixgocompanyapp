import 'package:fixgocompanyapp/all_dialogs/get_transporter_review_dialog.dart';
import 'package:fixgocompanyapp/common_file/common_color.dart';
import 'package:fixgocompanyapp/common_file/size_config.dart';
import 'package:fixgocompanyapp/data/dio_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class TransporterAmountPayDialog extends StatefulWidget {

  final String isComeFrom;
  final String advanceCashPayAmonut;
  final String bidId;

  const TransporterAmountPayDialog({Key? key, required this.isComeFrom, this.advanceCashPayAmonut = '', this.bidId = ''}) : super(key: key);

  @override
  State<TransporterAmountPayDialog> createState() => _TransporterAmountPayDialogState();
}

class _TransporterAmountPayDialogState extends State<TransporterAmountPayDialog> {

  @override
  void initState() {
    super.initState();
    print(widget.bidId);
  }



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
                      child: Text("Transporter",
                        style: TextStyle(
                            color: CommonColor.BLACK_COLOR,
                            fontSize: SizeConfig.blockSizeHorizontal*6.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto_Medium'
                        ),),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01),
                      child: Text("Amount To Pay",
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
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black12)
                        ),
                        child: Column(
                          children: [

                            Padding(
                              padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01,),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                      "Rs.${widget.advanceCashPayAmonut}/-",
                                      style: TextStyle(
                                          fontSize:
                                          SizeConfig.blockSizeHorizontal * 7.0,
                                          fontWeight: FontWeight.w500,
                                          color: CommonColor.BLACK_COLOR,
                                          fontFamily: 'Roboto_Medium')
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: SizeConfig.screenHeight*0.01,
                            )
                          ],
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(widget.isComeFrom == "1" ? "Advance Payment" :
                          widget.isComeFrom == "2" ? "Due Payment"
                            : "Advance Payment" ,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Roboto_Regular'
                            ),),
                        ],
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
                            onTap: (){

                              Navigator.pop(context);
                              showCupertinoDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (context) {
                                  return const AnimatedOpacity(
                                      opacity: 1.0,
                                      duration: Duration(seconds: 2),
                                      child: GetTransporterReview());
                                },
                              );


                            },
                            child: Container(
                              height: SizeConfig.screenHeight*0.05,
                              width: SizeConfig.screenWidth*0.5,
                              decoration: BoxDecoration(
                                  color: CommonColor.SIGN_UP_TEXT_COLOR,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Center(
                                child: Text(widget.isComeFrom == "3" ? "Cash Payment" : "Pay",
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
