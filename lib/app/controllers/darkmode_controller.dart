import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';

class DarkModeController extends GetxController {
  final _storage = GetStorage();
  final isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();

    // Load from storage, or fallback to system theme
    final stored = _storage.read('isDarkMode');
    log(stored.toString(), name: "storage-darkmode");
    if (stored is bool) {
      isDarkMode.value = stored;
    } else {
      isDarkMode.value = false;
    }
    // Persist whenever it changes
    ever<bool>(isDarkMode, (val) {
      _storage.write('isDarkMode', val);
    });
  }

  // Toggle theme
  void toggleDarkMode() async {
    isDarkMode.value = !isDarkMode.value;
    await _storage.write('isDarkMode', isDarkMode.value);
  }

  /// Get proper ThemeMode for GetMaterialApp
  ThemeMode get themeMode =>
      isDarkMode.value ? ThemeMode.dark : ThemeMode.light;
}
