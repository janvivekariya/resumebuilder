import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:resumebuilder/Controller/CarrierObjectiveScreenController/CarrierObjectiveScreenController.dart';
import 'package:resumebuilder/Controller/ContactInfoScreenController/ContactInfoScreenController.dart';
import 'package:resumebuilder/Controller/EducationScreenController/EducationScreenController.dart';
import 'package:resumebuilder/Controller/ExpereinceScreenController/ExpereinceScreenController.dart';
import 'package:resumebuilder/Controller/HomeScreenController/HomeScreenController.dart';
import 'package:resumebuilder/Controller/OptionScreenController/OptionScreenController.dart';
import 'package:resumebuilder/Controller/PersonalDetailsScreenController/PersonalDetailsScreenController.dart';
import 'package:resumebuilder/Controller/TechnicalScreenController/TechnicalScreenController.dart';
import 'package:resumebuilder/Screens/PDF_Screen/PDF_Screen.dart';
import 'package:resumebuilder/Widget/backButton.dart';
import 'package:resumebuilder/main.dart';

class Option_Screen extends StatefulWidget {
  final int? index;

  const Option_Screen({this.index});

  static const String RouteName = "/BuildOptionsPage";

  @override
  State<Option_Screen> createState() => _Option_ScreenState();
}

class _Option_ScreenState extends State<Option_Screen> {
  ContactInfoScreenController contactInfoScreenController =
      Get.put(ContactInfoScreenController());
  CarrierObjectiveScreenController carrierObjectiveScreenController =
      Get.put(CarrierObjectiveScreenController());
  PersonalDetailsScreenController personalDetailsScreenController =
      Get.put(PersonalDetailsScreenController());
  EducationScreenController educationScreenController =
      Get.put(EducationScreenController());
  ExpereinceScreenController expereinceScreenController =
      Get.put(ExpereinceScreenController());
  TechnicalScreenController technicalScreenController =
      Get.put(TechnicalScreenController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: HomeScreenController(),
        builder: (homescreencontroller) {
          return GetBuilder(
              init: OptionScreenController(index: widget.index!),
              builder: (optionscreencontroller) {
                return Scaffold(
                  appBar: AppBar(
                    leading: backButton(context),
                    backgroundColor: const Color(0xff0475FF),
                    title: const Text("Build Options"),
                    centerTitle: true,
                    elevation: 0,
                    actions: [
                      InkWell(
                        onTap: () async {
                          Map resumeMap = {
                            "name": contactInfoScreenController.name ?? "",
                            "email": contactInfoScreenController.email ?? "",
                            "phone": contactInfoScreenController.phone ?? "",
                            "address1":
                                contactInfoScreenController.address1 ?? "",
                            "address2":
                                contactInfoScreenController.address2 ?? "",
                            "address3":
                                contactInfoScreenController.address3 ?? "",
                            "objective": carrierObjectiveScreenController
                                    .careerObjectiveDescription ??
                                "",
                            "designation": carrierObjectiveScreenController
                                    .careerObjectiveExperienced ??
                                "",
                            "dob":
                                personalDetailsScreenController.dateOfBirth ??
                                    "",
                            "maritalstatus":
                                personalDetailsScreenController.maritalStatus ??
                                    "",
                            "english":
                                personalDetailsScreenController.englishCheckBox,
                            "hindi":
                                personalDetailsScreenController.hindiCheckBox,
                            "gujarati":
                                personalDetailsScreenController.gujratiCheckBox,
                            "nationality":
                                personalDetailsScreenController.nationality ??
                                    "",
                            "course": educationScreenController.course ?? "",
                            "college": educationScreenController.collage ?? "",
                            "percentage": educationScreenController.marks ?? "",
                            "passyear":
                                educationScreenController.passYear ?? "",
                            "companyname": expereinceScreenController
                                    .experienceCompanyName ??
                                "",
                            "role":
                                expereinceScreenController.experienceRole ?? "",
                            "status": expereinceScreenController
                                    .experienceEmployedStatus ??
                                "",
                            "joindate":
                                expereinceScreenController.experienceJoinDate ??
                                    "",
                            "exitdate":
                                expereinceScreenController.experienceExitDate ??
                                    "",
                            "technicalskill":
                                technicalScreenController.technicalSkills ?? [],
                            "time": DateFormat('dd-MM-yyyy hh:mm')
                                .format(DateTime.now()),
                          };
                          String encodedMap = jsonEncode(resumeMap);
                          homescreencontroller.resumes!.add(encodedMap);
                          await storageBox
                              .write("resumes", homescreencontroller.resumes!)
                              .then((value) {
                            Navigator.of(context)
                                .pushNamed(PDF_Screen.RouteName);
                          });
                          setState(() {});
                        },
                        child: const SizedBox(
                          width: 60,
                          child: Icon(Icons.picture_as_pdf),
                        ),
                      )
                    ],
                  ),
                  body: Column(
                    children: [
                      Expanded(
                        flex: 18,
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              ...optionscreencontroller.options.map((option) {
                                print("Options is:${option}");
                                return Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).pushNamed(
                                          option["routes"],
                                        );
                                      },
                                      child: Container(
                                        margin: EdgeInsets.all(5.sp),
                                        padding: EdgeInsets.all(10.sp),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.5),
                                                  blurRadius: 1.sp,
                                                  spreadRadius: 0.5.sp,
                                                  offset: Offset(2, 2))
                                            ]),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              option["image"],
                                              height: 40.sp,
                                            ),
                                            SizedBox(width: 10.sp),
                                            Text(
                                              option["option_name"],
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                              ),
                                            ),
                                            const Spacer(),
                                            const Icon(
                                                Icons.arrow_forward_ios_sharp),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }).toList(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              });
        });
  }
}
