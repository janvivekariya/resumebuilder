import 'package:get/get.dart';
import 'package:resumebuilder/main.dart';

class HomeScreenController extends GetxController {
  List? resumes;

  @override
  void onInit() {
    forGetResumes();
    super.onInit();
  }

  forGetResumes() {
    resumes = storageBox.read("resumes") ?? [];
    print("Resumes at Init:${resumes}");
  }

}
