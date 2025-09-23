import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:porfolio_yhk/app/controllers/darkmode_controller.dart';

class NavBarWidget extends StatelessWidget {
  NavBarWidget({Key? key}) : super(key: key);
  final DarkModeController darkModeController = Get.find<DarkModeController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Column(
              spacing: 10,
              children: [
                IconButton(
                  onPressed: () {
                    darkModeController.toggleDarkMode();
                  },
                  icon: Obx(
                    () => Icon(
                      darkModeController.isDarkMode.value
                          ? Icons.dark_mode
                          : Icons.sunny,
                    ),
                  ),
                ),
                Row(
                  spacing: 10,
                  children: [
                    Text(
                      "YellHtetKyaw",
                      style: GoogleFonts.actor(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    FirebaseAuth.instance.currentUser != null
                        ? Text(
                            "admin",
                            style: GoogleFonts.actor(
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                          )
                        : SizedBox.shrink(),
                  ],
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
