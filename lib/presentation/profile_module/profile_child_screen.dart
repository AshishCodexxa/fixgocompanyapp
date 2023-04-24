import 'package:flutter/material.dart';



class ProfileChildScreen extends StatefulWidget {

  final ProfileChildScreenListener mListener;

  const ProfileChildScreen({Key? key, required this.mListener}) : super(key: key);

  @override
  State<ProfileChildScreen> createState() => _ProfileChildScreenState();
}

class _ProfileChildScreenState extends State<ProfileChildScreen> {
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


abstract class ProfileChildScreenListener{

}
