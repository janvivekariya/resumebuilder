import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resumebuilder/Splash_Screen.dart';
import 'Routes/Route.dart' as route;

void main() {
  runApp(const resume_builder());
}

class resume_builder extends StatefulWidget {
  const resume_builder({super.key});

  @override
  State<resume_builder> createState() => _resume_builderState();
}

class _resume_builderState extends State<resume_builder> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return const GetMaterialApp(
          home: Splash_Screen(),
          onGenerateRoute: route.Routes.OnRouteGenerate,
        );
      },
    );

  }
}
