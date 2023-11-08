import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ContactInfoScreenController extends GetxController {
  String? name;
  String? email;
  String? phone;
  String? address1;
  String? address2;
  String? address3;

  File? image;

  final ImagePicker picker = ImagePicker();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController address1Controller = TextEditingController();
  final TextEditingController address2Controller = TextEditingController();
  final TextEditingController address3Controller = TextEditingController();

  forName({String? value}) {
    name = value;
    update();
  }

  forEmail({String? value}) {
    email = value;
    update();
  }

  forPhone({String? value}) {
    phone = value;
    update();
  }

  forAddress1({String? value}) {
    address1 = value;
    update();
  }

  forAddress2({String? value}) {
    address2 = value;
    update();
  }

  forAddress3({String? value}) {
    address3 = value;
    update();
  }

  forImageFromGallery({BuildContext? context}) async {
    XFile? pickerFile = await picker.pickImage(source: ImageSource.gallery);
    image = File(pickerFile!.path);
    update();
  }

  forImageFromCamera({BuildContext? context}) async {
    XFile? pickerFile = await picker.pickImage(source: ImageSource.camera);
    image = File(pickerFile!.path);
    update();
  }
}
