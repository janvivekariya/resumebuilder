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
    update();
  }

  forDeleteResume({int? index}) async {
    resumes!.removeAt(index!);
    await storageBox.write("resumes", resumes!);
    update();
  }
}
