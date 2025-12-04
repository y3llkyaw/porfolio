import 'package:get/get.dart';
import 'package:porfolio_yhk/app/controllers/admin_education_controller.dart';

class AdminEducationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminEducationController>(() => AdminEducationController());
  }
}
