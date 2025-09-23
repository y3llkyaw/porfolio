import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMeWidget extends StatelessWidget {
  const AboutMeWidget({Key? key, this.width = double.infinity})
      : super(key: key);
  final double width;
  @override
  Widget build(BuildContext context) {
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
          Text(
            "Hi there! I'm a Flutter developer with a passion for mobile development. I have experience working with Flutter and Dart, and I am passionate about creating beautiful, high-performance mobile applications. Alongside Flutter, I have expertise in Laravel, which allows me to build robust back-end systems. In my free time, I enjoy exploring front-end technologies like React.js and Next.js, continuously expanding my skill set and staying up-to-date with the latest trends. I'm passionate about learning and leveraging new technologies to deliver exceptional user experiences.",
            style: GoogleFonts.actor(
              fontWeight: FontWeight.w400,
              fontSize: Get.textTheme.bodyLarge!.fontSize,
            ),
            textAlign: TextAlign.justify,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 1,
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
