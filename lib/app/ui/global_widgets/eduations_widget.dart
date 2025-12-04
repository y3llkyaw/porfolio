import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:porfolio_yhk/app/controllers/home_controller.dart';
import 'package:timelines_plus/timelines_plus.dart';

class EducationWidget extends GetView<HomeController> {
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
          Obx(
            () => controller.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : FixedTimeline.tileBuilder(
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
                              controller.educations[index].degree,
                              style: GoogleFonts.actor(
                                fontSize: Get.textTheme.titleMedium!.fontSize,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              controller.educations[index].school,
                              style: GoogleFonts.actor(
                                fontSize: Get.textTheme.bodyLarge!.fontSize,
                              ),
                            ),
                            Text(
                              controller.educations[index].period,
                              style: GoogleFonts.actor(
                                fontSize: Get.textTheme.bodyLarge!.fontSize,
                              ),
                            ),
                          ],
                        ),
                      ),
                      connectorStyleBuilder: (context, index) =>
                          controller.educations[index].finished
                              ? ConnectorStyle.solidLine
                              : ConnectorStyle.dashedLine,
                      indicatorStyleBuilder: (context, index) =>
                          IndicatorStyle.dot,
                      itemCount: controller.educations.length,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
