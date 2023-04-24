import 'package:fixgocompanyapp/common_file/common_color.dart';
import 'package:fixgocompanyapp/common_file/size_config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';




class NewLoadScreenForm extends StatefulWidget {
  const NewLoadScreenForm({Key? key}) : super(key: key);

  @override
  State<NewLoadScreenForm> createState() => _NewLoadScreenFormState();
}

class _NewLoadScreenFormState extends State<NewLoadScreenForm> {


  int addDeliveryCount = 0;

  bool isChecked = false;

  TextEditingController dateInput = TextEditingController();
  TextEditingController quantityLoadController = TextEditingController();
  TextEditingController descriptionLoadController = TextEditingController();
  TextEditingController carryingCapacityController = TextEditingController();
  TextEditingController vehicleNumberController = TextEditingController();
  TextEditingController lengthController = TextEditingController();
  TextEditingController widthController = TextEditingController();

  String? pickUpDate;
  String? bidEndDate;

  String employeeValue = 'Type of Load';
  String vehicleValue = 'Type of Vehicle';

  bool showAllGoodsField = true;
  bool hideAllGoodsField = false;
  bool showLoadField = false;

  int PackLoad = 1;
  int LooseLoad = 2;
  int OverDimensional = 3;

  int loadType = 0;
  String typeLoad = "";


  var employeeCount = [
    'Type of Load',
    'Pack Load',
    'Loose Load',
    'Over Dimensional Load',
  ];

