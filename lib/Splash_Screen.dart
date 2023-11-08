import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return Scaffold(
      body: Center(
        child: Text("Splash Screen", style: TextStyle(fontSize: 20.sp)),
      ),
    );
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
