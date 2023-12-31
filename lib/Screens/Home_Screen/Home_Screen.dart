import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resumebuilder/Controller/HomeScreenController/HomeScreenController.dart';
import 'package:resumebuilder/Screens/Option_Screen/Option_Screen.dart';
import 'package:resumebuilder/main.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  static const String RouteName = "/HomeScreen";

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  Color MyColor = const Color(0xff0475FF);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return GetBuilder(
        init: HomeScreenController(),
        builder: (homescreencontroller) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Resume Builder"),
              backgroundColor: MyColor,
              centerTitle: true,
              elevation: 0,
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, Option_Screen.RouteName,
                    arguments: {"index": 0}).then((value) {
                  homescreencontroller.onInit();
                });
              },
              child: Icon(
                Icons.add,
                size: 30.sp,
              ),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                homescreencontroller.resumes!.isEmpty
                    ? Center(
                        child: Text(
                          "Press + Button To Start Building Your Resume",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18.sp, color: Colors.grey),
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemCount: homescreencontroller.resumes!.length,
                          itemBuilder: (context, index) {
                            Map decoedMap = jsonDecode(
                                homescreencontroller.resumes![index]);
                            print("Decoded Map is:${decoedMap["name"]}");

                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Option_Screen.RouteName,
                                    arguments: {"index": index}).then((value) {
                                  homescreencontroller.onInit();
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: _width * 0.03,
                                    vertical: _height * 0.01),
                                padding: EdgeInsets.all(10.sp),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.r),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.5),
                                          spreadRadius: 0.5.sp,
                                          blurRadius: 1.sp)
                                    ]),
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("${decoedMap["name"]}",
                                            style: TextStyle(
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          height: _height * 0.01,
                                        ),
                                        Text("${decoedMap["time"]}"),
                                      ],
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.edit,
                                      size: 20.sp,
                                    ),
                                    SizedBox(
                                      width: _width * 0.05,
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        homescreencontroller.forDeleteResume(
                                            index: index);
                                      },
                                      child: Icon(
                                        Icons.delete,
                                        size: 20.sp,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      )
              ],
            ),
          );
        });
  }
}
