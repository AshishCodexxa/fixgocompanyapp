import 'package:flutter/material.dart';


class OrderChildScreen extends StatefulWidget {

  final OrderChildScreenListener mListener;

  const OrderChildScreen({Key? key, required this.mListener}) : super(key: key);

  @override
  State<OrderChildScreen> createState() => _OrderChildScreenState();
}

class _OrderChildScreenState extends State<OrderChildScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

        ],
      ),
    );
  }
}



abstract class OrderChildScreenListener{

}
