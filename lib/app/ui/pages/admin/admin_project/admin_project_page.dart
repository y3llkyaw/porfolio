import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:porfolio_yhk/app/controllers/admin_project_page_controller.dart';
import 'package:porfolio_yhk/app/ui/global_widgets/project_tile.dart';

class AdminProjectPage extends StatelessWidget {
  AdminProjectPage({Key? key}) : super(key: key);
  final AdminProjectPageController controller =
      Get.put(AdminProjectPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          if (controller.isLoading.value && controller.projects.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          if (controller.projects.isEmpty) {
            return const Center(child: Text("No projects found. Add one!"));
          }
          return ListView.builder(
            itemCount: controller.projects.length,
            itemBuilder: (context, index) {
              final project = controller.projects[index];
              final data = project.data() as Map<String, dynamic>;
              final title = data['title'] ?? 'No Title';
              final description = data['description'] ?? 'No Description';
              final url = data['url'] ?? '';
              final tags = data['tags'] as List<dynamic>? ?? [];
              final firstTag = tags.isNotEmpty ? tags[0].toString() : '';

              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ProjectTile(
                          githubUrl: data['githubUrl'] ?? '',
                          title: title,
                          subtitle: description,
                          url: url,
                          tag: firstTag,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              final projectData =
                                  project.data() as Map<String, dynamic>;
                              final formKey = GlobalKey<FormState>();
                              final titleController = TextEditingController(
                                  text: projectData['title']);
                              final urlController = TextEditingController(
                                  text: projectData['url']);
                              final githubUrlController = TextEditingController(
                                  text: projectData['githubUrl']);
                              final tagsController = TextEditingController(
                                  text: (projectData['tags'] as List<dynamic>)
                                      .join(', '));
                              final descriptionController =
                                  TextEditingController(
                                      text: projectData['description']);

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
                                            decoration: InputDecoration(
                                                labelText: 'Title',
                                                hintText: 'Title'),
                                            validator: (value) => value!.isEmpty
                                                ? 'Enter a title'
                                                : null,
                                          ),
                                          SizedBox(height: 8),
                                          TextFormField(
                                            controller: urlController,
                                            decoration: InputDecoration(
                                                labelText: 'Project URL',
                                                hintText:
                                                    'https://example.com'),
                                            validator: (value) => value!.isEmpty
                                                ? 'Enter a URL'
                                                : null,
                                          ),
                                          SizedBox(height: 8),
                                          TextFormField(
                                            controller: githubUrlController,
                                            decoration: InputDecoration(
                                                labelText: 'GitHub URL',
                                                hintText:
                                                    'https://github.com/...'),
                                            validator: (value) => value!.isEmpty
                                                ? 'Enter a GitHub URL'
                                                : null,
                                          ),
                                          SizedBox(height: 8),
                                          TextFormField(
                                            controller: tagsController,
                                            decoration: InputDecoration(
                                                labelText: 'Tags',
                                                hintText:
                                                    'Tags (comma-separated)'),
                                            validator: (value) => value!.isEmpty
                                                ? 'Enter tags'
                                                : null,
                                          ),
                                          SizedBox(height: 8),
                                          TextFormField(
                                            controller: descriptionController,
                                            decoration: InputDecoration(
                                                labelText: 'Description',
                                                hintText: 'Description'),
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
                                        if (formKey.currentState!
                                            .validate()) {
                                          final updatedTags = tagsController
                                              .text
                                              .split(',')
                                              .map((s) => s.trim())
                                              .where((s) => s.isNotEmpty)
                                              .toList();
                                          controller.updateProject(
                                            project.id,
                                            titleController.text,
                                            urlController.text,
                                            githubUrlController.text,
                                            updatedTags,
                                            descriptionController.text,
                                          );
                                          Get.back();
                                        }
                                      },
                                      child: Text('Save'),
                                    ),
                                    TextButton(
                                      onPressed: () => Get.back(),
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
                                middleText:
                                    "Are you sure you want to delete this project?",
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
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          final formKey = GlobalKey<FormState>();
          final titleController = TextEditingController();
          final urlController = TextEditingController();
          final githubUrlController = TextEditingController();
          final tagsController = TextEditingController();
          final descriptionController = TextEditingController();
          Get.dialog(
            AlertDialog(
              title: Text('Add New Project'),
              content: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: titleController,
                        decoration: InputDecoration(
                            labelText: 'Title', hintText: 'Title'),
                        validator: (value) =>
                            value!.isEmpty ? 'Enter a title' : null,
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                        controller: urlController,
                        decoration: InputDecoration(
                            labelText: 'Project URL',
                            hintText: 'https://example.com'),
                        validator: (value) =>
                            value!.isEmpty ? 'Enter a URL' : null,
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                        controller: githubUrlController,
                        decoration: InputDecoration(
                            labelText: 'GitHub URL',
                            hintText: 'https://github.com/...'),
                        validator: (value) =>
                            value!.isEmpty ? 'Enter a GitHub URL' : null,
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                        controller: tagsController,
                        decoration: InputDecoration(
                            labelText: 'Tags',
                            hintText: 'Tags (comma-separated)'),
                        validator: (value) =>
                            value!.isEmpty ? 'Enter tags' : null,
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                        controller: descriptionController,
                        decoration: InputDecoration(
                            labelText: 'Description', hintText: 'Description'),
                        maxLines: 5,
                        validator: (value) =>
                            value!.isEmpty ? 'Enter a description' : null,
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
                      controller.addProject(
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
        child: Icon(
          CupertinoIcons.plus,
          color: Get.theme.colorScheme.onPrimary,
        ),
      ),
    );
  }
}
