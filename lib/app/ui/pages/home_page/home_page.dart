import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:porfolio_yhk/app/controllers/darkmode_controller.dart';
import 'package:porfolio_yhk/app/ui/global_widgets/aboutme_widget.dart';
import 'package:porfolio_yhk/app/ui/global_widgets/eduations_widget.dart';
import 'package:porfolio_yhk/app/ui/global_widgets/navbar_widget.dart';
import 'package:porfolio_yhk/app/ui/global_widgets/project_widget.dart';
import '../../../controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);
  final darkModeController = Get.find<DarkModeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 600) {
              // Mobile
              return MobileLayout();
            } else if (constraints.maxWidth < 1024) {
              // Tablet
              return TabletLayout();
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

class MobileLayout extends StatelessWidget {
  const MobileLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NavBarWidget(),
              AboutMeWidget(),
              SizedBox(width: 30),
              EducationWidget(),
              SizedBox(width: 30),
              ProjectWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class TabletLayout extends StatelessWidget {
  const TabletLayout({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NavBarWidget(),
              AboutMeWidget(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProjectWidget(
                    width: Get.width * 0.4,
                  ),
                  EducationWidget(
                    width: Get.width * 0.4,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WebLayout extends StatelessWidget {
  const WebLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NavBarWidget(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    spacing: 20,
                    children: [
                      AboutMeWidget(
                        width: Get.width * 0.5,
                      ),
                      ProjectWidget(
                        width: Get.width * 0.5,
                      ),
                    ],
                  ),
                  EducationWidget(
                    width: Get.width * 0.2,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
