import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:porfolio_yhk/app/controllers/project_controller.dart';

import 'project_tile.dart';

class ProjectWidget extends StatelessWidget {
  const ProjectWidget({Key? key, this.width = double.infinity})
      : super(key: key);
  final double width;

  @override
  Widget build(BuildContext context) {
    final ProjectController controller = Get.put(ProjectController());

    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Projects",
            style: GoogleFonts.alata(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          Obx(() {
            if (controller.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            }
            if (controller.projects.isEmpty) {
              return Center(child: Text("No projects found."));
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: controller.projects.map((project) {
                final data = project.data() as Map<String, dynamic>;
                final title = data['title'] ?? 'No Title';
                final description = data['description'] ?? 'No Description';
                final url = data['url'] ?? '';
                final tags = data['tags'] as List<dynamic>? ?? [];
                final firstTag = tags.isNotEmpty ? tags[0].toString() : '';
                return ProjectTile(
                  title: title,
                  subtitle: description,
                  url: url,
                  tag: firstTag,
                );
              }).toList(),
            );
          }),
        ],
      ),
    );
  }
}
