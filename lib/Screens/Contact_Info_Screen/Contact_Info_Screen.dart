import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resumebuilder/Controller/ContactInfoScreenController/ContactInfoScreenController.dart';
import 'package:resumebuilder/Widget/backButton.dart';

class Contact_Info_Screen extends StatefulWidget {
  const Contact_Info_Screen({Key? key}) : super(key: key);
  static const String RouteName = "/Contact_InfoScreen";

  @override
  State<Contact_Info_Screen> createState() => _Contact_Info_ScreenState();
}

class _Contact_Info_ScreenState extends State<Contact_Info_Screen> {
  Color MyColor = const Color(0xff0475FF);
  int initialIndex = 0;

  final GlobalKey<FormState> contactFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return GetBuilder(
        init: ContactInfoScreenController(),
        builder: (contactinfocontroller) {
          return Scaffold(
            appBar: AppBar(
              leading: backButton(context),
              backgroundColor: MyColor,
              title: Text("Contact Info"),
              centerTitle: true,
              elevation: 0,
            ),
            body: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                  color: const Color(0xffEDEDED),
                  borderRadius: BorderRadius.circular(10.r)),
              child: IndexedStack(
                index: initialIndex,
                children: [
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Container(
                          height: _height * 0.58,
                          margin: const EdgeInsets.all(20),
                          padding:
                              const EdgeInsets.symmetric(horizontal: 15),
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
                            child: Form(
                              key: contactFormKey,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 15.sp,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Image.asset(
                                          "assets/icons/user.png",
                                          height: _height * 0.048,
                                        ),
                                      ),
                                      SizedBox(width: _width * 0.02),
                                      Expanded(
                                        flex: 4,
                                        child: TextFormField(
                                          controller:
                                              contactinfocontroller
                                                  .nameController,
                                          validator: (val) {
                                            if (val!.isEmpty) {
                                              return "Enter your Name First...";
                                            }
                                            return null;
                                          },
                                          onSaved: (val) {
                                            contactinfocontroller.forName(
                                                value: val);
                                          },
                                          decoration: InputDecoration(
                                            hintText: "Name",
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.sp,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Image.asset(
                                          "assets/icons/email.png",
                                          height: _height * 0.048,
                                        ),
                                      ),
                                      SizedBox(width: _width * 0.02),
                                      Expanded(
                                        flex: 4,
                                        child: TextFormField(
                                          controller:
                                              contactinfocontroller
                                                  .emailController,
                                          validator: (val) {
                                            if (val!.isEmpty) {
                                              return "Enter your Email First...";
                                            }
                                            return null;
                                          },
                                          onSaved: (val) {
                                            contactinfocontroller
                                                .forEmail(value: val);
                                          },
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            hintText: "Email",
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.sp,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Image.asset(
                                          "assets/icons/smartphone-call.png",
                                          height: _height * 0.048,
                                        ),
                                      ),
                                      SizedBox(width: _width * 0.02),
                                      Expanded(
                                        flex: 4,
                                        child: TextFormField(
                                          controller:
                                              contactinfocontroller
                                                  .phoneController,
                                          validator: (val) {
                                            if (val!.isEmpty) {
                                              return "Enter your Phone First...";
                                            }
                                            return null;
                                          },
                                          onSaved: (val) {
                                            contactinfocontroller
                                                .forPhone(value: val);
                                          },
                                          keyboardType:
                                              TextInputType.phone,
                                          decoration: InputDecoration(
                                            hintText: "Phone",
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.sp,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Image.asset(
                                          "assets/icons/pin.png",
                                          height: _height * 0.048,
                                        ),
                                      ),
                                      SizedBox(width: _width * 0.02),
                                      Expanded(
                                        flex: 4,
                                        child: TextFormField(
                                          controller:
                                              contactinfocontroller
                                                  .address1Controller,
                                          validator: (val) {
                                            if (val!.isEmpty) {
                                              return "Enter your Address First...";
                                            }
                                            return null;
                                          },
                                          onSaved: (val) {
                                            contactinfocontroller
                                                .forAddress1(value: val);
                                          },
                                          decoration: InputDecoration(
                                            hintText:
                                                "Address (Street, Building No)",
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.sp,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(child: Container()),
                                      SizedBox(width: _width * 0.02),
                                      Expanded(
                                        flex: 4,
                                        child: TextFormField(
                                          controller:
                                              contactinfocontroller
                                                  .address2Controller,
                                          onSaved: (val) {
                                            contactinfocontroller
                                                .forAddress2(value: val);
                                          },
                                          decoration: InputDecoration(
                                            hintText: "Address Line 2",
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.sp,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(child: Container()),
                                      SizedBox(width: _width * 0.02),
                                      Expanded(
                                        flex: 4,
                                        child: TextFormField(
                                          controller:
                                              contactinfocontroller
                                                  .address3Controller,
                                          onSaved: (val) {
                                            contactinfocontroller
                                                .forAddress3(value: val);
                                          },
                                          decoration: InputDecoration(
                                            hintText: "Address Line 3",
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: _height * 0.02),
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                if (contactFormKey.currentState!
                                    .validate()) {
                                  contactFormKey.currentState!.save();
                                }
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: MyColor,
                              ),
                              child: const Text("Save"),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  contactFormKey.currentState!.reset();

                                  contactinfocontroller.nameController
                                      .clear();
                                  contactinfocontroller.emailController
                                      .clear();
                                  contactinfocontroller.phoneController
                                      .clear();
                                  contactinfocontroller.address1Controller
                                      .clear();
                                  contactinfocontroller.address2Controller
                                      .clear();
                                  contactinfocontroller.address3Controller
                                      .clear();
                                  setState(() {
                                    contactinfocontroller.name = null;
                                    contactinfocontroller.email = null;
                                    contactinfocontroller.phone = null;
                                    contactinfocontroller.address1 = null;
                                    contactinfocontroller.address2 = null;
                                    contactinfocontroller.address3 = null;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: MyColor,
                                ),
                                child: const Text("Clear")),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: _height * 0.29,
                    width: _width,
                    margin: const EdgeInsets.all(20),
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
                    alignment: Alignment.center,
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          backgroundImage: (contactinfocontroller.image !=
                                  null)
                              ? FileImage(contactinfocontroller.image!)
                              : null,
                          radius: 60,
                          backgroundColor: const Color(0xffC4C4C4),
                          child: (contactinfocontroller.image == null)
                              ? const Text(
                                  "ADD",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              : const Text(""),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text(
                                    "When You go to pick Image ?"),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () async {
                                      contactinfocontroller
                                          .forImageFromGallery(
                                              context: context);
                                      Navigator.pop(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: MyColor,
                                    ),
                                    child: const Text("Gallery"),
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      contactinfocontroller
                                          .forImageFromCamera(
                                              context: context);
                                      Navigator.pop(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: MyColor,
                                    ),
                                    child: const Text("Camera"),
                                  ),
                                ],
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            primary: MyColor,
                          ),
                          child: const Icon(Icons.add),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
