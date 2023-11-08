import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resumebuilder/Controller/OptionScreenController/OptionScreenController.dart';
import 'package:resumebuilder/Widget/backButton.dart';


class Option_Screen extends StatefulWidget {
  const Option_Screen({Key? key}) : super(key: key);
  static const String RouteName = "/BuildOptionsPage";

  @override
  State<Option_Screen> createState() => _Option_ScreenState();
}

class _Option_ScreenState extends State<Option_Screen> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: OptionScreenController(),
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
                onTap: () {
                  // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please Fill Up Data")));
                  // Navigator.of(context).pushNamed("contact_info_page");
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
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed(option["routes"], arguments: {"title": option["routes"]});
                              },
                              child: Row(
                                children: [
                                  SizedBox(width: 5.sp),
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
                                  const Icon(Icons.arrow_forward_ios_sharp),
                                  SizedBox(width: 10.sp),
                                ],
                              ),
                            ),
                            const Divider(),
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
      }
    );
  }
}
