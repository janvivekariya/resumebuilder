import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resumebuilder/Controller/TechnicalScreenController/TechnicalScreenController.dart';
import 'package:resumebuilder/Widget/backButton.dart';

class Technical_Skills_Screen extends StatefulWidget {
  final String? title;

  const Technical_Skills_Screen({Key? key, this.title}) : super(key: key);
  static const String RouteName = "/TechnicalSkillsScreen";

  @override
  State<Technical_Skills_Screen> createState() =>
      _Technical_Skills_ScreenState();
}

class _Technical_Skills_ScreenState extends State<Technical_Skills_Screen> {
  @override
  Widget build(BuildContext context) {
    Color MyColor = const Color(0xff0475FF);
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return GetBuilder(
        init: TechnicalScreenController(),
        builder: (technicalscreencontroller) {
          return Scaffold(
            appBar: AppBar(
              leading: backButton(context),
              backgroundColor: MyColor,
              title: const Text("Technical Skills"),
              centerTitle: true,
              elevation: 0,
            ),
            body: Container(
              height: double.infinity,
              color: const Color(0xffEDEDED),
              child: Container(
                margin: const EdgeInsets.all(20),
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
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(height: _height * 0.02),
                      ...technicalscreencontroller.allTextFildList
                          .map((e) =>
                              technicalscreencontroller.getTextFild(
                                  i: technicalscreencontroller
                                      .allTextFildList
                                      .indexOf(e),
                                  row: e))
                          .toList(),
                      SizedBox(height: _height * 0.06),
                      Container(
                        height: _height * 0.055,
                        width: _width,
                        child: OutlinedButton(
                          child: const Icon(Icons.add),
                          onPressed: () {
                            technicalscreencontroller.forAddFeild();
                          },
                        ),
                      ),
                      SizedBox(height: _height * 0.03),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            Navigator.pop(context);
                          });
                          technicalscreencontroller.allControllers
                              .forEach((element) {
                            technicalscreencontroller.technicalSkills
                                .add(element.text.toString());
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: MyColor,
                        ),
                        child: const Text("Save"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
