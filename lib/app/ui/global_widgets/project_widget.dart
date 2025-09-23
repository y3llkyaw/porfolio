import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectWidget extends StatelessWidget {
  const ProjectWidget({Key? key, this.width = double.infinity})
      : super(key: key);
  final double width;

  @override
  Widget build(BuildContext context) {
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
          ProjectTile(
            title: "Mood Mate",
            subtitle:
                "A Flutter app that helps users track moods, analyze emotional trends, and connect with others through a smart matching algorithm and real-time chat.",
            tag: "flutter",
            url: "https://github.com/y3llkyaw/emotional-tracker",
          ),
          ProjectTile(
            title: "Electricity Bill Management",
            subtitle: """
Utilizing HTML, CSS, JavaScript, PHP, and a MySQL database, this project aims to facilitate online electricity bill payments through a dedicated website, providing convenience to users.

""",
            tag: "PHP",
            url: "https://github.com/y3llkyaw/electricity-bill-management",
          ),
        ],
      ),
    );
  }
}

class ProjectTile extends StatelessWidget {
  const ProjectTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.url,
    required this.tag,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String url;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, top: 10),
      child: Column(
        children: [
          Row(
            spacing: 10,
            children: [
              InkWell(
                onTap: () async {
                  await launchUrl(Uri.parse(url));
                },
                child: Text(
                  title,
                  style: GoogleFonts.actor(
                    fontSize: Get.textTheme.bodyLarge!.fontSize,
                    decoration: TextDecoration.underline,
                    color: Get.theme.colorScheme.primary,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Text("#$tag", style: GoogleFonts.actor()),
              )
            ],
          ),
          Text(
            subtitle,
            textAlign: TextAlign.justify,
            style: GoogleFonts.actor(
              fontWeight: FontWeight.w400,
              fontSize: Get.textTheme.bodyLarge!.fontSize,
            ),
          ),
        ],
      ),
    );
  }
}
