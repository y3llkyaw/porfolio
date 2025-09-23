import 'package:get/get.dart';
import 'package:porfolio_yhk/app/controllers/admin_controller.dart';

class AdminBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminController>(() => AdminController());
  }
}
