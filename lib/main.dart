import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'app/core/bindings/initial_binding.dart';
import 'app/core/constants/app_constants.dart';
import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  ));
  runApp(
    ScreenUtilInit(
      designSize: const Size(392, 805),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          title: "ToDo App",
          initialRoute: AppPages.INITIAL,
          debugShowCheckedModeBanner: false,
          defaultTransition: transition,
          initialBinding: InitialBindings(),
          transitionDuration: const Duration(milliseconds: transitionDuration),
          getPages: AppPages.routes,
          // builder: EasyLoading.init(),
          themeMode: ThemeMode.dark,
          locale: Get.locale,
          theme: ThemeData(
            useMaterial3: false,
          ),
          fallbackLocale: const Locale('en', 'US'),
        );
      },
    ),
  );
}
