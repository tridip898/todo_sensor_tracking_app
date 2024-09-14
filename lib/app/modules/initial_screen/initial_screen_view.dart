import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_sensor_tracking_app/app/core/constants/app_constants.dart';
import 'package:todo_sensor_tracking_app/app/core/constants/app_text_style.dart';
import 'package:todo_sensor_tracking_app/app/routes/app_pages.dart';

import '../../core/constants/app_colors.dart';
import 'initial_screen_controller.dart';

class InitialScreenView extends GetView<InitialScreenController> {
  const InitialScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: mainPadding(20, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                appTaskButtonDesign(
                  "A To Do List",
                  AppColors.primaryColor,
                  AppColors.black,
                  () {
                    Get.toNamed(Routes.TODO_SPLASH);
                  },
                ),
                gapH16,
                appTaskButtonDesign(
                  "Sensor Tracking",
                  AppColors.deepBlue,
                  AppColors.white,
                  () {
                    Get.toNamed(Routes.SENSOR_TRACKING_GRAPH);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  appTaskButtonDesign(
      String title, Color? color, Color textColor, Function()? onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: borderCircular(16),
      child: Ink(
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderCircular(16),
        ),
        padding: mainPadding(16, 24),
        child: Center(
          child: Text(
            title,
            style: text18Style(isWeight400: true, color: textColor),
          ),
        ),
      ),
    );
  }
}
