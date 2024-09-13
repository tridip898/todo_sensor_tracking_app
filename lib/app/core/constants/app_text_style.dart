import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_sensor_tracking_app/app/core/constants/app_constants.dart';
import 'package:todo_sensor_tracking_app/app/core/constants/app_colors.dart';

final myFont = GoogleFonts.poppins;
final needSP = true;

final hintStyle = myFont(
  fontSize: needSP ? 14.sp : 14.0,
  color: AppColors.inputColor,
  fontWeight: FontWeight.w400,
);

TextStyle textStyle({
  Color color = AppColors.black,
  required double fontSize,
  FontWeight fontWeight = FontWeight.w400,
  bool isWhiteColor = false,
  bool isPrimaryColor = false,
  double? letterSpacing,
  double? lineHeight,
  bool isWeight300 = false,
  bool isWeight400 = false,
  bool isWeight500 = false,
  bool isWeight600 = false,
  bool isWeight700 = false,
  bool isWeight800 = false,
  bool isAnekBangla = false,
  bool isPalanquin = false,
  bool isRoboto = false,
  bool isNotoSans = false,
  bool needShadow = false,
}) {
  return (isNotoSans
      ? GoogleFonts.notoSansBengali
      : isAnekBangla
      ? GoogleFonts.anekBangla
      : isPalanquin
      ? GoogleFonts.palanquinDark
      : isRoboto
      ? GoogleFonts.roboto
      : myFont)(
    fontSize: needSP ? fontSize.sp : fontSize,
    letterSpacing: letterSpacing,
    color: isPrimaryColor
        ? AppColors.primaryColor
        : isWhiteColor
        ? AppColors.white
        : color,
    fontWeight: isWeight300
        ? FontWeight.w300
        : isWeight400
        ? FontWeight.w400
        : isWeight500
        ? FontWeight.w500
        : isWeight600
        ? FontWeight.w600
        : isWeight700
        ? FontWeight.w700
        : isWeight800
        ? FontWeight.w800
        : fontWeight,
    height: lineHeight,
    shadows: needShadow
        ? [
      const Shadow(
        color: Colors.grey,
        offset: Offset(0, 0),
        blurRadius: 15,
      ),
    ]
        : null,
  );
}

TextStyle text12Style({
  Color color = AppColors.black,
  double fontSize = 12,
  FontWeight fontWeight = FontWeight.w400,
  bool isWhiteColor = false,
  bool isPrimaryColor = false,
  double? letterSpacing,
  double? lineHeight,
  bool isWeight300 = false,
  bool isWeight400 = false,
  bool isWeight500 = false,
  bool isWeight600 = false,
  bool isWeight700 = false,
  bool isWeight800 = false,
  bool isAnekBangla = false,
  bool isPalanquin = false,
  bool isNotoSans = false,
  bool needShadow = false,
}) {
  return textStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
    isWhiteColor: isWhiteColor,
    isPrimaryColor: isPrimaryColor,
    letterSpacing: letterSpacing,
    lineHeight: lineHeight,
    isWeight300: isWeight300,
    isWeight400: isWeight400,
    isWeight500: isWeight500,
    isWeight600: isWeight600,
    isWeight700: isWeight700,
    isWeight800: isWeight800,
    isAnekBangla: isAnekBangla,
    isPalanquin: isPalanquin,
    isNotoSans: isNotoSans,
    needShadow: needShadow,
  );
}

TextStyle text14Style({
  Color color = AppColors.black,
  double fontSize = 14,
  FontWeight fontWeight = FontWeight.w400,
  bool isWhiteColor = false,
  bool isPrimaryColor = false,
  double? letterSpacing,
  double? lineHeight,
  bool isWeight300 = false,
  bool isWeight400 = false,
  bool isWeight500 = false,
  bool isWeight600 = false,
  bool isWeight700 = false,
  bool isWeight800 = false,
  bool isAnekBangla = false,
  bool isPalanquin = false,
  bool isNotoSans = false,
  bool needShadow = false,
}) {
  return textStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
    isWhiteColor: isWhiteColor,
    isPrimaryColor: isPrimaryColor,
    letterSpacing: letterSpacing,
    lineHeight: lineHeight,
    isWeight300: isWeight300,
    isWeight400: isWeight400,
    isWeight500: isWeight500,
    isWeight600: isWeight600,
    isWeight700: isWeight700,
    isWeight800: isWeight800,
    isAnekBangla: isAnekBangla,
    isPalanquin: isPalanquin,
    isNotoSans: isNotoSans,
    needShadow: needShadow,
  );
}

