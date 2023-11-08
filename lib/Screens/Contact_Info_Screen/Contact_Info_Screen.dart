import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resumebuilder/Controller/VariableController/VariableController.dart';
import 'package:resumebuilder/Widget/backButton.dart';

class Contact_Info_Screen extends StatefulWidget {
  final String? title;

  const Contact_Info_Screen({Key? key, this.title}) : super(key: key);
  static const String RouteName = "/Contact_infoScreen";

  @override
  State<Contact_Info_Screen> createState() => _Contact_Info_ScreenState();
}

class _Contact_Info_ScreenState extends State<Contact_Info_Screen> {
  Color MyColor = const Color(0xff0475FF);
  int initialIndex = 0;

  final ImagePicker _picker = ImagePicker();

  final GlobalKey<FormState> contactFormKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController address1Controller = TextEditingController();
  final TextEditingController address2Controller = TextEditingController();
  final TextEditingController address3Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return GetBuilder(
        init: VariableController(),
        builder: (variablecontroller) {
          return Scaffold(
            appBar: AppBar(
              leading: backButton(context),
              backgroundColor: MyColor,
              title: Text(widget.title!.substring(1, widget.title!.length)),
              centerTitle: true,
              elevation: 0,
            ),
            body: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    width: _width,
                    alignment: const Alignment(0, 0.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: InkWell(
                            splashFactory: InkRipple.splashFactory,
                            splashColor: Colors.white.withOpacity(0.2),
                            onTap: () {
                              setState(() {
                                initialIndex = 0;
                              });
                            },
                            child: Ink(
                              color: MyColor,
                              child: Container(
                                alignment: Alignment.bottomCenter,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Spacer(),
                                    const Text(
                                      "Contact",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                      ),
                                    ),
                                    const Spacer(),
                                    Container(
                                      color: (initialIndex == 0)
                                          ? Colors.yellow
                                          : MyColor,
                                      height: 2,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashFactory: InkRipple.splashFactory,
                            splashColor: Colors.white.withOpacity(0.2),
                            onTap: () {
                              setState(() {
                                initialIndex = 1;
                              });
                            },
                            child: Ink(
                              color: MyColor,
                              child: Container(
                                alignment: Alignment.bottomCenter,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Spacer(),
                                    const Text(
                                      "Photo",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                      ),
                                    ),
                                    const Spacer(),
                                    Container(
                                      color: (initialIndex == 1)
                                          ? Colors.yellow
                                          : MyColor,
                                      height: 2,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 18,
                  child: Container(
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
                                height: _height * 0.48,
                                margin: const EdgeInsets.all(20),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                color: Colors.white,
                                child: SingleChildScrollView(
                                  physics: const BouncingScrollPhysics(),
                                  child: Expanded(
                                    flex: 7,
                                    child: Form(
                                      key: contactFormKey,
                                      child: Column(
                                        children: [
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
                                                  controller: nameController,
                                                  validator: (val) {
                                                    if (val!.isEmpty) {
                                                      return "Enter your Name First...";
                                                    }
                                                    return null;
                                                  },
                                                  onSaved: (val) {
                                                    setState(() {
                                                      variablecontroller.name =
                                                          val;
                                                    });
                                                  },
                                                  decoration:
                                                      const InputDecoration(
                                                    hintText: "Name",
                                                    label: Text("Name"),
                                                  ),
                                                ),
                                              ),
                                            ],
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
                                                  controller: emailController,
                                                  validator: (val) {
                                                    if (val!.isEmpty) {
                                                      return "Enter your Email First...";
                                                    }
                                                    return null;
                                                  },
                                                  onSaved: (val) {
                                                    setState(() {
                                                      variablecontroller.email =
                                                          val;
                                                    });
                                                  },
                                                  keyboardType: TextInputType
                                                      .emailAddress,
                                                  decoration:
                                                      const InputDecoration(
                                                    hintText: "Email",
                                                    label: Text("Email"),
                                                  ),
                                                ),
                                              ),
                                            ],
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
                                                  controller: phoneController,
                                                  validator: (val) {
                                                    if (val!.isEmpty) {
                                                      return "Enter your Phone First...";
                                                    }
                                                    return null;
                                                  },
                                                  onSaved: (val) {
                                                    setState(() {
                                                      variablecontroller.phone =
                                                          val;
                                                    });
                                                  },
                                                  keyboardType:
                                                      TextInputType.phone,
                                                  decoration:
                                                      const InputDecoration(
                                                    hintText: "Phone",
                                                    label: Text("Phone"),
                                                  ),
                                                ),
                                              ),
                                            ],
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
                                                      address1Controller,
                                                  validator: (val) {
                                                    if (val!.isEmpty) {
                                                      return "Enter your Address First...";
                                                    }
                                                    return null;
                                                  },
                                                  onSaved: (val) {
                                                    setState(() {
                                                      variablecontroller
                                                          .address1 = val;
                                                    });
                                                  },
                                                  decoration:
                                                      const InputDecoration(
                                                    hintText:
                                                        "Address (Street, Building No)",
                                                    label: Text(
                                                        "Address (Street, Building No)"),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(child: Container()),
                                              SizedBox(width: _width * 0.02),
                                              Expanded(
                                                flex: 4,
                                                child: TextFormField(
                                                  controller:
                                                      address2Controller,
                                                  onSaved: (val) {
                                                    setState(() {
                                                      variablecontroller
                                                          .address2 = val;
                                                    });
                                                  },
                                                  decoration:
                                                      const InputDecoration(
                                                    hintText: "Address Line 2",
                                                    label:
                                                        Text("Address Line 2"),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(child: Container()),
                                              SizedBox(width: _width * 0.02),
                                              Expanded(
                                                flex: 4,
                                                child: TextFormField(
                                                  controller:
                                                      address3Controller,
                                                  onSaved: (val) {
                                                    setState(() {
                                                      variablecontroller
                                                          .address3 = val;
                                                    });
                                                  },
                                                  decoration:
                                                      const InputDecoration(
                                                    hintText: "Address Line 3",
                                                    label:
                                                        Text("Address Line 3"),
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

                                        nameController.clear();
                                        emailController.clear();
                                        phoneController.clear();
                                        address1Controller.clear();
                                        address2Controller.clear();
                                        address3Controller.clear();
                                        setState(() {
                                          variablecontroller.name = null;
                                          variablecontroller.email = null;
                                          variablecontroller.phone = null;
                                          variablecontroller.address1 = null;
                                          variablecontroller.address2 = null;
                                          variablecontroller.address3 = null;
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
                          color: Colors.white,
                          height: _height * 0.29,
                          width: _width,
                          margin: const EdgeInsets.all(20),
                          alignment: Alignment.center,
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    (variablecontroller.image != null)
                                        ? FileImage(variablecontroller.image!)
                                        : null,
                                radius: 60,
                                backgroundColor: const Color(0xffC4C4C4),
                                child: (variablecontroller.image == null)
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
                                            XFile? pickerFile =
                                                await _picker.pickImage(
                                                    source:
                                                        ImageSource.gallery);
                                            setState(() {
                                              variablecontroller.image =
                                                  File(pickerFile!.path);
                                              Navigator.of(context).pop();
                                            });
                                          },
                                          style: ElevatedButton.styleFrom(
                                            primary: MyColor,
                                          ),
                                          child: const Text("gallery"),
                                        ),
                                        ElevatedButton(
                                          onPressed: () async {
                                            XFile? pickerFile =
                                                await _picker.pickImage(
                                                    source: ImageSource.camera);
                                            setState(() {
                                              variablecontroller.image =
                                                  File(pickerFile!.path);
                                              Navigator.of(context).pop();
                                            });
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
                ),
              ],
            ),
          );
        });
  }
}
