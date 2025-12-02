import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminButton extends StatelessWidget {
  const AdminButton({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue,
      ),
      width: Get.width / 10,
      height: Get.width / 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(icon, color: Colors.white, size: 40),
          Center(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: Get.textTheme.bodyMedium!.fontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
