
import 'package:get/get.dart';
import 'package:porfolio_yhk/app/data/models/education_model.dart';
import 'package:porfolio_yhk/app/data/services/education_service.dart';

class HomeController extends GetxController {
  final EducationService _educationService = EducationService();
  final educations = <Education>[].obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchEducations();
  }

  void fetchEducations() async {
    try {
      isLoading.value = true;
      final result = await _educationService.getEducations();
      educations.assignAll(result);
    } finally {
      isLoading.value = false;
    }
  }
}