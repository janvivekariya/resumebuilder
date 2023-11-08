import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:resumebuilder/Controller/CarrierObjectiveScreenController/CarrierObjectiveScreenController.dart';
import 'package:resumebuilder/Controller/ContactInfoScreenController/ContactInfoScreenController.dart';
import 'package:resumebuilder/Controller/EducationScreenController/EducationScreenController.dart';
import 'package:resumebuilder/Controller/ExpereinceScreenController/ExpereinceScreenController.dart';
import 'package:resumebuilder/Controller/PersonalDetailsScreenController/PersonalDetailsScreenController.dart';
import 'package:resumebuilder/Controller/TechnicalScreenController/TechnicalScreenController.dart';
import 'package:resumebuilder/Widget/backButton.dart';

class PDF_Screen extends StatefulWidget {
  PDF_Screen({Key? key}) : super(key: key);
  static const String RouteName = "/PDF_Screen";

  @override
  State<PDF_Screen> createState() => _PDF_ScreenState();
}

class _PDF_ScreenState extends State<PDF_Screen> {
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

  final pdf = pw.Document();

  Color MyColor = const Color(0xff0475FF);

  late final MemoryImage? image2;

  var titleStyle = const TextStyle(color: Colors.white, fontSize: 14);
  var titleStyle2 = TextStyle(
      color: Colors.blue.shade900, fontSize: 14, fontWeight: FontWeight.w600);
  var detailStyle = const TextStyle(color: Colors.grey, fontSize: 12);
  var detailStyle2 = TextStyle(color: Colors.grey.shade700, fontSize: 12);

  var titleStylePW = const pw.TextStyle(color: PdfColors.white, fontSize: 14);
  var titleStyle2PW = pw.TextStyle(
      color: PdfColors.blue900, fontSize: 14, fontWeight: pw.FontWeight.bold);
  var detailStylePW = const pw.TextStyle(color: PdfColors.grey, fontSize: 12);
  var detailStyle2PW =
      const pw.TextStyle(color: PdfColors.grey700, fontSize: 12);

