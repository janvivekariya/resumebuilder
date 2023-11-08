import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EducationScreenController extends GetxController {
  String? course;
  String? collage;
  String? marks;
  String? passYear;

  final TextEditingController courseController = TextEditingController();
  final TextEditingController collageController = TextEditingController();
  final TextEditingController marksController = TextEditingController();
  final TextEditingController passYearController = TextEditingController();

  forCourse({String? value}) {
    course = value;
    update();
  }

  forCollage({String? value}) {
    collage = value;
    update();
  }

  forMarks({String? value}) {
    marks = value;
    update();
  }

  forPassYear({String? value}) {
    passYear = value;
    update();
  }
}
