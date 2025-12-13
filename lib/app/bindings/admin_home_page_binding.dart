import 'package:get/get.dart';
import 'package:porfolio_yhk/app/controllers/admin_bio_controller.dart';
import 'package:porfolio_yhk/app/controllers/admin_education_controller.dart';
import 'package:porfolio_yhk/app/controllers/admin_home_page_controller.dart';
import 'package:porfolio_yhk/app/controllers/admin_project_page_controller.dart';

class AdminHomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminHomePageController>(() => AdminHomePageController());
    Get.lazyPut<AdminProjectPageController>(() => AdminProjectPageController());
    Get.lazyPut<AdminEducationController>(() => AdminEducationController());
    Get.lazyPut<AdminBioController>(() => AdminBioController());
  }
}

