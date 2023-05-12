import 'package:fixgocompanyapp/common_file/common_color.dart';
import 'package:fixgocompanyapp/common_file/size_config.dart';
import 'package:fixgocompanyapp/presentation/home_module/pick_up_location_screen.dart';
import 'package:flutter/material.dart';





class PreviousAddressListScreen extends StatefulWidget {
  const PreviousAddressListScreen({Key? key}) : super(key: key);

  @override
  State<PreviousAddressListScreen> createState() => _PreviousAddressListScreenState();
}

class _PreviousAddressListScreenState extends State<PreviousAddressListScreen> {
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
            color: CommonColor.WHITE_COLOR,
            height: SizeConfig.safeUsedHeight * .88,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CustomScrollView(
                  slivers: <Widget>[

                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Padding(
                            padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.02),
                            child: Container(
                              height: SizeConfig.screenHeight*0.05,
                              color: CommonColor.SIGN_UP_TEXT_COLOR,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.05),
                                    child: Text("Select Pick-up Address",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Roboto_Regular'
                                      ),),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: 3,
                              (context, index) {
                            return  Padding(
                              padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.05,
                                  right: SizeConfig.screenWidth*0.05),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01),
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            GestureDetector(
                                              onTap: (){
                                                // selectedIndex = index;
                                                // setState(() {
                                                //   selectAddId = snap.data?.data?[index].id ?? "";
                                                //   print(" selectId $selectAddId");
                                                // });
                                              },
                                              child: Container(
                                                color: Colors.transparent,
                                                child: Icon(Icons.circle_outlined,
                                                  color: CommonColor.BLACK_COLOR,),
                                              ),
                                            ),
                                            Visibility(
                                              visible: true,
                                              child: Padding(
                                                padding: EdgeInsets.only(right: SizeConfig.screenWidth*0.0027),
                                                child: Icon(Icons.circle,
                                                  color: CommonColor.BLACK_COLOR,
                                                  size: SizeConfig.blockSizeHorizontal*3.0,),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.03, top: SizeConfig.screenHeight*0.02),
                                        child: Container(
                                          width: SizeConfig.screenWidth*0.8,
                                          color: Colors.transparent,
                                          child: Text("City Avenue ,Shankar Kalat Nagar, Wakad, Pimpri-Chinchwad, Pune - 57.",
                                            style: TextStyle(
                                              color: CommonColor.BLACK_COLOR,
                                              fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                              fontFamily: 'Roboto_Medium',
                                              fontWeight: FontWeight.w400,
                                              )
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.015),
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
                              ),
                            );
                          },
                        )
                    ),

                    SliverPadding(
                      padding: EdgeInsets.only(bottom: SizeConfig.screenHeight*0.05),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            Padding(
                              padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.03,
                              left: SizeConfig.screenWidth*0.3,
                              right: SizeConfig.screenWidth*0.3),
                              child: GestureDetector(
                                onDoubleTap: (){},
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PickUpLocation()));
                                },
                                child: Container(
                                  height: SizeConfig.screenHeight*0.04,
                                  decoration: BoxDecoration(
                                      color: CommonColor.SIGN_UP_TEXT_COLOR,
                                      borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.black)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      Icon(Icons.add,
                                        color: Colors.white,
                                        size: SizeConfig.screenHeight*0.025,),

                                      Padding(
                                        padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.005),
                                        child: Text("Add New Address",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: SizeConfig.blockSizeHorizontal*3.3,
                                              fontFamily: 'Ronoto_Regular',
                                              fontWeight: FontWeight.w400
                                          ),),
                                      )

                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: SizeConfig.screenHeight * 0.05,
                    left: SizeConfig.screenWidth*0.05,
                    right: SizeConfig.screenWidth*0.05,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){

                        },
                        child: Container(
                          height: SizeConfig.screenHeight*0.05,
                          width: SizeConfig.screenWidth*0.7,
                          decoration: BoxDecoration(
                              color: CommonColor.LOAD_SUBMIT_COLOR,
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
              ],
            ),
          ),

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
            child: Text("Transporter",
              style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal*6.0,
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

  Widget getAddressList(double parentHeight, double parentWidth){
    return Column(
      children: [



      ],
    );
  }
}
