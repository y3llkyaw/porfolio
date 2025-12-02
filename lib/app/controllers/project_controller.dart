import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ProjectController extends GetxController {
  final isLoading = false.obs;
  final RxList<QueryDocumentSnapshot> projects = <QueryDocumentSnapshot>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProjects();
  }

  void fetchProjects() async {
    try {
      isLoading.value = true;
      final snapshot = await FirebaseFirestore.instance
          .collection('projects')
          .orderBy('createdAt', descending: true)
          .get();
      projects.value = snapshot.docs;
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}