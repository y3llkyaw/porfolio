import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:porfolio_yhk/app/controllers/admin_project_page_controller.dart';

class ProjectWidget extends StatelessWidget {
  const ProjectWidget({
    Key? key,
    required this.project,
    required this.controller,
  }) : super(key: key);

  final QueryDocumentSnapshot project;
  final AdminProjectPageController controller;

  @override
  Widget build(BuildContext context) {
    final data = project.data() as Map<String, dynamic>;
    final title = data['title'] ?? 'No Title';
    final description = data['description'] ?? 'No Description';

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text(title),
        subtitle: Text(description),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                final projectData = project.data() as Map<String, dynamic>;
                final formKey = GlobalKey<FormState>();
                final titleController =
                    TextEditingController(text: projectData['title']);
                final urlController =
                    TextEditingController(text: projectData['url']);
                final githubUrlController =
                    TextEditingController(text: projectData['githubUrl']);
                final tagsController = TextEditingController(
                    text: (projectData['tags'] as List<dynamic>).join(', '));
                final descriptionController =
                    TextEditingController(text: projectData['description']);
        
                Get.dialog(
                  AlertDialog(
                    title: Text('Edit Project'),
                    content: Form(
                      key: formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFormField(
                              controller: titleController,
                              decoration: InputDecoration(hintText: 'Title'),
                              validator: (value) =>
                                  value!.isEmpty ? 'Enter a title' : null,
                            ),
                            SizedBox(height: 8),
                            TextFormField(
                              controller: urlController,
                              decoration: InputDecoration(
                                  hintText: 'https://example.com'),
                              validator: (value) =>
                                  value!.isEmpty ? 'Enter a URL' : null,
                            ),
                            SizedBox(height: 8),
                            TextFormField(
                              controller: githubUrlController,
                              decoration: InputDecoration(
                                  hintText: 'https://github.com/...'),
                              validator: (value) => value!.isEmpty
                                  ? 'Enter a GitHub URL'
                                  : null,
                            ),
                            SizedBox(height: 8),
                            TextFormField(
                              controller: tagsController,
                              decoration: InputDecoration(
                                  hintText: 'Tags (comma-separated)'),
                              validator: (value) =>
                                  value!.isEmpty ? 'Enter tags' : null,
                            ),
                            SizedBox(height: 8),
                            TextFormField(
                              controller: descriptionController,
                              decoration:
                                  InputDecoration(hintText: 'Description'),
                              maxLines: 5,
                              validator: (value) => value!.isEmpty
                                  ? 'Enter a description'
                                  : null,
                            ),
                          ],
                        ),
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            final tags = tagsController.text
                                .split(',')
                                .map((s) => s.trim())
                                .where((s) => s.isNotEmpty)
                                .toList();
                            controller.updateProject(
                              project.id,
                              titleController.text,
                              urlController.text,
                              githubUrlController.text,
                              tags,
                              descriptionController.text,
                            );
                            Get.back();
                          }
                        },
                        child: Text('Save'),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text('Close'),
                      ),
                    ],
                  ),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                Get.defaultDialog(
                  title: "Delete Project",
                  middleText: "Are you sure you want to delete this project?",
                  onConfirm: () {
                    controller.deleteProject(project.id);
                    Get.back();
                  },
                  onCancel: () {},
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
