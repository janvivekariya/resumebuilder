import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resumebuilder/Controller/PersonalDetailsScreenController/PersonalDetailsScreenController.dart';
import 'package:resumebuilder/Controller/VariableController/VariableController.dart';
import 'package:resumebuilder/Widget/backButton.dart';

class Personal_Detail_Screen extends StatefulWidget {
  final String? title;

  const Personal_Detail_Screen({Key? key, this.title}) : super(key: key);
  static const String RouteName = "/PersonalDetailScreen";

  @override
  State<Personal_Detail_Screen> createState() => _Personal_Detail_ScreenState();
}

class _Personal_Detail_ScreenState extends State<Personal_Detail_Screen> {
  Color MyColor = const Color(0xff0475FF);
  var MyTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: const Color(0xff0475FF).withOpacity(0.8),
  );

  final GlobalKey<FormState> personalDetailsFormKey = GlobalKey<FormState>();

  bool? maritalStatues;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return GetBuilder(
        init: PersonalDetailsScreenController(),
        builder: (personalscreencontroller) {
          return Scaffold(
            appBar: AppBar(
              leading: backButton(context),
              backgroundColor: MyColor,
              title: const Text("Personal Details"),
              centerTitle: true,
              elevation: 0,
            ),
            body: Column(
              children: [
                Expanded(
                  flex: 18,
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: const Color(0xffEDEDED),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Container(
                            color: Colors.white,
                            padding: const EdgeInsets.all(30),
                            margin: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 20, top: 30),
                            child: Form(
                              key: personalDetailsFormKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("DOB", style: MyTextStyle),
                                  SizedBox(height: _height * 0.015),
                                  TextFormField(
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return "Enter your Date of Birth First...";
                                      }
                                      return null;
                                    },
                                    onTap: () {
                                      personalscreencontroller.forDateofBirth(
                                          context: context);
                                    },
                                    keyboardType: TextInputType.datetime,
                                    controller: personalscreencontroller
                                        .dateOfBirthController,
                                    decoration: const InputDecoration(
                                      hintText: "DD/MM/YYYY",
                                      alignLabelWithHint: true,
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  SizedBox(height: _height * 0.015),
                                  Text("Marital Status", style: MyTextStyle),
                                  RadioListTile(
                                    title: const Text("Single"),
                                    value: "Single",
                                    contentPadding: const EdgeInsets.all(0),
                                    groupValue:
                                        personalscreencontroller.maritalStatus,
                                    onChanged: (val) {
                                      personalscreencontroller.forMaritalStatus(
                                          value: val.toString());
                                    },
                                  ),
                                  RadioListTile(
                                    title: const Text("Married"),
                                    value: "Married",
                                    contentPadding: const EdgeInsets.all(0),
                                    groupValue:
                                        personalscreencontroller.maritalStatus,
                                    onChanged: (val) {
                                      personalscreencontroller.forMaritalStatus(
                                          value: val.toString());
                                    },
                                  ),
                                  Text("Languages Known", style: MyTextStyle),
                                  SizedBox(height: _height * 0.01),
                                  //Check Box
                                  Row(
                                    children: [
                                      Checkbox(
                                          value: personalscreencontroller
                                              .englishCheckBox,
                                          onChanged: (val) {
                                            personalscreencontroller
                                                .forEnglishLan(value: val);
                                          }),
                                      const SizedBox(width: 10),
                                      const Text("English")
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Checkbox(
                                          value: personalscreencontroller
                                              .hindiCheckBox,
                                          onChanged: (val) {
                                            personalscreencontroller
                                                .forHindiLan(value: val);
                                          }),
                                      const SizedBox(width: 10),
                                      const Text("Hindi")
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Checkbox(
                                          value: personalscreencontroller
                                              .gujratiCheckBox,
                                          onChanged: (val) {
                                            personalscreencontroller
                                                .forGujaratiLan(value: val);
                                          }),
                                      const SizedBox(width: 10),
                                      const Text("Gujarati"),
                                    ],
                                  ),
                                  SizedBox(height: _height * 0.015),
                                  Text("Nationality", style: MyTextStyle),
                                  SizedBox(height: _height * 0.015),
                                  TextFormField(
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return "Enter your Nationality First...";
                                      }
                                      return null;
                                    },
                                    onSaved: (val) {
                                      personalscreencontroller.forNationality(
                                          value: val);
                                    },
                                    controller: personalscreencontroller
                                        .nationalityController,
                                    decoration: const InputDecoration(
                                      hintText: "Indian",
                                      alignLabelWithHint: true,
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
                                  if (personalDetailsFormKey.currentState!
                                      .validate()) {
                                    personalDetailsFormKey.currentState!.save();
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
                                  personalDetailsFormKey.currentState!.reset();

                                  personalscreencontroller.dateOfBirthController
                                      .clear();
                                  personalscreencontroller.nationalityController
                                      .clear();
                                  setState(() {
                                    personalscreencontroller.dateOfBirth = null;
                                    personalscreencontroller.maritalStatus =
                                        null;
                                    personalscreencontroller.nationality = null;
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
