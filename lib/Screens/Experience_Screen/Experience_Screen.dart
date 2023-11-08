import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resumebuilder/Controller/ExpereinceScreenController/ExpereinceScreenController.dart';
import 'package:resumebuilder/Widget/backButton.dart';

class Experience_Screen extends StatefulWidget {
  final String? title;

  const Experience_Screen({Key? key, this.title}) : super(key: key);
  static const String RouteName = "/experience";

  @override
  State<Experience_Screen> createState() => _Experience_ScreenState();
}

class _Experience_ScreenState extends State<Experience_Screen> {
  Color MyColor = const Color(0xff0475FF);
  var MyTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: const Color(0xff0475FF).withOpacity(0.8),
  );

  final GlobalKey<FormState> experienceFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return GetBuilder(
        init: ExpereinceScreenController(),
        builder: (experiencescreencontroller) {
          return Scaffold(
            appBar: AppBar(
              leading: backButton(context),
              backgroundColor: MyColor,
              title: const Text("Experience"),
              centerTitle: true,
              elevation: 0,
            ),
            body: Container(
              height: double.infinity,
              color: const Color(0xffEDEDED),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                          top: 30, bottom: 20, right: 20, left: 20),
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
                      padding: const EdgeInsets.all(20),
                      child: Form(
                        key: experienceFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Company Name", style: MyTextStyle),
                            SizedBox(height: _height * 0.015),
                            TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Enter your Company Name First...";
                                }
                                return null;
                              },
                              onSaved: (val) {
                                experiencescreencontroller.forCompany(
                                    value: val);
                              },
                              controller: experiencescreencontroller
                                  .companyNameController,
                              decoration: const InputDecoration(
                                hintText: "New Enterprise, San Francisco",
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: _height * 0.015),
                            Text("Roles (optional)", style: MyTextStyle),
                            SizedBox(height: _height * 0.015),
                            TextFormField(
                              onSaved: (val) {
                                experiencescreencontroller.forRole(
                                    value: val);
                              },
                              maxLines: 3,
                              controller: experiencescreencontroller
                                  .roleController,
                              decoration: const InputDecoration(
                                hintText:
                                    "Working With team member to\ncome Up With new concepts and\nproducts analysis...",
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: _height * 0.015),
                            const Text(
                              "Employed Status",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.grey),
                            ),
                            // Employed Status Radio Button
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Row(
                                    children: [
                                      Radio(
                                        value: "Previously Employed",
                                        groupValue:
                                            experiencescreencontroller
                                                .experienceEmployedStatus,
                                        onChanged: (val) {
                                          experiencescreencontroller
                                              .forStatus(value: val);
                                        },
                                      ),
                                      const Text(
                                        "Previously Employed",
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 12,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio(
                                        value: "Currently Employed",
                                        groupValue:
                                            experiencescreencontroller
                                                .experienceEmployedStatus,
                                        onChanged: (val) {
                                          experiencescreencontroller
                                              .forCompany(value: val);
                                        },
                                      ),
                                      const Text(
                                        "Currently Employed",
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 12,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(color: Colors.grey, height: 1),
                            //Join Date Exit Date
                            SizedBox(height: _height * 0.015),
                            Row(
                              children: [
                                // join Date
                                Expanded(
                                  child: Column(
                                    children: [
                                      const Text(
                                        "Date Joined",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(height: _height * 0.01),
                                      TextFormField(
                                        validator: (val) {
                                          if (val!.isEmpty) {
                                            return "Enter your Join Date First...";
                                          }
                                          return null;
                                        },
                                        onTap: () {
                                          experiencescreencontroller
                                              .forJoinDate(
                                                  context: context);
                                        },
                                        keyboardType:
                                            TextInputType.datetime,
                                        controller:
                                            experiencescreencontroller
                                                .joinDateController,
                                        decoration: const InputDecoration(
                                          hintText: "DD/MM/YYYY",
                                          alignLabelWithHint: true,
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: _width * 0.05),
                                // Exit Date
                                Expanded(
                                  child: (experiencescreencontroller
                                              .experienceEmployedStatus ==
                                          "Previously Employed")
                                      ? Column(
                                          children: [
                                            const Text(
                                              "Exit Joined",
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 17,
                                                fontWeight:
                                                    FontWeight.w500,
                                              ),
                                            ),
                                            SizedBox(
                                                height: _height * 0.01),
                                            TextFormField(
                                              validator: (val) {
                                                if (val!.isEmpty) {
                                                  return "Enter your Exit Date First...";
                                                }
                                                return null;
                                              },
                                              onTap: () {
                                                experiencescreencontroller
                                                    .forExitDate(
                                                        context: context);
                                              },
                                              keyboardType:
                                                  TextInputType.datetime,
                                              controller:
                                                  experiencescreencontroller
                                                      .exitDateController,
                                              decoration:
                                                  const InputDecoration(
                                                hintText: "DD/MM/YYYY",
                                                alignLabelWithHint: true,
                                                border:
                                                    OutlineInputBorder(),
                                              ),
                                            ),
                                          ],
                                        )
                                      : Container(),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),

                    //Save And Clear Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (experienceFormKey.currentState!
                                .validate()) {
                              experienceFormKey.currentState!.save();

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
                            experienceFormKey.currentState!.reset();
                            experiencescreencontroller
                                .companyNameController
                                .clear();
                            experiencescreencontroller.roleController
                                .clear();
                            experiencescreencontroller
                                .experienceCompanyName = null;
                            experiencescreencontroller.experienceRole =
                                null;
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
          );
        });
  }
}
