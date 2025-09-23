import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:porfolio_yhk/firebase_options.dart';

import '../../controllers/navigation_controller.dart';
import '../../controllers/main_controller.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DependecyInjection {
  static Future<void> init() async {
    await GetStorage.init().then((v) {
      log("storage init ", name: "getstorage");
    });

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    Get.put<NavigationController>(NavigationController());
    Get.put<MainController>(MainController());
  }
}
