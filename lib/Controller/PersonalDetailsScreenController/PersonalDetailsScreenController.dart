import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PersonalDetailsScreenController extends GetxController {
  String? dateOfBirth;
  String? maritalStatus;
  bool englishCheckBox = false;
  bool hindiCheckBox = false;
  bool gujratiCheckBox = false;
  String? nationality;

  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController nationalityController = TextEditingController();

  forDateofBirth({BuildContext? context}) async {
    DateTime dateTime = DateTime.now();
    dateTime = (await showDatePicker(
        context: context!,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101)))!;
    dateOfBirth = DateFormat('dd-MM-yyyy').format(dateTime);
    dateOfBirthController.text = dateOfBirth!;
    update();
  }

  forMaritalStatus({String? value}) {
    maritalStatus = value;
    update();
  }

  forEnglishLan({bool? value}) {
    englishCheckBox = value!;
    update();
  }

  forHindiLan({bool? value}) {
    hindiCheckBox = value!;
    update();
  }

  forGujaratiLan({bool? value}) {
    gujratiCheckBox = value!;
    update();
  }

  forNationality({String? value}) {
    nationality = value!;
    update();
  }
}
