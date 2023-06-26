import 'package:fixgocompanyapp/common_file/common_color.dart';
import 'package:fixgocompanyapp/common_file/size_config.dart';
import 'package:fixgocompanyapp/presentation/order_module/cancelled_order_screen.dart';
import 'package:fixgocompanyapp/presentation/order_module/complete_order_screen.dart';
import 'package:fixgocompanyapp/presentation/order_module/ongoing_order_screen.dart';
import 'package:fixgocompanyapp/presentation/order_module/pending_order_screen.dart';
import 'package:flutter/material.dart';


class OrderChildScreen extends StatefulWidget {

  final OrderChildScreenListener mListener;
  final String comeFrom;

  const OrderChildScreen({Key? key, required this.mListener, this.comeFrom = ""}) : super(key: key);

  @override
  State<OrderChildScreen> createState() => _OrderChildScreenState();
}

class _OrderChildScreenState extends State<OrderChildScreen> with SingleTickerProviderStateMixin{


  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);

    if(widget.comeFrom == "1"){
      _tabController.animateTo(1);
    }
  }


  @override
  void dispose() {
    _tabController.dispose(); // Dispose the TabController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(SizeConfig.screenHeight * 0.13),
              child: ListView(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Container(
                    color: CommonColor.APP_BAR_COLOR,
                    height: SizeConfig.screenHeight*0.12,
                    child: TabBar(
                      controller: _tabController,
                        isScrollable: true,
                        padding: EdgeInsets.only(left: SizeConfig.screenWidth*0.05,
                            right: SizeConfig.screenWidth*0.05,
                        top: SizeConfig.screenHeight*0.07),
                        indicatorSize: TabBarIndicatorSize.tab,
                        unselectedLabelColor: Colors.white,
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto_Medium',
                            fontSize: SizeConfig.blockSizeHorizontal*4.0
                        ),
                        unselectedLabelStyle: TextStyle(
                            fontSize: SizeConfig.blockSizeHorizontal * 4.0,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Roboto_Regular',
                          color: Colors.white
                        ),
                        indicator: BoxDecoration(
                          border: Border(bottom: BorderSide(color: Colors.white,
                              width: SizeConfig.screenWidth*0.005) ),
                        ),
                        tabs: const [
                          Tab(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Pending',
                              ),
                            ),
                          ),
                          Tab(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'On Going',
                              ),
                            ),
                          ),
                          Tab(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Completed',
                              ),
                            ),
                          ),
                          Tab(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Cancelled',
                              ),
                            ),
                          ),
                        ]),
                  ),
                  Container(
                    color: CommonColor.APP_BAR_COLOR,
                    height: SizeConfig.screenHeight*0.007,
                  ),
                ],
              ),
            ),
            body: Container(
              color: Colors.red,
              height: SizeConfig.screenHeight*0.9,
              child: TabBarView(
                controller: _tabController,
                children: const <Widget>[
                  PendingOrderScreen(),
                  OnGoingOrderScreen(),
                  CompleteOrderScreen(),
                  CancelledOrderScreen()
                ],
              ),
            )),
      ),
    );
  }
}



abstract class OrderChildScreenListener{

}
