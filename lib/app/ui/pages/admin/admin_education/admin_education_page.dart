import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:porfolio_yhk/app/controllers/admin_education_controller.dart';
import 'package:porfolio_yhk/app/ui/pages/admin/admin_education/admin_education_form_page.dart';

class AdminEducationPage extends GetView<AdminEducationController> {
  const AdminEducationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          if (controller.educations.isEmpty) {
            return const Center(
              child: Text('No educations found.'),
            );
          }
          return ListView.builder(
            itemCount: controller.educations.length,
            itemBuilder: (context, index) {
              final education = controller.educations[index];
              return Card(
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(education.school),
                  subtitle: Text(
                      '${education.degree}\n${education.period}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          Get.to(() => AdminEducationFormPage(education: education));
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          Get.defaultDialog(
                            title: 'Delete Education',
                            middleText:
                                'Are you sure you want to delete this education?',
                            onConfirm: () {
                              controller.deleteEducation(education.id!);
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
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          Get.to(() => AdminEducationFormPage());
        },
        child: Icon(
          Icons.add,
          color: Get.theme.colorScheme.onPrimary,
        ),
      ),
    );
  }
}
