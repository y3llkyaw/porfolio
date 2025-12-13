import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:porfolio_yhk/app/controllers/admin_bio_controller.dart';

class AdminBioPage extends GetView<AdminBioController> {
  const AdminBioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<AdminBioController>();
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextField(
            controller: controller.bioController,
            decoration: InputDecoration(
              labelText: 'Bio',
              border: OutlineInputBorder(),
            ),
            maxLines: 10,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              controller.saveBio();
            },
            child: Text('Save Bio'),
          ),
        ],
      ),
    );
  }
}
