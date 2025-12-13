
import 'package:get/get.dart';
import 'package:porfolio_yhk/app/controllers/admin_bio_controller.dart';
import '../controllers/home_controller.dart';


class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<AdminBioController>(() => AdminBioController());
        // Get.put<HomeController>(HomeController());
  }
}