import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_sensor_tracking_app/app/core/widgets/app_widgets.dart';
import 'package:todo_sensor_tracking_app/app/core/constants/app_colors.dart';


const Transition transition = Transition.rightToLeft;
const transitionDuration = 300;

AppWidget appwidget = AppWidget();
AppColors appColors = AppColors();

final Widget gapW3 = appwidget.gapW(3);
final Widget gapW6 = appwidget.gapW(6);
final Widget gapW8 = appwidget.gapW(8);
final Widget gapW12 = appwidget.gapW(12);
final Widget gapW16 = appwidget.gapW(16);
final Widget gapW18 = appwidget.gapW(18);
final Widget gapW20 = appwidget.gapW(20);
final Widget gapW24 = appwidget.gapW(24);
final Widget gapW30 = appwidget.gapW(30);
final Widget gapW34 = appwidget.gapW(34);

final Widget gapH3 = appwidget.gapH(3);
final Widget gapH6 = appwidget.gapH(6);
final Widget gapH8 = appwidget.gapH(8);
final Widget gapH12 = appwidget.gapH(12);
final Widget gapH16 = appwidget.gapH(16);
final Widget gapH18 = appwidget.gapH(18);
final Widget gapH20 = appwidget.gapH(20);
final Widget gapH24 = appwidget.gapH(24);
final Widget gapH30 = appwidget.gapH(30);
final Widget gapH32 = appwidget.gapH(32);
final Widget gapH48 = appwidget.gapH(48);

EdgeInsetsGeometry mainPaddings(double leftRight,
    double topBottom, {
      double? leftPadding,
      double? rightPadding,
      double? topPadding,
      double? bottomPadding,
    }) {
  return EdgeInsets.only(
    left: (leftPadding ?? leftRight).w,
    right: (rightPadding ?? leftRight).w,
    top: (topPadding ?? topBottom).h,
    bottom: (bottomPadding ?? topBottom).h,
  );
}


BorderRadius borderCircular(double amount) {
  return BorderRadius.circular(amount);
}

EdgeInsetsGeometry mainPadding(double horizontal, double vertical) {
  return EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);
}


