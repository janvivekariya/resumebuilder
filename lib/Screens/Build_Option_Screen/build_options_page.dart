import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resumebuilder/Widget/backButton.dart';


class Build_Options_Page extends StatefulWidget {
  const Build_Options_Page({Key? key}) : super(key: key);
  static const String RouteName = "/BuildOptionsPage";

  @override
  State<Build_Options_Page> createState() => _Build_Options_PageState();
}

class _Build_Options_PageState extends State<Build_Options_Page> {
  List<Map> options = [
    {
      "id": 1,
      "option_name": "Contact info",
      "image": "assets/icons/contact_detail-removebg-preview (1).png",
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: backButton(context),
        backgroundColor: Color(0xff0475FF),
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
                  ...options.map((option) {
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
}
