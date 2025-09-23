import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:porfolio_yhk/app/bindings/admin_binding.dart';
import 'package:porfolio_yhk/app/controllers/admin_login_controller.dart';
import 'package:porfolio_yhk/app/controllers/darkmode_controller.dart';
import 'package:porfolio_yhk/app/ui/global_widgets/navbar_widget.dart';

class AdminPage extends GetView<AdminBinding> {
  AdminPage({Key? key}) : super(key: key);
  final DarkModeController darkModeController = Get.find<DarkModeController>();
  final AdminLoginController adminLoginController =
      Get.put(AdminLoginController());
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
    return const Placeholder();
  }
}

class TabletLayout extends StatelessWidget {
  const TabletLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class WebLayout extends StatefulWidget {
  WebLayout({Key? key}) : super(key: key);

  @override
  State<WebLayout> createState() => _WebLayoutState();
}

class _WebLayoutState extends State<WebLayout> {
  final DarkModeController darkModeController = Get.find<DarkModeController>();

  final AdminLoginController adminLoginController =
      Get.find<AdminLoginController>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
        child: Column(
          children: [
            NavBarWidget(),
            Spacer(),
            SizedBox(
              width: Get.width * 0.3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 20,
                children: [
                  Row(
                    spacing: 10,
                    children: [
                      Text(
                        "Admin Login",
                        style: GoogleFonts.alata(
                          fontWeight: FontWeight.bold,
                          fontSize: Get.textTheme.titleLarge!.fontSize,
                        ),
                      ),
                      Icon(Icons.lock)
                    ],
                  ),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hint: Text("Username"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hint: Text("Password"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      print(emailController.text);
                      print(passwordController.text);

                      await adminLoginController.adminLogin(
                          emailController.text, passwordController.text);
                    },
                    child: Text("Login"),
                  )
                ],
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
