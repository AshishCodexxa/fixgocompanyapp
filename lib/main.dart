import 'dart:async';
import 'package:fixgocompanyapp/common_file/common_color.dart';
import 'package:fixgocompanyapp/common_file/size_config.dart';
import 'package:fixgocompanyapp/data/data_constant/constant_data.dart';
import 'package:fixgocompanyapp/login_registration/sign_up_dialog.dart';
import 'package:fixgocompanyapp/presentation/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: const MyHomePage(),
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          '/frame': (BuildContext context) => const SignUpDialog(),
          '/dashboard': (BuildContext context) => const Dashboard(),
        }
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String name = GetStorage().read(ConstantData.userName);
  String emailId = GetStorage().read(ConstantData.emailId);
  String phoneNo = GetStorage().read(ConstantData.contactNo);
  String accessToken = GetStorage().read(ConstantData.userAccessToken);


  @override
  void initState() {
    super.initState();
    startTimer();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: CommonColor.APP_BAR_COLOR,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            // Image(image: AssetImage("assets/images/app_logo.png")),
            Padding(
              padding: EdgeInsets.only(top: SizeConfig.screenHeight*0.03),
              child: Text("FixGo",
                style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal*9.0,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Robot_Bold',
                    color:CommonColor.WHITE_COLOR
                ),),
            )
          ],
        ),
      ),
    );
  }

  void navigateParentPage() {
    Navigator.of(context).pushReplacementNamed('/frame');
  }

  void navigateHomePage() {
    Navigator.of(context).pushReplacementNamed('/dashboard');
  }

  startTimer() {
    var durtaion = new Duration(seconds: 3);
    try {

      print("-----> $accessToken");

      if (accessToken == null) {
        return Timer(durtaion, navigateParentPage);
      } else if (accessToken != null) {
        return Timer(durtaion, navigateHomePage);
      }
    } catch (e) {
      print("eeeeeeee  $e");
    }
    return Timer(durtaion, navigateParentPage);
  }

}
