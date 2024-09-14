import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../constants/assets_constants.dart';

class AppWidget {
  loaderDesign() {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }

  Widget gapH(double height) {
    return SizedBox(
      height: height.h,
    );
  }

  Widget gapW(double width) {
    return SizedBox(
      width: width.w,
    );
  }

  Future<DateTime?> datePickerMain({bool canPickFutureDate = true,
    bool canPickFirstDate = false,
    required DateTime initialDate,
    DateTime? firstDate}) async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: canPickFirstDate
          ? (initialDate.isBefore(firstDate ?? DateTime.now())
          ? firstDate
          : initialDate)
          : initialDate,
      firstDate: canPickFirstDate
          ? (firstDate ?? DateTime.now())
          : DateTime.now().subtract(const Duration(days: 365)),
      lastDate: canPickFutureDate
          ? DateTime.now().add(const Duration(days: 365))
          : DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.purple, // header background color
              onPrimary: Colors.white, // header text color
              onSurface: Colors.black, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.red, // button text color
              ),
            ),
            dialogTheme: DialogTheme(
              shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(20.0), // Set the border radius here
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null) {
      initialDate = pickedDate;
      return initialDate;
      /*  logger.i("Before format $pickedDate");
      String formattedDate = DateFormat('dd MMM yyyy').format(pickedDate);
      logger.i("After format $formattedDate");
      return formattedDate;*/
    }
    return null;
  }

  noDataFoundMsg() {
    return Center(
      child: Lottie.asset(
        noDataFoundLottie,
        width: Get.width * .8,
      ),
    );
  }

}

