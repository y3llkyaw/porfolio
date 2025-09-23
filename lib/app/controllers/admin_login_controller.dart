import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AdminLoginController extends GetxController {
  var isLoading = false.obs;

  Future<void> adminLogin(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      log(FirebaseAuth.instance.currentUser.toString());
    } catch (e) {
      log('Unknown error: $e');
    }
  }

  Future<void> logout(String email, String password) async {
    try {
      await FirebaseAuth.instance.signOut().then((v) {
        Get.back();
      });
    } catch (e) {
      log('Unknown error: $e');
    }
  }
}
