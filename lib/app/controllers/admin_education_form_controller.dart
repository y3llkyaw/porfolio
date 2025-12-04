import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:porfolio_yhk/app/data/models/education_model.dart';
import 'package:porfolio_yhk/app/controllers/admin_education_controller.dart';

class AdminEducationFormController extends GetxController {
  final AdminEducationController _adminEducationController = Get.find();
  final Education? education;

  AdminEducationFormController({this.education});

  late TextEditingController schoolController;
  late TextEditingController degreeController;
  late TextEditingController fieldOfStudyController;
  late TextEditingController periodController;
  late TextEditingController orderController;
  late RxBool finished;

  @override
  void onInit() {
    super.onInit();
    schoolController = TextEditingController(text: education?.school);
    degreeController = TextEditingController(text: education?.degree);
    fieldOfStudyController = TextEditingController(text: education?.fieldOfStudy);
    periodController = TextEditingController(text: education?.period);
    orderController = TextEditingController(text: education?.order.toString());
    finished = (education?.finished ?? false).obs;
  }

  Future<void> saveEducation() async {
    final newEducation = Education(
      id: education?.id,
      school: schoolController.text,
      degree: degreeController.text,
      fieldOfStudy: fieldOfStudyController.text,
      period: periodController.text,
      order: int.tryParse(orderController.text) ?? 0,
      finished: finished.value,
    );

    if (education == null) {
      await _adminEducationController.addEducation(newEducation);
    } else {
      await _adminEducationController.updateEducation(newEducation);
    }
    Get.back();
  }
}
