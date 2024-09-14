import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:todo_sensor_tracking_app/app/core/constants/app_colors.dart';
import 'package:todo_sensor_tracking_app/app/core/constants/app_text_style.dart';

import 'todo_splash_controller.dart';

class TodoSplashView extends GetView<TodoSplashController> {
  const TodoSplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Image.asset(
                controller.icon,
                fit: BoxFit.fill,
              ),
              Text(
                "Daily To-Do App",
                style: text20Style(fontSize: 40, fontWeight: FontWeight.w900),
              )
            ],
          ).animate().scaleXY(
                begin: 0,
                end: .6,
                duration: const Duration(milliseconds: 3000),
              ),
        ),
      ),
    );
  }
}
