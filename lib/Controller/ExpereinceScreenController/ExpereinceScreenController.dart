import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ExpereinceScreenController extends GetxController{
  String? experienceCompanyName;
  String? experienceRole;
  String? experienceEmployedStatus;
  String? experienceJoinDate;
  String? experienceExitDate;

  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController roleController = TextEditingController();
  final TextEditingController joinDateController = TextEditingController();
  final TextEditingController exitDateController = TextEditingController();

  forCompany({String? value}){

  }

  forRole({String? value}){

  }

  forStatus({String? value}){

  }

  forJoinDate({BuildContext? context}) async {
    DateTime dateTime = DateTime.now();
    dateTime = (await showDatePicker(
    context: context!,
    initialDate: DateTime.now(),
    firstDate: DateTime(2015, 8),
    lastDate: DateTime(2101)))!;
    experienceJoinDate = DateFormat('dd-MM-yyyy').format(dateTime);
    joinDateController.text = experienceJoinDate!;
    update();
  }

  forExitDate({BuildContext? context}) async {
    DateTime dateTime = DateTime.now();
    dateTime = (await showDatePicker(
    context: context!,
    initialDate: DateTime.now(),
    firstDate: DateTime(2015, 8),
    lastDate: DateTime(2101)))!;
    experienceExitDate = DateFormat('dd-MM-yyyy').format(dateTime);
    exitDateController.text = experienceExitDate!;
    update();
  }


}