import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:resumebuilder/Screens/Home_Screen/Home_Screen.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  static const String RouteName = "/SplashScreen";

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Center(
          child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
          Lottie.asset("assets/splash.json",
              width: _width * 0.5, height: _height * 0.5),
          Text(
            "Resume\nBuilder",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
          )
      ],
    ),
        ));
  }

  @override
  void initState() {
    forNavigation();
    super.initState();
  }

  forNavigation() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, Home_Screen.RouteName);
    });
  }
}
