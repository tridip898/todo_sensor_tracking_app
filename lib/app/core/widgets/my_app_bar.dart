import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_style.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function()? backTap;

  const MyAppBar({required this.title, this.backTap, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: text18Style(isPrimaryColor: true),
      ),
      leading: InkWell(
        onTap: backTap ?? () {
          Get.back();
        },
        borderRadius: BorderRadius.circular(30),
        child: Icon(
          Icons.arrow_back_ios_new,
          color: AppColors.black,
          size: 20.w,
        ),
      ),

      centerTitle: true,
      backgroundColor: AppColors.transparent,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
