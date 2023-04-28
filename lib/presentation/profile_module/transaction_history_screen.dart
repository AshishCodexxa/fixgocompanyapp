import 'package:fixgocompanyapp/common_file/common_color.dart';
import 'package:fixgocompanyapp/common_file/size_config.dart';
import 'package:flutter/material.dart';





class TransactionHistoryScreen extends StatefulWidget {
  const TransactionHistoryScreen({Key? key}) : super(key: key);

  @override
  State<TransactionHistoryScreen> createState() => _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        children: [

          Container(
            color: CommonColor.APP_BAR_COLOR,
            height: SizeConfig.safeUsedHeight * .12,
            child: getTopText(SizeConfig.screenHeight, SizeConfig.screenWidth),
          ),

          Container(
            height: SizeConfig.screenHeight*0.88,
            child: ListView.builder(
                itemCount: 10,
                padding: EdgeInsets.only(
                    bottom: SizeConfig.screenHeight * 0.02),
                itemBuilder: (BuildContext context, int index) {
                  return getAllNotificationLayout(SizeConfig.screenHeight, SizeConfig.screenWidth);
                }
            ),
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
            onDoubleTap: (){},
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
            child: Text("Transaction History",
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

  Widget getAllNotificationLayout(double parentHeight, double parentWidth){
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: parentHeight*0.02,
              left: parentWidth*0.05, right: parentWidth*0.05
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: SizeConfig.screenHeight*0.041,
                    width: SizeConfig.screenWidth*0.092,
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: parentWidth*0.03),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Paid To",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Roboto_Regular',
                              fontSize: SizeConfig.blockSizeHorizontal*3.5,
                              fontWeight: FontWeight.w500
                          ),),
                        Text("Mahesh Transporter",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Roboto_Regular',
                              fontSize: SizeConfig.blockSizeHorizontal*4.0,
                              fontWeight: FontWeight.w500,
                              height: SizeConfig.screenHeight*0.0017
                          ),),
                      ],
                    ),
                  ),
                ],
              ),
              Text("Rs 2000",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Roboto_Regular',
                    fontSize: SizeConfig.blockSizeHorizontal*4.0,
                    fontWeight: FontWeight.w500
                ),),
            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.only(top: parentHeight*0.01,
              left: parentWidth*0.05, right: parentWidth*0.05
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("1 day ago",
                style: TextStyle(
                    color: Colors.black38,
                    fontFamily: 'Roboto_Regular',
                    fontSize: SizeConfig.blockSizeHorizontal*3.0,
                    fontWeight: FontWeight.w500
                ),),
              Text("Credited to GPAY",
                style: TextStyle(
                    color: Colors.black54,
                    fontFamily: 'Roboto_Regular',
                    fontSize: SizeConfig.blockSizeHorizontal*3.0,
                    fontWeight: FontWeight.w500
                ),),
            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.012,
              bottom: SizeConfig.screenHeight*0.0,
          ),
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
    );
  }
}
