import 'package:fixgocompanyapp/common_file/common_color.dart';
import 'package:fixgocompanyapp/common_file/size_config.dart';
import 'package:flutter/material.dart';




class TransporterListFilter extends StatefulWidget {
  const TransporterListFilter({Key? key}) : super(key: key);

  @override
  State<TransporterListFilter> createState() => _TransporterListFilterState();
}

class _TransporterListFilterState extends State<TransporterListFilter> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding:
      EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
          height: SizeConfig.screenHeight * 0.3,
          color: Colors.transparent,
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                )),
            child: Column(
              children: [

                Container(
                  height: SizeConfig.screenHeight*0.07,
                  decoration: BoxDecoration(
                    color: CommonColor.SIGN_UP_TEXT_COLOR,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)
                    )
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.05, right: SizeConfig.screenWidth*0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            color: Colors.transparent,
                            child: Icon(Icons.arrow_back_ios_new,
                              color: Colors.transparent,)),
                        Padding(
                          padding: EdgeInsets.only(left: SizeConfig.screenHeight * 0.01),
                          child: Text("Sort By",
                            style: TextStyle(
                                fontSize: SizeConfig.blockSizeHorizontal*5.0,
                                fontFamily: "Roboto_Medium",
                                fontWeight: FontWeight.w500,
                                color: CommonColor.WHITE_COLOR
                            ),),
                        ),
                        GestureDetector(
                          onDoubleTap: (){},
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: const Icon(Icons.clear,
                              color: Colors.white,
                              ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),


                Padding(
                  padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.05, top: SizeConfig.screenHeight*0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: SizeConfig.screenHeight*0.03,
                        width: SizeConfig.screenWidth*0.068,
                        decoration:  BoxDecoration(
                          border: Border.all(color: Colors.black),
                          shape: BoxShape.circle
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.03),
                        child: Text(
                            "Lowest Rate",
                            style: TextStyle(
                                fontSize:
                                SizeConfig.blockSizeHorizontal * 4.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontFamily: 'Roboto_Regular')
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.02),
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

                Padding(
                  padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.05, top: SizeConfig.screenHeight*0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: SizeConfig.screenHeight*0.03,
                        width: SizeConfig.screenWidth*0.068,
                        decoration:  BoxDecoration(
                            border: Border.all(color: Colors.black),
                            shape: BoxShape.circle
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.03),
                        child: Text(
                            "Rating / Reviews",
                            style: TextStyle(
                                fontSize:
                                SizeConfig.blockSizeHorizontal * 4.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontFamily: 'Roboto_Regular')
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.02),
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

                Padding(
                  padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.05, top: SizeConfig.screenHeight*0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: SizeConfig.screenHeight*0.03,
                        width: SizeConfig.screenWidth*0.068,
                        decoration:  BoxDecoration(
                            border: Border.all(color: Colors.black),
                            shape: BoxShape.circle
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.03),
                        child: Text(
                            "Availability Date",
                            style: TextStyle(
                                fontSize:
                                SizeConfig.blockSizeHorizontal * 4.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontFamily: 'Roboto_Regular')
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            )
          )),
    );
  }
}
