import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarrierObjectiveScreenController extends GetxController{

  String? careerObjectiveDescription;
  String? careerObjectiveExperienced;

  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController experiencedController = TextEditingController();

  forCarrierObjective({String? value}){
    careerObjectiveDescription = value;
    update();
  }

  forCarrierExperience({String? value}){
    careerObjectiveExperienced = value;
    update();
  }
}