  @override
  void initState() {
    super.initState();
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Row(
            children: [
              pw.Expanded(
                flex: 6,
                child: pw.Container(
                  padding: const pw.EdgeInsets.only(left: 10),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.SizedBox(height: 10),
                      educationPW(),
                      pw.Spacer(),
                      technicalSkillsPW(),
                      pw.Spacer(),
                      carrierObjectivePW(),
                      pw.Spacer(),
                      experiencePW(),
                      pw.Spacer(),
                    ],
                  ),
                ),
              ),
              pw.Expanded(
                flex: 4,
                child: pw.Column(
                  children: [
                    pw.Expanded(
                      child: pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                        children: [
                          (contactInfoScreenController.name != null)
                              ? pw.Text(
                                  "${contactInfoScreenController.name}",
                                  textAlign: pw.TextAlign.center,
                                  style: pw.TextStyle(
                                    fontSize: 17,
                                    color: PdfColors.blue900,
                                    fontWeight: pw.FontWeight.bold,
                                  ),
                                )
                              : pw.Container(),
                        ],
                      ),
                    ),
                    pw.Expanded(
                      flex: 3,
                      child: pw.Container(
                        width: double.infinity,
                        decoration: const pw.BoxDecoration(
                          color: PdfColors.blue900,
                          borderRadius: pw.BorderRadius.only(
                            topLeft: pw.Radius.circular(20),
                          ),
                        ),
                        padding: const pw.EdgeInsets.only(left: 10),
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.SizedBox(height: 10),
                            contactInFoPW(),
                            pw.Spacer(),
                            personalDetailsPW(),
                            pw.Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: backButton(context),
        title: const Text("PDF"),
        centerTitle: true,
        backgroundColor: MyColor,
        actions: [
          InkWell(
            onTap: () async {
              Directory? dir = await getExternalStorageDirectory();

              File file = File("${dir!.path}/my.pdf");

              await file.writeAsBytes(await pdf.save());

              // ignore: use_build_context_synchronously
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text("PDF Save Successfully..."),
                  behavior: SnackBarBehavior.floating,
                  action: SnackBarAction(
                      label: "Open",
                      onPressed: () async {
                        await OpenFile.open(file.path);
                      }),
                ),
              );
            },
            child: const SizedBox(
              width: 60,
              child: Icon(Icons.save_alt_outlined),
            ),
          ),
          InkWell(
            onTap: () async {
              Uint8List bytes = await pdf.save();

              await Printing.layoutPdf(onLayout: (format) => bytes);
            },
            child: const SizedBox(
              width: 60,
              child: Icon(Icons.print),
            ),
          ),
        ],
      ),
      body: Row(
        children: [
          Expanded(
            flex: 6,
            child: Container(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  education(),
                  const Spacer(),
                  technicalSkills(),
                  const Spacer(),
                  carrierObjective(),
                  const Spacer(),
                  experience(),
                  const Spacer(),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      (contactInfoScreenController.name != null)
                          ? Text(
                              "${contactInfoScreenController.name}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.blue.shade900,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade900,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                      ),
                    ),
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        contactInFo(),
                        const Spacer(),
                        personalDetails(),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget contactInFo() {
    if (contactInfoScreenController.email != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Contact info", style: titleStyle),
          const SizedBox(height: 3),
          Text(" - ${contactInfoScreenController.phone}", style: detailStyle),
          Text(" - ${contactInfoScreenController.email}", style: detailStyle),
          Text(" - ${contactInfoScreenController.address1}",
              style: detailStyle),
          (contactInfoScreenController.address2 != "")
              ? Text(" - ${contactInfoScreenController.address2}",
                  style: detailStyle)
              : Container(),
          (contactInfoScreenController.address3 != "")
              ? Text(" - ${contactInfoScreenController.address3}",
                  style: detailStyle)
              : Container(),
        ],
      );
    } else {
      return Container();
    }
  }

  Widget personalDetails() {
    if (personalDetailsScreenController.dateOfBirth != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Personal Details", style: titleStyle),
          const SizedBox(height: 3),
          Text("DOB : ${personalDetailsScreenController.dateOfBirth}",
              style: detailStyle),
          (personalDetailsScreenController.maritalStatus != null)
              ? Text(
                  "Marital Status : ${personalDetailsScreenController.maritalStatus}",
                  style: detailStyle)
              : Container(),
          Text("Nationality : ${personalDetailsScreenController.nationality}",
              style: detailStyle),
          const SizedBox(height: 10),
          Text("Language :", style: titleStyle),
          const SizedBox(height: 3),
          (personalDetailsScreenController.englishCheckBox == true)
              ? Text(" - English", style: detailStyle)
              : Container(),
          (personalDetailsScreenController.hindiCheckBox == true)
              ? Text(" - Hindi", style: detailStyle)
              : Container(),
          (personalDetailsScreenController.gujratiCheckBox == true)
              ? Text(" - Gujarati", style: detailStyle)
              : Container(),
        ],
      );
    } else {
      return Container();
    }
  }

  Widget education() {
    if (educationScreenController.course != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Education", style: titleStyle2),
          const SizedBox(height: 3),
          Text(" - ${educationScreenController.course}", style: detailStyle2),
          Text(" - ${educationScreenController.collage}", style: detailStyle2),
          Text(" - ${educationScreenController.marks}", style: detailStyle2),
          Text(" - ${educationScreenController.passYear}", style: detailStyle2),
        ],
      );
    } else {
      return Container();
    }
  }

