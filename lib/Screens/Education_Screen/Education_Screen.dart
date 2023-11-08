import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resumebuilder/Controller/EducationScreenController/EducationScreenController.dart';
import 'package:resumebuilder/Widget/backButton.dart';

class Education_Screen extends StatefulWidget {
  final String? title;

  const Education_Screen({Key? key, this.title}) : super(key: key);
  static const String RouteName = "/education";

  @override
  State<Education_Screen> createState() => _Education_ScreenState();
}

class _Education_ScreenState extends State<Education_Screen> {
  Color MyColor = const Color(0xff0475FF);

  var MyTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: const Color(0xff0475FF).withOpacity(0.8),
  );

  final GlobalKey<FormState> educationFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Color MyColor = const Color(0xff0475FF);
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return GetBuilder(
        init: EducationScreenController(),
        builder: (educationscreencontroller) {
          return Scaffold(
            appBar: AppBar(
              leading: backButton(context),
              backgroundColor: MyColor,
              title: const Text("Education"),
              centerTitle: true,
              elevation: 0,
            ),
            body: Column(
              children: [
                Expanded(
                  flex: 18,
                  child: Container(
                    color: const Color(0xffEDEDED),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                top: 30, bottom: 20, right: 20, left: 20),
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.r),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      offset: Offset(2, 2),
                                      spreadRadius: 1.sp,
                                      blurRadius: 1.sp)
                                ]),
                            child: Form(
                              key: educationFormKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Course/Degree", style: MyTextStyle),
                                  SizedBox(height: _height * 0.015),
                                  TextFormField(
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return "Enter your Course/Degree First...";
                                      }
                                      return null;
                                    },
                                    onSaved: (val) {
                                      educationscreencontroller.forCourse(
                                          value: val);
                                    },
                                    controller: educationscreencontroller
                                        .courseController,
                                    decoration: const InputDecoration(
                                      hintText:
                                          "B. Tech Information Technology",
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  SizedBox(height: _height * 0.015),
                                  Text("School/Collage/Institute",
                                      style: MyTextStyle),
                                  SizedBox(height: _height * 0.015),
                                  TextFormField(
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return "Enter your School/Collage/Institute First...";
                                      }
                                      return null;
                                    },
                                    onSaved: (val) {
                                      educationscreencontroller.forCollage(
                                          value: val);
                                    },
                                    controller: educationscreencontroller
                                        .collageController,
                                    decoration: const InputDecoration(
                                      hintText: "Bhagavan Mahavir University",
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  SizedBox(height: _height * 0.015),
                                  Text("Percentage",
                                      style: MyTextStyle),
                                  SizedBox(height: _height * 0.015),
                                  TextFormField(
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return "Enter your Marks/CGPA First...";
                                      }
                                      return null;
                                    },
                                    onSaved: (val) {
                                      educationscreencontroller.forMarks(
                                          value: val);
                                    },
                                    controller: educationscreencontroller
                                        .marksController,
                                    decoration: const InputDecoration(
                                      hintText: "70% (or) 7.0 CGPA",
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  SizedBox(height: _height * 0.015),
                                  Text("Year Of Pass", style: MyTextStyle),
                                  SizedBox(height: _height * 0.015),
                                  TextFormField(
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return "Enter your Year Of Pass First...";
                                      }
                                      return null;
                                    },
                                    onSaved: (val) {
                                      educationscreencontroller.forPassYear(
                                          value: val);
                                    },
                                    keyboardType: TextInputType.number,
                                    controller: educationscreencontroller
                                        .passYearController,
                                    decoration: const InputDecoration(
                                      hintText: "2019",
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  if (educationFormKey.currentState!
                                      .validate()) {
                                    educationFormKey.currentState!.save();

                                    setState(() => Navigator.of(context).pop());
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: MyColor,
                                ),
                                child: const Text("Save"),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  educationFormKey.currentState!.reset();

                                  educationscreencontroller.courseController
                                      .clear();
                                  educationscreencontroller.collageController
                                      .clear();
                                  educationscreencontroller.marksController
                                      .clear();
                                  educationscreencontroller.passYearController
                                      .clear();
                                  setState(() {
                                    educationscreencontroller.course = null;
                                    educationscreencontroller.collage = null;
                                    educationscreencontroller.marks = null;
                                    educationscreencontroller.passYear = null;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: MyColor,
                                ),
                                child: const Text("Clear"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
