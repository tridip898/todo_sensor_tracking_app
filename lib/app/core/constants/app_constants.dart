import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_sensor_tracking_app/app/core/widgets/app_widgets.dart';


const Transition transition = Transition.rightToLeft;
const transitionDuration = 300;

AppWidget appwidget = AppWidget();


const mainPadding = 20.0;
double mainPaddingW = 20.0.w;
double mainPaddingH = 20.0.h;
double borderRadius = 10.0;

const int loggerLineLength = 120;
const int loggerErrorMethodCount = 8;
const int loggerMethodCount = 2;

double buttonLRPadding = 16.0.w;
double dropdownToTitle = 12.0.h;
double titleToDropdown = 5.0.h;
double widgetHeight = 60.h;
double widgetToTitlePadding = 12.h;

EdgeInsetsGeometry mainPaddingAll =
EdgeInsets.symmetric(horizontal: mainPaddingW, vertical: mainPaddingH);

EdgeInsetsGeometry mainPaddingWidthOnly =
EdgeInsets.symmetric(horizontal: mainPaddingW);

EdgeInsetsGeometry mainPaddingHeightOnly =
EdgeInsets.symmetric(vertical: mainPaddingH);

var borderCircular = BorderRadius.circular(borderRadius);

EdgeInsetsGeometry mainPaddingSymmetric(double amount) {
  return EdgeInsets.symmetric(horizontal: amount.w, vertical: amount.h);
}


