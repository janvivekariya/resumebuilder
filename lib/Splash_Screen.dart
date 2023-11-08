import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  static const String RouteName = "/splashscreen";

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
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
    });
  }
}
