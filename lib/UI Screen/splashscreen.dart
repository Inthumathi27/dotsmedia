import 'dart:async';
import 'package:flutter/material.dart';

import '../utils/constant.dart';
import '../utils/responsive.dart';
import 'loginscreen/loginpage.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key,}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  startTime() async {
    var _duration = Duration(seconds:3);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) =>  LoginPage()),
            (Route<dynamic> route) => false);

  }

  @override
  void initState() {
    super.initState();
    startTime();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: Center(
        child: Image.asset(
          'assets/yellowbench.png',
          width: ResponsiveScreens.isSmallMobileView(context)?200: ResponsiveScreens.isMobileView(context)?200:ResponsiveScreens.isMobile(context)?200:300,
          height:ResponsiveScreens.isSmallMobileView(context)?200:ResponsiveScreens.isMobileView(context)?200:ResponsiveScreens.isMobile(context)?200: 300,
        ),
      ),
    );
  }
}