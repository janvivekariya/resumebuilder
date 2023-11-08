import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TechnicalScreenController extends GetxController {
  List technicalSkills = [];

  List allTextFildList = [];
  List<TextEditingController> allControllers = [];
  int counter = 1;

  @override
  void onInit() {
    allControllers.add(TextEditingController());
    allControllers.add(TextEditingController());

    allTextFildList.add(getTextFild(i: 0, row: Row()));
    allTextFildList.add(getTextFild(i: 1, row: Row()));
    super.onInit();
  }

  Row getTextFild({required i, required Row row}) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: TextField(
            controller: allControllers[i],
            decoration: InputDecoration(
              hintText: "C Programming, Web Technical",
              hintStyle: TextStyle(
                color: Colors.grey.withOpacity(0.5),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            allControllers.removeAt(i);
            allTextFildList.remove(row);
            update();
          },
        ),
      ],
    );
  }

  forAddFeild() {
    allControllers.add(TextEditingController());
    allTextFildList.add(getTextFild(i: allTextFildList.length, row: Row()));
    update();
  }
}
