import 'package:get/get.dart';
import 'package:resumebuilder/Screens/Carrier_Onjective_Screen/Carrier_Objective_Screen.dart';
import 'package:resumebuilder/Screens/Contact_Info_Screen/Contact_Info_Screen.dart';
import 'package:resumebuilder/Screens/Education_Screen/Education_Screen.dart';
import 'package:resumebuilder/Screens/Experience_Screen/Experience_Screen.dart';
import 'package:resumebuilder/Screens/Personal_Details_Screen/Personal_Detail_Screen.dart';
import 'package:resumebuilder/Screens/Technical_Skill_Screen/Technical_Skills_Screen.dart';

class OptionScreenController extends GetxController{

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


}