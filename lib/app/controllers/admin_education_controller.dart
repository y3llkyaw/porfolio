import 'package:get/get.dart';
import 'package:porfolio_yhk/app/data/models/education_model.dart';
import 'package:porfolio_yhk/app/data/services/education_service.dart';

class AdminEducationController extends GetxController {
  final EducationService _educationService = EducationService();
  final educations = <Education>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchEducations();
  }

  Future<void> fetchEducations() async {
    try {
      educations.value = await _educationService.getEducations();
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch educations');
    }
  }

  Future<void> addEducation(Education education) async {
    try {
      await _educationService.addEducation(education);
      fetchEducations();
    } catch (e) {
      Get.snackbar('Error', 'Failed to add education');
    }
  }

  Future<void> updateEducation(Education education) async {
    try {
      await _educationService.updateEducation(education);
      fetchEducations();
    } catch (e) {
      Get.snackbar('Error', 'Failed to update education');
    }
  }

  Future<void> deleteEducation(String id) async {
    try {
      await _educationService.deleteEducation(id);
      fetchEducations();
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete education');
    }
  }
}