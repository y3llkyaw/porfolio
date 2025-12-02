import 'package:get/get.dart';
import 'package:porfolio_yhk/app/controllers/admin_home_page_controller.dart';

class AdminHomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminHomePageController>(() => AdminHomePageController());
  }
}