  var vehicleType = [
    'Type of Vehicle',
    'Open body',
    'Closed body',
    'Trailer',
    'Container',
  ];

  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }


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
            color: CommonColor.WHITE_COLOR,
            height: SizeConfig.safeUsedHeight * .88,
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(bottom: SizeConfig.screenHeight * 0.1),
              children: [

                getPickUpAndDeliverLocation(SizeConfig.screenHeight, SizeConfig.screenWidth),
                getPickAndEndDate(SizeConfig.screenHeight, SizeConfig.screenWidth),
                getGoodsLoadLayout(SizeConfig.screenHeight, SizeConfig.screenWidth),
                getVehicleDetails(SizeConfig.screenHeight, SizeConfig.screenWidth),

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
            child: Text("Interested Transporter",
              style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal*6.0,
                  fontFamily: "Roboto_Medium",
                  fontWeight: FontWeight.w500,
                  color: Colors.transparent
              ),),
          ),
          const Icon(Icons.more_vert,
            color: Colors.transparent,)
        ],
      ),
    );
  }

  Widget getPickUpAndDeliverLocation(double parentHeight, double parentWidth){
    return Padding(
      padding: EdgeInsets.only(left: parentWidth*0.05,
      right: parentWidth*0.05,
      top: parentHeight*0.03),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 3,
                spreadRadius: 1,
                offset: const Offset(1, 1)),
          ],
        ),
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: parentWidth*0.1, top: parentHeight*0.02),
                      child: Text("Pick-up Location",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: SizeConfig.blockSizeHorizontal*4.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto_Regular'
                        ),),
                    ),
                  ],
                ),
                SizedBox(
                  height: parentHeight*0.02,
                ),
                Padding(
                  padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.0),
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


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: parentWidth*0.1, top: parentHeight*0.007),
                      child: Text("Delivery",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: SizeConfig.blockSizeHorizontal*4.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto_Regular'
                        ),),
                    ),
                   Container(
                     color: Colors.transparent,
                     width: parentWidth*0.14,
                     child: Row(
                       children: [
                         Padding(
                           padding: EdgeInsets.only(top: parentHeight*0.007,
                           ),
                           child: Image(image: AssetImage("assets/images/vertical_divider.png")),
                         ),
                         GestureDetector(
                           onDoubleTap: (){},
                           onTap: (){
                             addDeliveryCount++;
                             if(mounted){
                               setState(() {

                               });
                             }
                           },
                           child: Container(
                             color: Colors.transparent,
                             child: Padding(
                               padding: EdgeInsets.only(top: parentHeight*0.01,
                                   left: parentWidth*0.03),
                               child: Icon(Icons.add_circle_outline_rounded,
                               color: Colors.black,),
                             ),
                           ),
                         )
                       ],
                     ),
                   )
                  ],
                ),

                for(int i = 0; i < addDeliveryCount ; i++)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: parentWidth*0.1, top: parentHeight*0.007),
                      child: Text("Delivery",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: SizeConfig.blockSizeHorizontal*4.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto_Regular'
                        ),),
                    ),
                   Container(
                     color: Colors.transparent,
                     width: parentWidth*0.14,
                     child: Row(
                       children: [
                         Padding(
                           padding: EdgeInsets.only(top: parentHeight*0.007,
                           ),
                           child: Image(image: AssetImage("assets/images/vertical_divider.png")),
                         ),
                         GestureDetector(
                           onDoubleTap: (){},
                           onTap: (){
                             addDeliveryCount--;
                             if(mounted){
                               setState(() {

                               });
                             }
                           },
                           child: Container(
                             color: Colors.transparent,
                             child: Padding(
                               padding: EdgeInsets.only(top: parentHeight*0.01,
                                   left: parentWidth*0.03),
                               child: Icon(Icons.remove_circle_outline_rounded,
                               color: Colors.black,),
                             ),
                           ),
                         )
                       ],
                     ),
                   )
                  ],
                ),
                SizedBox(
                  height: parentHeight*0.007,
                ),

              ],
            ),

            Padding(
              padding: EdgeInsets.only(left: parentWidth*0.037,
              top: parentHeight*0.025),
              child: Column(
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: parentHeight*0.013,
                        width: parentWidth*0.026,
                        decoration: BoxDecoration(
                            color: CommonColor.FROM_AREA_COLOR,
                            shape: BoxShape.circle
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: parentWidth*0.012,
                    top: parentHeight*0.005,
                    bottom: parentHeight*0.005,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: parentHeight*0.04,
                          width: parentWidth*0.003,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: parentHeight*0.013,
                        width: parentWidth*0.026,
                        decoration: BoxDecoration(
                            color: CommonColor.TO_AREA_COLOR,
                            shape: BoxShape.circle
                        ),
                      ),
                    ],
                  ),



                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getPickAndEndDate(double parentHeight, double parentWidth){
    return Padding(
      padding: EdgeInsets.only(left: parentWidth*0.05,
          right: parentWidth*0.05,
          top: parentHeight*0.02),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 3,
                spreadRadius: 1,
                offset: const Offset(1, 1)),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            Padding(
              padding: EdgeInsets.only(left: parentWidth*0.05),
              child: GestureDetector(
                onDoubleTap: (){},
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2100));

                  if (pickedDate != null) {
                    print(
                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                    pickUpDate =
                    DateFormat('dd-MM-yyyy').format(pickedDate);
                    print(
                        pickUpDate); //formatted date output using intl package =>  2021-03-16
                    setState(() {
                      dateInput.text =
                          pickUpDate.toString(); //set output date to TextField value.
                    });
                  } else {}


                },
                child: Container(
                  width: parentWidth*0.3,
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      Icon(Icons.date_range_outlined,
                        color: Colors.black,),

                      Text(pickUpDate == null ?"Pick-up Date":"${pickUpDate}",
                        style: TextStyle(
                            fontSize: SizeConfig.blockSizeHorizontal*3.5,
                            fontFamily: "Roboto_Regular",
                            fontWeight: FontWeight.w500,
                            color: pickUpDate == null ? Colors.black54 : Colors.black
                        ),),

                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: parentHeight*0.003,
              bottom: parentHeight*0.005),
              child: Container(
                height: parentHeight*0.05,
                width: parentWidth*0.001,
                color: Colors.black54,
              ),
            ),

            Padding(
              padding: EdgeInsets.only(right: parentWidth*0.03),
              child: GestureDetector(
                onDoubleTap: (){},
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2100));

                  if (pickedDate != null) {
                    print(
                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                    bidEndDate =
                        DateFormat('dd-MM-yyyy').format(pickedDate);
                    print(
                        bidEndDate); //formatted date output using intl package =>  2021-03-16
                    setState(() {
                      dateInput.text =
                          bidEndDate.toString(); //set output date to TextField value.
                    });
                  } else {}


                },
                child: Container(
                  color: Colors.transparent,
                  width: parentWidth*0.35,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Icon(Icons.date_range_outlined,
                        color: Colors.black,),

                      Text(bidEndDate == null ? "  Bidding End Date" : "  ${bidEndDate}",
                        style: TextStyle(
                            fontSize: SizeConfig.blockSizeHorizontal*3.5,
                            fontFamily: "Roboto_Regular",
                            fontWeight: FontWeight.w500,
                            color:bidEndDate == null ? Colors.black54 : Colors.black
                        ),),

                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget getGoodsLoadLayout(double parentHeight, double parentWidth){
    return Padding(
      padding: EdgeInsets.only(left: parentWidth*0.05,
          right: parentWidth*0.05,
          top: parentHeight*0.03),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 3,
                spreadRadius: 1,
                offset: const Offset(1, 1)),
          ],
        ),
        child: Stack(
          children: [
            Visibility(
              visible: showAllGoodsField,
              child: Column(
                children: [

                  Padding(
                    padding: EdgeInsets.only(left: parentHeight * 0.02,
                    top: parentHeight*0.015),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Goods/Load",
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeHorizontal*5.0,
                              fontFamily: "Roboto_Medium",
                              fontWeight: FontWeight.w500,
                              color: Colors.black
                          ),),
                      ],
                    ),
                  ),

                  Container(
                    color: Colors.transparent,
                    height: parentHeight*0.07,
                    child: Row(
                      children: [

                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: parentHeight*0.01),
                            child: TextFormField(
                              controller: quantityLoadController,
                              // focusNode: _userNameFocus,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                label: Text("Qty. of Goods/Load",
                                  style: TextStyle(
                                    color: CommonColor.UNSELECT_TYPE_COLOR.withOpacity(1.0),
                                    fontWeight: FontWeight.w400,
                                    fontSize: SizeConfig.blockSizeHorizontal*3.5,
                                  ),),
                                contentPadding: EdgeInsets.only(left: parentWidth*0.05, right: parentWidth*0.05),
                                enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.transparent)
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.transparent)
                                ),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(right: parentWidth*0.02),
                          child: Container(
                            width: parentWidth*0.31,
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: parentHeight*0.025,
                                  width: parentWidth*0.15,
                                  decoration: BoxDecoration(
                                    color: CommonColor.WEIGHT_COLOR,
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Center(
                                    child: Text("Ton(s)",
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w400,
                                        fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                        fontFamily: 'Roboto_Regular'
                                      ),),
                                  ),
                                ),
                                Container(
                                  height: parentHeight*0.025,
                                  width: parentWidth*0.15,
                                  decoration: BoxDecoration(
                                    color: CommonColor.WEIGHT_COLOR,
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Center(
                                    child: Text("Kg(s)",
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w400,
                                        fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                        fontFamily: 'Roboto_Regular'
                                      ),),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )

                      ],
                    ),

                  ),

                  Padding(
                    padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.0),
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
                    padding: EdgeInsets.only(left: parentWidth*0.05,
                        top: parentHeight*0.02),
                    child: GestureDetector(
                      onDoubleTap: (){},
                      onTap: (){
                        showLoadField = !showLoadField;
                        if(mounted){
                          setState(() {

                          });
                        }
                      },
                      child: Container(
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                  text: loadType == 0 ? 'Type of Load' : typeLoad,
                                  style: TextStyle(
                                    color: loadType == 0 ? CommonColor.UNSELECT_TYPE_COLOR.withOpacity(1.0)
                                    : Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                  ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: parentWidth*0.05),
                              child: Icon(Icons.keyboard_arrow_down_outlined,
                                color: Colors.black,),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                  Visibility(
                    visible: showLoadField,
                    child: Padding(
                      padding: EdgeInsets.only(top: parentHeight*0.02,),
                      child: Column(
                        children: [

                          Padding(
                            padding:  EdgeInsets.only(left: parentWidth*0.05),
                            child: GestureDetector(
                              onDoubleTap: (){},
                              onTap: (){
                                showLoadField = !showLoadField;
                                loadType = 1;
                                if(mounted){
                                  setState(() {
                                    typeLoad = "Pack Load";
                                  });
                                }
                              },
                              child: Container(
                                color: Colors.transparent,
                                child: Row(
                                  children: [

                                    Container(
                                      height: parentHeight*0.03,
                                      width: parentWidth*0.06,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        shape: BoxShape.circle,
                                        color:loadType == 1 ? CommonColor.SIGN_UP_TEXT_COLOR : CommonColor.WHITE_COLOR
                                      ),
                                    ),

                                    Padding(
                                      padding:  EdgeInsets.only(left: parentWidth*0.03),
                                      child: Text("Pack Load",
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w400,
                                            fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                            fontFamily: 'Roboto_Regular'
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01,
                            left: parentWidth*0.03,
                            right: parentWidth*0.03),
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
                            padding:  EdgeInsets.only(
                                left: parentWidth*0.05,
                            top: parentHeight*0.01),
                            child: GestureDetector(
                              onDoubleTap: (){},
                              onTap: (){
                                showLoadField = !showLoadField;
                                loadType = 2;
                                if(mounted){
                                  setState(() {
                                    typeLoad = "Loose Load";
                                  });
                                }
                              },
                              child: Container(
                                color: Colors.transparent,
                                child: Row(
                                  children: [

                                    Container(
                                      height: parentHeight*0.03,
                                      width: parentWidth*0.06,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        shape: BoxShape.circle,
                                          color:loadType == 2 ? CommonColor.SIGN_UP_TEXT_COLOR
                                              : CommonColor.WHITE_COLOR
                                      ),
                                    ),

                                    Padding(
                                      padding:  EdgeInsets.only(left: parentWidth*0.03),
                                      child: Text("Loose Load",
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w400,
                                            fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                            fontFamily: 'Roboto_Regular'
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01,
                                left: parentWidth*0.03,
                                right: parentWidth*0.03),
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
                            padding:  EdgeInsets.only(left: parentWidth*0.05,
                            top: parentHeight*0.01),
                            child: GestureDetector(
                              onDoubleTap: (){},
                              onTap: (){
                                showLoadField = !showLoadField;
                                loadType = 3;
                                if(mounted){
                                  setState(() {
                                    typeLoad = "Over Dimensional Load";
                                  });
                                }
                              },
                              child: Container(
                                color: Colors.transparent,
                                child: Row(
                                  children: [

                                    Container(
                                      height: parentHeight*0.03,
                                      width: parentWidth*0.06,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        shape: BoxShape.circle,
                                          color:loadType == 3 ? CommonColor.SIGN_UP_TEXT_COLOR
                                              : CommonColor.WHITE_COLOR
                                      ),
                                    ),

                                    Padding(
                                      padding:  EdgeInsets.only(left: parentWidth*0.03),
                                      child: Text("Over Dimensional Load",
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w400,
                                            fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                            fontFamily: 'Roboto_Regular'
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ),


                        ],
                      ),
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
                    padding: EdgeInsets.only(left: parentWidth*0.05,
                    top: parentHeight*0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: 'Upload Image',
                              style: TextStyle(
                                color: CommonColor.UNSELECT_TYPE_COLOR.withOpacity(1.0),
                                fontWeight: FontWeight.w400,
                                fontSize: SizeConfig.blockSizeHorizontal*4.0,
                              ),
                              children: [
                                TextSpan(
                                    text: '  (maximum 3 imgs)',
                                    style: TextStyle(
                                        fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                        color: CommonColor.UNSELECT_TYPE_COLOR.withOpacity(1.0),
                                        fontWeight: FontWeight.w400))
                              ]),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: parentWidth*0.05),
                          child: Image(image: AssetImage("assets/images/camera.png"),
                          color: Colors.black,),
                        )
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
                    padding: EdgeInsets.only(top: parentHeight*0.01),
                    child: Container(
                      color: Colors.transparent,
                      child: TextFormField(
                        controller: descriptionLoadController,
                        // focusNode: _userNameFocus,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          label: Text("Description",
                            style: TextStyle(
                              color: CommonColor.UNSELECT_TYPE_COLOR.withOpacity(1.0),
                              fontWeight: FontWeight.w400,
                              fontSize: SizeConfig.blockSizeHorizontal*4.0,
                            ),),
                          contentPadding: EdgeInsets.only(left: parentWidth*0.05, right: parentWidth*0.05),
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent)
                          ),
                          focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent)
                          ),
                        ),
                        maxLines: 3,
                        minLines: 1,
                        onFieldSubmitted: (value){
                          showAllGoodsField = !showAllGoodsField;
                          hideAllGoodsField = !hideAllGoodsField;
                        },
                      ),

                    ),
                  ),

                  SizedBox(
                    height: parentHeight*0.01,
                  )

                ],
              ),
            ),

            Visibility(
              visible: hideAllGoodsField,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: parentWidth*0.05,
                    right: parentWidth*0.05,
                    top: parentHeight*0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Text("Load Details",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig.blockSizeHorizontal*4.5,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Roboto_Medium'
                          ),),

                        GestureDetector(
                          onDoubleTap: (){},
                          onTap: (){
                            if(mounted){
                              setState(() {
                                showAllGoodsField = !showAllGoodsField;
                                hideAllGoodsField = !hideAllGoodsField;
                              });
                            }
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: Icon(Icons.edit,
                            size: parentHeight*0.025,),
                          ),
                        )

                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: parentHeight*0.02,
                    left: parentWidth*0.1,
                    right: parentWidth*0.1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Container(
                          height: parentHeight*0.09,
                          width: parentWidth*0.195,
                          color: CommonColor.UNSELECT_TYPE_COLOR,
                        ),

                        Container(
                          height: parentHeight*0.09,
                          width: parentWidth*0.195,
                          color: CommonColor.UNSELECT_TYPE_COLOR,
                        ),

                        Container(
                          height: parentHeight*0.09,
                          width: parentWidth*0.195,
                          color: CommonColor.UNSELECT_TYPE_COLOR,
                        )

                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: parentHeight*0.02,
                    left: parentWidth*0.05),
                    child: Row(
                      children: [

                        Text("Type of Load :",
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: SizeConfig.blockSizeHorizontal*3.5,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Roboto_Regular'
                          ),),

                        Text(" Over Dimensional Load",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig.blockSizeHorizontal*4.0,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Roboto_Regular'
                          ),),

                        Padding(
                          padding: EdgeInsets.only(left: parentWidth*0.02),
                          child: Container(
                            height: parentHeight*0.04,
                            width: parentWidth*0.002,
                            color: Colors.black26,
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(left: parentWidth*0.02),
                          child: Text("10 Ton(s)",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: SizeConfig.blockSizeHorizontal*3.7,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Roboto_Regular'
                            ),),
                        ),

                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: parentWidth*0.05,
                    right: parentWidth*0.05,
                    top: parentHeight*0.01),
                    child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting.",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: SizeConfig.blockSizeHorizontal*3.0,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Roboto_Regular'
                      ),),
                  ),

                  SizedBox(
                    height: parentHeight*0.01,
                  )


                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getVehicleDetails(double parentHeight, double parentWidth){
    return Padding(
      padding: EdgeInsets.only(left: parentWidth*0.05,
          right: parentWidth*0.05,
          top: parentHeight*0.03),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 3,
                spreadRadius: 1,
                offset: const Offset(1, 1)),
          ],
        ),
        child: Stack(
          children: [
            Visibility(
              visible: showAllGoodsField,
              child: Column(
                children: [

                  Padding(
                    padding: EdgeInsets.only(left: parentHeight * 0.02,
                        top: parentHeight*0.015),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Vehicle",
                          style: TextStyle(
                              fontSize: SizeConfig.blockSizeHorizontal*5.0,
                              fontFamily: "Roboto_Medium",
                              fontWeight: FontWeight.w500,
                              color: Colors.black
                          ),),
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: parentWidth*0.05,
                        top: parentHeight*0.02),
                    child: GestureDetector(
                      onDoubleTap: (){},
                      onTap: (){
                        showLoadField = !showLoadField;
                        if(mounted){
                          setState(() {

                          });
                        }
                      },
                      child: Container(
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: loadType == 0 ? 'Type of Load' : typeLoad,
                                style: TextStyle(
                                  color: loadType == 0 ? CommonColor.UNSELECT_TYPE_COLOR.withOpacity(1.0)
                                      : Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: parentWidth*0.05),
                              child: Icon(Icons.keyboard_arrow_down_outlined,
                                color: Colors.black,),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                  Visibility(
                    visible: showLoadField,
                    child: Padding(
                      padding: EdgeInsets.only(top: parentHeight*0.02,),
                      child: Column(
                        children: [

                          Padding(
                            padding:  EdgeInsets.only(left: parentWidth*0.05),
                            child: GestureDetector(
                              onDoubleTap: (){},
                              onTap: (){
                                showLoadField = !showLoadField;
                                loadType = 1;
                                if(mounted){
                                  setState(() {
                                    typeLoad = "Pack Load";
                                  });
                                }
                              },
                              child: Container(
                                color: Colors.transparent,
                                child: Row(
                                  children: [

                                    Container(
                                      height: parentHeight*0.03,
                                      width: parentWidth*0.06,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.black),
                                          shape: BoxShape.circle,
                                          color:loadType == 1 ? CommonColor.SIGN_UP_TEXT_COLOR : CommonColor.WHITE_COLOR
                                      ),
                                    ),

                                    Padding(
                                      padding:  EdgeInsets.only(left: parentWidth*0.03),
                                      child: Text("Pack Load",
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w400,
                                            fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                            fontFamily: 'Roboto_Regular'
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01,
                                left: parentWidth*0.03,
                                right: parentWidth*0.03),
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
                            padding:  EdgeInsets.only(
                                left: parentWidth*0.05,
                                top: parentHeight*0.01),
                            child: GestureDetector(
                              onDoubleTap: (){},
                              onTap: (){
                                showLoadField = !showLoadField;
                                loadType = 2;
                                if(mounted){
                                  setState(() {
                                    typeLoad = "Loose Load";
                                  });
                                }
                              },
                              child: Container(
                                color: Colors.transparent,
                                child: Row(
                                  children: [

                                    Container(
                                      height: parentHeight*0.03,
                                      width: parentWidth*0.06,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.black),
                                          shape: BoxShape.circle,
                                          color:loadType == 2 ? CommonColor.SIGN_UP_TEXT_COLOR
                                              : CommonColor.WHITE_COLOR
                                      ),
                                    ),

                                    Padding(
                                      padding:  EdgeInsets.only(left: parentWidth*0.03),
                                      child: Text("Loose Load",
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w400,
                                            fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                            fontFamily: 'Roboto_Regular'
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01,
                                left: parentWidth*0.03,
                                right: parentWidth*0.03),
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
                            padding:  EdgeInsets.only(left: parentWidth*0.05,
                                top: parentHeight*0.01),
                            child: GestureDetector(
                              onDoubleTap: (){},
                              onTap: (){
                                showLoadField = !showLoadField;
                                loadType = 3;
                                if(mounted){
                                  setState(() {
                                    typeLoad = "Over Dimensional Load";
                                  });
                                }
                              },
                              child: Container(
                                color: Colors.transparent,
                                child: Row(
                                  children: [

                                    Container(
                                      height: parentHeight*0.03,
                                      width: parentWidth*0.06,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.black),
                                          shape: BoxShape.circle,
                                          color:loadType == 3 ? CommonColor.SIGN_UP_TEXT_COLOR
                                              : CommonColor.WHITE_COLOR
                                      ),
                                    ),

                                    Padding(
                                      padding:  EdgeInsets.only(left: parentWidth*0.03),
                                      child: Text("Over Dimensional Load",
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w400,
                                            fontSize: SizeConfig.blockSizeHorizontal*4.0,
                                            fontFamily: 'Roboto_Regular'
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ),


                        ],
                      ),
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

                  Container(
                    color: Colors.transparent,
                    height: parentHeight*0.07,
                    child: Row(
                      children: [

                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: parentHeight*0.01),
                            child: TextFormField(
                              controller: carryingCapacityController,
                              // focusNode: _userNameFocus,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                label: Text("Carrying Capacity",
                                  style: TextStyle(
                                    color: CommonColor.UNSELECT_TYPE_COLOR.withOpacity(1.0),
                                    fontWeight: FontWeight.w400,
                                    fontSize: SizeConfig.blockSizeHorizontal*3.5,
                                  ),),
                                contentPadding: EdgeInsets.only(left: parentWidth*0.05, right: parentWidth*0.05),
                                enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.transparent)
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.transparent)
                                ),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(right: parentWidth*0.0),
                          child: Container(
                            width: parentWidth*0.31,
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: parentHeight*0.025,
                                  width: parentWidth*0.15,
                                  decoration: BoxDecoration(
                                      color: CommonColor.WEIGHT_COLOR,
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Center(
                                    child: Text("RLW (kg)",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w400,
                                          fontSize: SizeConfig.blockSizeHorizontal*3.0,
                                          fontFamily: 'Roboto_Regular'
                                      ),),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )

                      ],
                    ),

                  ),


                  Padding(
                    padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.0),
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
                    padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.01),
                    child: TextFormField(
                      controller: vehicleNumberController,
                      // focusNode: _userNameFocus,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        label: Text("No. of Vehicle (e.g. 01 )",
                          style: TextStyle(
                            color: CommonColor.UNSELECT_TYPE_COLOR.withOpacity(1.0),
                            fontWeight: FontWeight.w400,
                            fontSize: SizeConfig.blockSizeHorizontal*3.5,
                          ),),
                        contentPadding: EdgeInsets.only(left: parentWidth*0.05, right: parentWidth*0.05),
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12)
                        ),
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12)
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(
                      top: SizeConfig.screenHeight * 0.01,
                      left: SizeConfig.screenWidth*0.03,
                      right: SizeConfig.screenWidth*0.05,
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: SizeConfig.screenHeight * 0.07,
                          width: SizeConfig.screenWidth * 0.07,
                          child: Column(
                            children: <Widget>[
                              Checkbox(
                                activeColor: CommonColor.SIGN_UP_TEXT_COLOR,
                                checkColor: Colors.white,
                                value: isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = value!;
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
                              padding: EdgeInsets.only(left: SizeConfig.screenWidth * 0.01,
                              bottom: parentHeight*0.008),
                              child: Text("Length & Width of Vehicle",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w400,
                                    fontSize: SizeConfig.blockSizeHorizontal*3.5,
                                    fontFamily: 'Roboto_Medium'
                                ),),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(
                        top: parentHeight * 0.0,
                        left: parentWidth * 0.05,
                        right: parentWidth * 0.05),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: parentWidth * 0.05),
                            child: Container(
                              height: parentHeight*0.06,
                              child: TextFormField(
                                controller: lengthController,
                                // focusNode: _cityFocus,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  label: RichText(
                                    text: TextSpan(
                                        text: 'Length(Ft.)',
                                        style: TextStyle(
                                          color: CommonColor.UNSELECT_TYPE_COLOR.withOpacity(1.0),
                                          fontWeight: FontWeight.w400,
                                          fontSize: SizeConfig.blockSizeHorizontal*3.5,
                                        ),
                                       ),
                                  ),
                                  labelStyle: TextStyle(
                                      color: CommonColor.UNSELECT_TYPE_COLOR.withOpacity(1.0),
                                      fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                                      fontFamily: 'Roboto_Regular'),
                                  border: const OutlineInputBorder(
                                      borderSide:
                                      BorderSide(width: 1.0, color: Colors.black)),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide:
                                      BorderSide(width: 1.0, color: Colors.black)),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: parentWidth * 0.05),
                            child: Container(
                              height: parentHeight*0.06,
                              child: TextFormField(
                                controller: widthController,
                                // focusNode: _zipCodeFocus,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  labelText: "Width(Ft.)",
                                  labelStyle: TextStyle(
                                      color: CommonColor.UNSELECT_TYPE_COLOR.withOpacity(1.0),
                                      fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                                      fontFamily: 'Roboto_Regular'),
                                  border: const OutlineInputBorder(
                                      borderSide:
                                      BorderSide(width: 1.0, color: Colors.black)),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide:
                                      BorderSide(width: 1.0, color: Colors.black)),
                                ),
                                textAlign: TextAlign.center,
                              ),
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
              ),
            ),

            Visibility(
              visible: hideAllGoodsField,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: parentWidth*0.05,
                        right: parentWidth*0.05,
                        top: parentHeight*0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Text("Load Details",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig.blockSizeHorizontal*4.5,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Roboto_Medium'
                          ),),

                        GestureDetector(
                          onDoubleTap: (){},
                          onTap: (){
                            if(mounted){
                              setState(() {
                                showAllGoodsField = !showAllGoodsField;
                                hideAllGoodsField = !hideAllGoodsField;
                              });
                            }
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: Icon(Icons.edit,
                              size: parentHeight*0.025,),
                          ),
                        )

                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: parentHeight*0.02,
                        left: parentWidth*0.1,
                        right: parentWidth*0.1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Container(
                          height: parentHeight*0.09,
                          width: parentWidth*0.195,
                          color: CommonColor.UNSELECT_TYPE_COLOR,
                        ),

                        Container(
                          height: parentHeight*0.09,
                          width: parentWidth*0.195,
                          color: CommonColor.UNSELECT_TYPE_COLOR,
                        ),

                        Container(
                          height: parentHeight*0.09,
                          width: parentWidth*0.195,
                          color: CommonColor.UNSELECT_TYPE_COLOR,
                        )

                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: parentHeight*0.02,
                        left: parentWidth*0.05),
                    child: Row(
                      children: [

                        Text("Type of Load :",
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: SizeConfig.blockSizeHorizontal*3.5,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Roboto_Regular'
                          ),),

                        Text(" Over Dimensional Load",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: SizeConfig.blockSizeHorizontal*4.0,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Roboto_Regular'
                          ),),

                        Padding(
                          padding: EdgeInsets.only(left: parentWidth*0.02),
                          child: Container(
                            height: parentHeight*0.04,
                            width: parentWidth*0.002,
                            color: Colors.black26,
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(left: parentWidth*0.02),
                          child: Text("10 Ton(s)",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: SizeConfig.blockSizeHorizontal*3.7,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Roboto_Regular'
                            ),),
                        ),

                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: parentWidth*0.05,
                        right: parentWidth*0.05,
                        top: parentHeight*0.01),
                    child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting.",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: SizeConfig.blockSizeHorizontal*3.0,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Roboto_Regular'
                      ),),
                  ),

                  SizedBox(
                    height: parentHeight*0.01,
                  )


                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}
