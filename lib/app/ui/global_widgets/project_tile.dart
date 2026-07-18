import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectTile extends StatelessWidget {
  const ProjectTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.url,
    required this.githubUrl,
    required this.tag,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String url;
  final String githubUrl;
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
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    launchUrl(Uri.parse(githubUrl));
                  },
                  icon: FaIcon(FontAwesomeIcons.github)),
            ],
          )
        ],
      ),
    );
  }
}
