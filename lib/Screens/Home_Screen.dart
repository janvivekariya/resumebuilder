import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  static const String RouteName = "/homescreen";

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
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
              "Press + Button Start Building Your Resume",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.sp, color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }
}