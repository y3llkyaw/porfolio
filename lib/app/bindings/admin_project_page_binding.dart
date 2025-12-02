import 'package:get/get.dart';
import 'package:porfolio_yhk/app/controllers/admin_project_page_controller.dart';

class AdminProjectPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminProjectPageController>(() => AdminProjectPageController());
  }
}
