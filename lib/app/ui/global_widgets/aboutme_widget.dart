import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:porfolio_yhk/app/controllers/admin_bio_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMeWidget extends GetView<AdminBioController> {
  const AboutMeWidget({Key? key, this.width = double.infinity})
      : super(key: key);
  final double width;
  @override
  Widget build(BuildContext context) {
    Get.find<AdminBioController>();
    // Welcome
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome!",
            style: GoogleFonts.alata(
              fontWeight: FontWeight.bold,
              fontSize: Get.textTheme.titleLarge!.fontSize,
            ),
          ),
          Obx(
            () => controller.bio.value.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : Text(
                    controller.bio.value,
                    style: GoogleFonts.actor(
                      fontWeight: FontWeight.w400,
                      fontSize: Get.textTheme.bodyLarge!.fontSize,
                    ),
                    textAlign: TextAlign.justify,
                  ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Contacts -",
                style: GoogleFonts.actor(
                  fontWeight: FontWeight.w400,
                  fontSize: Get.textTheme.bodyLarge!.fontSize,
                ),
              ),
              IconButton(
                onPressed: () async {
                  final Uri emailLaunchUri = Uri(
                    scheme: 'mailto',
                    path: 'mgyehtetkyaw@gmail.com',
                  );
                  await launchUrl(emailLaunchUri);
                },
                icon: Icon(Icons.email),
              ),
              IconButton(
                onPressed: () async {
                  await launchUrl(
                      Uri.parse("https://www.linkedin.com/in/yellhtetkyaw"));
                },
                icon: Icon(BoxIcons.bxl_linkedin),
              ),
              IconButton(
                onPressed: () async {
                  try {
                    await launchUrl(
                      Uri.parse("https://www.github.com/y3llkyaw"),
                      mode: LaunchMode.externalApplication,
                    );
                  } catch (e) {
                    log(e.toString());
                  }
                },
                icon: Icon(BoxIcons.bxl_github),
              ),
            ],
          )
        ],
      ),
    );
  }
}

