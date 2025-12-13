import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:porfolio_yhk/app/data/services/bio_service.dart';

class AdminBioController extends GetxController {
  final BioService _bioService = BioService();
  final TextEditingController bioController = TextEditingController();
  final Rx<String> bio = ''.obs;

  @override
  void onReady() {
    super.onReady();
    getBio();
  }

  Future<void> getBio() async {
    bio.value = await _bioService.getBio();
    bioController.text = bio.value;
  }

  Future<void> saveBio() async {
    await _bioService.updateBio(bioController.text).then((v) {
      Get.snackbar(
        "Bio Updating",
        "Successfully Updated Bio",
        snackPosition: SnackPosition.TOP,
      );
    });
    getBio();
  }

  @override
  void onClose() {
    bioController.dispose();
    super.onClose();
  }
}
