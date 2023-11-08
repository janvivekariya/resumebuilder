import 'dart:convert';

import 'package:get/get.dart';
import 'package:resumebuilder/Controller/CarrierObjectiveScreenController/CarrierObjectiveScreenController.dart';
import 'package:resumebuilder/Controller/ContactInfoScreenController/ContactInfoScreenController.dart';
import 'package:resumebuilder/Controller/EducationScreenController/EducationScreenController.dart';
import 'package:resumebuilder/Controller/ExpereinceScreenController/ExpereinceScreenController.dart';
import 'package:resumebuilder/Controller/HomeScreenController/HomeScreenController.dart';
import 'package:resumebuilder/Controller/PersonalDetailsScreenController/PersonalDetailsScreenController.dart';
import 'package:resumebuilder/Controller/TechnicalScreenController/TechnicalScreenController.dart';
import 'package:resumebuilder/Screens/Carrier_Onjective_Screen/Carrier_Objective_Screen.dart';
import 'package:resumebuilder/Screens/Contact_Info_Screen/Contact_Info_Screen.dart';
import 'package:resumebuilder/Screens/Education_Screen/Education_Screen.dart';
import 'package:resumebuilder/Screens/Experience_Screen/Experience_Screen.dart';
import 'package:resumebuilder/Screens/Personal_Details_Screen/Personal_Detail_Screen.dart';
import 'package:resumebuilder/Screens/Technical_Skill_Screen/Technical_Skills_Screen.dart';
import 'package:resumebuilder/main.dart';

class OptionScreenController extends GetxController {
  final int index;

  OptionScreenController({required this.index});

  List<Map> options = [
    {
      "id": 1,
      "option_name": "Contact info",
      "image": "assets/icons/contact_detail-removebg-preview (1).png",
      "routes": Contact_Info_Screen.RouteName
    },
    {
      "id": 2,
      "option_name": "Carrier Objective",
      "image": "assets/icons/briefcase.png",
      "routes": Carrier_Objective_Screen.RouteName
    },
    {
      "id": 3,
      "option_name": "Personal Details",
      "image": "assets/icons/account.png",
      "routes": Personal_Detail_Screen.RouteName
    },
    {
      "id": 4,
      "option_name": "Educations",
      "image": "assets/icons/graduation-cap.png",
      "routes": Education_Screen.RouteName
    },
    {
      "id": 5,
      "option_name": "Experience",
      "image": "assets/icons/logical-thinking.png",
      "routes": Experience_Screen.RouteName
    },
    {
      "id": 6,
      "option_name": "Technical Skills",
      "image": "assets/icons/certificate.png",
      "routes": Technical_Skills_Screen.RouteName
    },
  ];

  @override
  void onInit() {
    forManageData();
    super.onInit();
  }

  forManageData() {
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
    HomeScreenController homeScreenController = Get.put(HomeScreenController());

    homeScreenController.resumes = storageBox.read("resumes") ?? [];

    if (homeScreenController.resumes!.isEmpty) {
      null;
    } else {
      Map decodedMap = jsonDecode(homeScreenController.resumes![index]);

      contactInfoScreenController.name = decodedMap["name"];
      contactInfoScreenController.nameController.text =
          contactInfoScreenController.name!;

      contactInfoScreenController.email = decodedMap["email"];
      contactInfoScreenController.emailController.text =
          contactInfoScreenController.email!;

      contactInfoScreenController.phone = decodedMap["phone"];
      contactInfoScreenController.phoneController.text =
          contactInfoScreenController.phone!;

      contactInfoScreenController.address1 = decodedMap["address1"];
      contactInfoScreenController.address1Controller.text =
          contactInfoScreenController.address1!;

      contactInfoScreenController.address2 = decodedMap["address2"];
      contactInfoScreenController.address2Controller.text =
          contactInfoScreenController.address2!;

      contactInfoScreenController.address3 = decodedMap["address3"];
      contactInfoScreenController.address3Controller.text =
          contactInfoScreenController.address3!;

      carrierObjectiveScreenController.careerObjectiveDescription =
          decodedMap["objective"];
      carrierObjectiveScreenController.descriptionController.text =
          carrierObjectiveScreenController.careerObjectiveDescription!;

      carrierObjectiveScreenController.careerObjectiveExperienced =
          decodedMap["designation"];
      carrierObjectiveScreenController.experiencedController.text =
          carrierObjectiveScreenController.careerObjectiveExperienced!;

      personalDetailsScreenController.dateOfBirth = decodedMap["dob"];
      personalDetailsScreenController.dateOfBirthController.text =
          personalDetailsScreenController.dateOfBirth!;
      personalDetailsScreenController.maritalStatus =
          decodedMap["maritalstatus"];
      personalDetailsScreenController.englishCheckBox = decodedMap["english"];
      personalDetailsScreenController.hindiCheckBox = decodedMap["hindi"];
      personalDetailsScreenController.gujratiCheckBox = decodedMap["gujarati"];
      personalDetailsScreenController.nationality = decodedMap["nationality"];
      personalDetailsScreenController.nationalityController.text =
          personalDetailsScreenController.nationality!;

      educationScreenController.course = decodedMap["course"];
      educationScreenController.courseController.text =
          educationScreenController.course!;

      educationScreenController.collage = decodedMap["college"];
      educationScreenController.collageController.text =
          educationScreenController.collage!;

      educationScreenController.marks = decodedMap["percentage"];
      educationScreenController.marksController.text =
          educationScreenController.marks!;

      educationScreenController.passYear = decodedMap["passyear"];
      educationScreenController.passYearController.text =
          educationScreenController.passYear!;

      expereinceScreenController.experienceCompanyName =
          decodedMap["companyname"];
      expereinceScreenController.companyNameController.text =
          expereinceScreenController.experienceCompanyName!;

      expereinceScreenController.experienceRole = decodedMap["role"];
      expereinceScreenController.roleController.text =
          expereinceScreenController.experienceRole!;

      expereinceScreenController.experienceEmployedStatus =
          decodedMap["status"];
      expereinceScreenController.experienceJoinDate = decodedMap["joindate"];
      expereinceScreenController.joinDateController.text =
          expereinceScreenController.experienceJoinDate!;
      expereinceScreenController.experienceExitDate = decodedMap["exitdate"];
      expereinceScreenController.exitDateController.text =
          expereinceScreenController.experienceExitDate!;

      technicalScreenController.technicalSkills = decodedMap["technicalskill"];
      update();
    }
  }
}
