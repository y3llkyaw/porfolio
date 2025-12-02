import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'project_tile.dart';

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
            title: "Meow Tarot",
            subtitle:
                "Fun Project that use nanabanana generated graphic to make tarot reading application with smooth and rich animation.",
            tag: "flutter",
            url: "https://meowtarot.vercel.app",
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
