import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/app_colors.dart';
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                controller.icon,
                width: 130.w,
                height: 130.h,
              ).animate().scaleXY(
                  duration: const Duration(milliseconds: 2500),
                  curve: Curves.easeInOut),
              Text(
                'Daily To-Do App',
                style: GoogleFonts.sigmar(
                    fontSize: 22, fontWeight: FontWeight.w400),
              ).animate().scaleXY(
                  duration: const Duration(milliseconds: 2500),
                  curve: Curves.easeInOut),
            ],
          ),
        ),
      ),
    );
  }
}
