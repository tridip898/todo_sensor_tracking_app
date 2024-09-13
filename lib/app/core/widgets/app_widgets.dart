import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_constants.dart';

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
}

