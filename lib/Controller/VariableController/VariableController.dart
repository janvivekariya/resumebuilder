import 'dart:io';

import 'package:get/get.dart';

class VariableController extends GetxController {
  String? name;
  String? email;
  String? phone;
  String? address1;
  String? address2;
  String? address3;

  File? image;

  String? careerObjectiveDescription;
  String? careerObjectiveExperienced;

  String? dateOfBirth;
  String? maritalStatus;
  bool englishCheckBox = false;
  bool hindiCheckBox = false;
  bool gujratiCheckBox = false;
  String? nationality;

  String? course;
  String? collage;
  String? marks;
  String? passYear;

  String? experienceCompanyName;
  String? experienceCollage;
  String? experienceRole;
  String? experienceEmployedStatus;
  String? experienceJoinDate;
  String? experienceExitDate;

  List technicalSkills = [];
  List interestHobbies = [];
  List achievement = [];
}