TextStyle text16Style({
  Color color = AppColors.black,
  double fontSize = 16,
  FontWeight fontWeight = FontWeight.w500,
  bool isWhiteColor = false,
  bool isPrimaryColor = false,
  double? letterSpacing,
  double? lineHeight,
  bool isWeight300 = false,
  bool isWeight400 = false,
  bool isWeight500 = false,
  bool isWeight600 = false,
  bool isWeight700 = false,
  bool isWeight800 = false,
  bool isAnekBangla = false,
  bool isPalanquin = false,
  bool isNotoSans = false,
  bool needShadow = false,
}) {
  return textStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
    isWhiteColor: isWhiteColor,
    isPrimaryColor: isPrimaryColor,
    letterSpacing: letterSpacing,
    lineHeight: lineHeight,
    isWeight300: isWeight300,
    isWeight400: isWeight400,
    isWeight500: isWeight500,
    isWeight600: isWeight600,
    isWeight700: isWeight700,
    isWeight800: isWeight800,
    isAnekBangla: isAnekBangla,
    isPalanquin: isPalanquin,
    isNotoSans: isNotoSans,
    needShadow: needShadow,
  );
}

TextStyle text18Style({
  Color color = AppColors.black,
  double fontSize = 18,
  FontWeight fontWeight = FontWeight.w600,
  bool isWhiteColor = false,
  bool isPrimaryColor = false,
  double? letterSpacing,
  double? lineHeight,
  bool isWeight300 = false,
  bool isWeight400 = false,
  bool isWeight500 = false,
  bool isWeight600 = false,
  bool isWeight700 = false,
  bool isWeight800 = false,
  bool isAnekBangla = false,
  bool isPalanquin = false,
  bool isNotoSans = false,
  bool needShadow = false,
}) {
  return textStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
    isWhiteColor: isWhiteColor,
    isPrimaryColor: isPrimaryColor,
    letterSpacing: letterSpacing,
    lineHeight: lineHeight,
    isWeight300: isWeight300,
    isWeight400: isWeight400,
    isWeight500: isWeight500,
    isWeight600: isWeight600,
    isWeight700: isWeight700,
    isWeight800: isWeight800,
    isAnekBangla: isAnekBangla,
    isPalanquin: isPalanquin,
    isNotoSans: isNotoSans,
    needShadow: needShadow,
  );
}

TextStyle text20Style({
  Color color = AppColors.black,
  double fontSize = 20,
  FontWeight fontWeight = FontWeight.w800,
  bool isWhiteColor = false,
  bool isPrimaryColor = false,
  double? letterSpacing,
  double? lineHeight,
  bool isWeight300 = false,
  bool isWeight400 = false,
  bool isWeight500 = false,
  bool isWeight600 = false,
  bool isWeight700 = false,
  bool isWeight800 = false,
  bool isAnekBangla = false,
  bool isPalanquin = false,
  bool isNotoSans = false,
  bool needShadow = false,
}) {
  return textStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
    isWhiteColor: isWhiteColor,
    isPrimaryColor: isPrimaryColor,
    letterSpacing: letterSpacing,
    lineHeight: lineHeight,
    isWeight300: isWeight300,
    isWeight400: isWeight400,
    isWeight500: isWeight500,
    isWeight600: isWeight600,
    isWeight700: isWeight700,
    isWeight800: isWeight800,
    isAnekBangla: isAnekBangla,
    isPalanquin: isPalanquin,
    isNotoSans: isNotoSans,
    needShadow: needShadow,
  );
}