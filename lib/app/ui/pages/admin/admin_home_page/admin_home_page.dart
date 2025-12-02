import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:porfolio_yhk/app/bindings/admin_binding.dart';
import 'package:porfolio_yhk/app/controllers/admin_home_page_controller.dart';
import 'package:porfolio_yhk/app/ui/pages/admin/admin_education/admin_education_page.dart';
import 'package:porfolio_yhk/app/ui/pages/admin/admin_project/admin_project_page.dart';
import 'package:porfolio_yhk/app/ui/pages/admin/admin_skills/admin_skill_page.dart';

class AdminHomePage extends GetView<AdminBinding> {
  const AdminHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 600) {
              // Mobile
              return WebLayout();
            } else if (constraints.maxWidth < 1024) {
              // Tablet
              return WebLayout();
            } else {
              // Web / Desktop
              return WebLayout();
            }
          },
        ),
      ),
    );
  }
}

class WebLayout extends StatelessWidget {
  WebLayout({Key? key}) : super(key: key);
  final AdminHomePageController controller =
      Get.find<AdminHomePageController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Home Page'),
      ),
      drawer: Drawer(
        child: Obx(
          () => ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              // DrawerHeader(
              //   decoration: BoxDecoration(
              //     color: Get.theme.primaryColor,
              //   ),
              //   child: Text(
              //     'Admin Menu',
              //     style: TextStyle(
              //       color: Colors.white,
              //       fontSize: 24,
              //     ),
              //   ),
              // ),
              ListTile(
                onTap: () {
                  controller.selectedIndex.value = 0;
                  Navigator.pop(context);
                },
                selected: controller.selectedIndex.value == 0,
                leading: Icon(Icons.work),
                title: Text('Projects'),
              ),
              ListTile(
                onTap: () {
                  controller.selectedIndex.value = 1;
                  Navigator.pop(context);
                },
                selected: controller.selectedIndex.value == 1,
                leading: Icon(Icons.school),
                title: Text('Educations'),
              ),
              ListTile(
                selected: controller.selectedIndex.value == 2,
                onTap: () {
                  controller.selectedIndex.value = 2;
                  Navigator.pop(context);
                },
                leading: Icon(Icons.code),
                title: Text('Skills'),
              ),
            ],
          ),
        ),
      ),
      body: Obx(
        () => Center(
          child: [
            AdminProjectPage(),
            AdminEducationPage(),
            AdminSkillPage(),
          ][controller.selectedIndex.value],
        ),
      ),
    );
  }
}