  Widget technicalSkills() {
    if (technicalScreenController.technicalSkills.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Technical Skills", style: titleStyle2),
          const SizedBox(height: 3),
          ...technicalScreenController.technicalSkills.map(
            (e) => Text(" - $e", style: detailStyle2),
          )
        ],
      );
    } else {
      return Container();
    }
  }

  Widget experience() {
    if (expereinceScreenController.experienceCompanyName != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Experience", style: titleStyle2),
          const SizedBox(height: 3),
          Text(
              "Company Name : ${expereinceScreenController.experienceCompanyName}",
              style: detailStyle2),
          (expereinceScreenController.experienceRole != "")
              ? Text("Roles : ${expereinceScreenController.experienceRole}",
                  style: detailStyle2)
              : Container(),
          (expereinceScreenController.experienceJoinDate != null)
              ? Text(
                  "Join Date : ${expereinceScreenController.experienceJoinDate}",
                  style: detailStyle2)
              : Container(),
          (expereinceScreenController.experienceExitDate != null)
              ? Text(
                  "Exit Date : ${expereinceScreenController.experienceExitDate}",
                  style: detailStyle2)
              : Container(),
        ],
      );
    } else {
      return Container();
    }
  }

  Widget carrierObjective() {
    if (carrierObjectiveScreenController.careerObjectiveDescription != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Carrier Objective", style: titleStyle2),
          const SizedBox(height: 3),
          Text(" - ${carrierObjectiveScreenController.careerObjectiveDescription}", style: detailStyle2),
          const SizedBox(height: 3),
          Text("Designation : ${carrierObjectiveScreenController.careerObjectiveExperienced}", style: detailStyle2),
        ],
      );
    } else {
      return Container();
    }
  }


  contactInFoPW() {
    if (contactInfoScreenController.email != null) {
      return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text("Contact info", style: titleStylePW),
          pw.SizedBox(height: 3),
          pw.Text(" - ${contactInfoScreenController.phone}",
              style: detailStylePW),
          pw.Text(" - ${contactInfoScreenController.email}",
              style: detailStylePW),
          pw.Text(" - ${contactInfoScreenController.address1}",
              style: detailStylePW),
          (contactInfoScreenController.address2 != "")
              ? pw.Text(" - ${contactInfoScreenController.address2}",
                  style: detailStylePW)
              : pw.Container(),
          (contactInfoScreenController.address3 != "")
              ? pw.Text(" - ${contactInfoScreenController.address3}",
                  style: detailStylePW)
              : pw.Container(),
        ],
      );
    } else {
      return pw.Container();
    }
  }

  personalDetailsPW() {
    if (personalDetailsScreenController.dateOfBirth != null) {
      return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text("Personal Details", style: titleStylePW),
          pw.SizedBox(height: 3),
          pw.Text("DOB : ${personalDetailsScreenController.dateOfBirth}",
              style: detailStylePW),
          (personalDetailsScreenController.maritalStatus != null)
              ? pw.Text(
                  "Marital Status : ${personalDetailsScreenController.maritalStatus}",
                  style: detailStylePW)
              : pw.Container(),
          pw.Text(
              "Nationality : ${personalDetailsScreenController.nationality}",
              style: detailStylePW),
          pw.SizedBox(height: 10),
          pw.Text("Language :", style: titleStylePW),
          pw.SizedBox(height: 3),
          (personalDetailsScreenController.englishCheckBox == true)
              ? pw.Text(" - English", style: detailStylePW)
              : pw.Container(),
          (personalDetailsScreenController.hindiCheckBox == true)
              ? pw.Text(" - Hindi", style: detailStylePW)
              : pw.Container(),
          (personalDetailsScreenController.gujratiCheckBox == true)
              ? pw.Text(" - Gujarati", style: detailStylePW)
              : pw.Container(),
        ],
      );
    } else {
      return pw.Container();
    }
  }

  educationPW() {
    if (educationScreenController.course != null) {
      return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text("Education", style: titleStyle2PW),
          pw.SizedBox(height: 3),
          pw.Text(" - ${educationScreenController.course}",
              style: detailStyle2PW),
          pw.Text(" - ${educationScreenController.collage}",
              style: detailStyle2PW),
          pw.Text(" - ${educationScreenController.marks}",
              style: detailStyle2PW),
          pw.Text(" - ${educationScreenController.passYear}",
              style: detailStyle2PW),
        ],
      );
    } else {
      return pw.Container();
    }
  }

  technicalSkillsPW() {
    if (technicalScreenController.technicalSkills.isNotEmpty) {
      return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text("Technical Skills", style: titleStyle2PW),
          pw.SizedBox(height: 3),
          ...technicalScreenController.technicalSkills.map(
            (e) => pw.Text(" - $e", style: detailStyle2PW),
          )
        ],
      );
    } else {
      return pw.Container();
    }
  }

  carrierObjectivePW() {
    if (carrierObjectiveScreenController.careerObjectiveDescription != null) {
      return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text("Carrier Objective", style: titleStyle2PW),
          pw.SizedBox(height: 3),
          pw.Text(
              " - ${carrierObjectiveScreenController.careerObjectiveDescription}",
              style: detailStyle2PW),
          pw.SizedBox(height: 3),
          pw.Text(
              "Designation : ${carrierObjectiveScreenController.careerObjectiveExperienced}",
              style: detailStyle2PW),
        ],
      );
    } else {
      return pw.Container();
    }
  }

  experiencePW() {
    if (expereinceScreenController.experienceCompanyName != null) {
      return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text("Experience", style: titleStyle2PW),
          pw.SizedBox(height: 3),
          pw.Text(
              "Company Name : ${expereinceScreenController.experienceCompanyName}",
              style: detailStyle2PW),
          (expereinceScreenController.experienceRole != "")
              ? pw.Text("Roles : ${expereinceScreenController.experienceRole}",
                  style: detailStyle2PW)
              : pw.Container(),
          (expereinceScreenController.experienceJoinDate != null)
              ? pw.Text(
                  "Join Date : ${expereinceScreenController.experienceJoinDate}",
                  style: detailStyle2PW)
              : pw.Container(),
          (expereinceScreenController.experienceExitDate != null)
              ? pw.Text(
                  "Exit Date : ${expereinceScreenController.experienceExitDate}",
                  style: detailStyle2PW)
              : pw.Container(),
        ],
      );
    } else {
      return pw.Container();
    }
  }
}
