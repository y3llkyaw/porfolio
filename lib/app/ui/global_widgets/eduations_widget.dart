import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timelines_plus/timelines_plus.dart';

final List<Map<String, dynamic>> educations = [
  {
    "school": "Info Myanmar College",
    "degree": "Higher National Diploma, CS",
    "period": "Oct 2018 – July 2020",
    "finished": true,
  },
  {
    "school": "Covid-19",
    "degree": "Learning PHP and Laravel",
    "period": "Stay At Home",
    "finished": true,
  },
  {
    "school": "Edinburgh Napier University",
    "degree": "B.Sc in Computer Science",
    "period": "Oct 2022 – July 2023",
    "finished": true,
  },
  {
    "school": "Freelance",
    "degree": "Working as Flutter Developer",
    "period": "delivering the projects to fullfill client's needs",
    "finished": true,
  },
  {
    "school": "North Chiang Mai University",
    "degree": "AI & Data Science",
    "period": "April 2025 – going on",
    "finished": false,
  },
];

class EducationWidget extends StatelessWidget {
  const EducationWidget({Key? key, this.width = double.infinity})
      : super(key: key);
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Educations & Experiences",
            style: GoogleFonts.alata(
              fontWeight: FontWeight.bold,
              fontSize: Get.textTheme.titleLarge!.fontSize,
            ),
          ),
          FixedTimeline.tileBuilder(
            theme: TimelineThemeData(
              nodePosition: 0.01,
              color: Get.theme.colorScheme.primary,
            ),
            builder: TimelineTileBuilder.connectedFromStyle(
              lastConnectorStyle: ConnectorStyle.dashedLine,
              contentsAlign: ContentsAlign.basic,
              contentsBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      educations[index]["degree"].toString(),
                      style: GoogleFonts.actor(
                        fontSize: Get.textTheme.titleMedium!.fontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      educations[index]["school"].toString(),
                      style: GoogleFonts.actor(
                        fontSize: Get.textTheme.bodyLarge!.fontSize,
                      ),
                    ),
                    Text(
                      educations[index]["period"].toString(),
                      style: GoogleFonts.actor(
                        fontSize: Get.textTheme.bodyLarge!.fontSize,
                      ),
                    ),
                  ],
                ),
              ),
              connectorStyleBuilder: (context, index) => educations[index]
                      ['finished']
                  ? ConnectorStyle.solidLine
                  : ConnectorStyle.dashedLine,
              indicatorStyleBuilder: (context, index) => IndicatorStyle.dot,
              itemCount: educations.length,
            ),
          ),
        ],
      ),
    );
  }
}
