import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:porfolio_yhk/app/controllers/admin_education_form_controller.dart';
import 'package:porfolio_yhk/app/data/models/education_model.dart';

class AdminEducationFormPage extends GetView<AdminEducationFormController> {
  final Education? education;

  AdminEducationFormPage({Key? key, this.education}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AdminEducationFormController(education: education));
    return Scaffold(
      appBar: AppBar(
        title: Text(education == null ? 'Add Education' : 'Edit Education'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: controller.schoolController,
                decoration: const InputDecoration(labelText: 'School'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: controller.degreeController,
                decoration: const InputDecoration(labelText: 'Degree'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: controller.fieldOfStudyController,
                decoration: const InputDecoration(labelText: 'Field of Study'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: controller.periodController,
                decoration: const InputDecoration(labelText: 'Period'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: controller.orderController,
                decoration: const InputDecoration(labelText: 'Order'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              Obx(
                () => CheckboxListTile(
                  title: const Text('Finished'),
                  value: controller.finished.value,
                  onChanged: (value) {
                    controller.finished.value = value ?? false;
                  },
                ),
              ),
              const SizedBox(height: 32),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    controller.saveEducation();
                  },
                  child: const Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
