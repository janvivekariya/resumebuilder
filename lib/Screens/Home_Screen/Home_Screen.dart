import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resumebuilder/Screens/Option_Screen/Option_Screen.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});
  static const String RouteName = "/HomeScreen";
  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Resume Builder"),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Option_Screen.RouteName);
        },
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Press + Button To Start Building Your Resume",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.sp, color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }
}
