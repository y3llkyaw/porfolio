import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AdminProjectPageController extends GetxController {
  final isLoading = false.obs;
  final RxList<QueryDocumentSnapshot> projects = <QueryDocumentSnapshot>[].obs;

  @override
  void onInit() {
    fetchProjects();
    super.onInit();
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

  Future<void> addProject(
    String title,
    String url,
    String githubUrl,
    List<String> tags,
    String description,
  ) async {
    try {
      isLoading.value = true;
      await FirebaseFirestore.instance.collection('projects').add(
        {
          'title': title,
          'url': url,
          'githubUrl': githubUrl,
          'tags': tags,
          'description': description,
          'createdAt': FieldValue.serverTimestamp(),
        },
      );
      fetchProjects();
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateProject(
    String id,
    String title,
    String url,
    String githubUrl,
    List<String> tags,
    String description,
  ) async {
    try {
      isLoading.value = true;
      await FirebaseFirestore.instance.collection('projects').doc(id).update(
        {
          'title': title,
          'url': url,
          'githubUrl': githubUrl,
          'tags': tags,
          'description': description,
        },
      );
      fetchProjects();
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteProject(String id) async {
    try {
      isLoading.value = true;
      await FirebaseFirestore.instance.collection('projects').doc(id).delete();
      fetchProjects();
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
