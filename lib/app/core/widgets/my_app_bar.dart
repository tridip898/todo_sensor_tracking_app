import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/constants/app_colors.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const MyAppBar({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: text18Style(isPrimaryColor: true),
      ),
      leading: Container(
        height: 20.w,
        width: 20.w,
        margin: EdgeInsets.only(left: 20.w, bottom: 10.h, top: 10.h),
        decoration: BoxDecoration(
          color: AppColors.textGrey.withOpacity(.1),
          border: Border.all(
            color: AppColors.textGrey.withOpacity(.5),
          ),
          shape: BoxShape.circle,
        ),
        child: InkWell(
          onTap: () {
            Get.back();
          },
          borderRadius: BorderRadius.circular(30),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.black,
            size: 20.w,
          ),
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
