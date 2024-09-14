import 'package:get/get.dart';
import 'package:todo_sensor_tracking_app/app/routes/app_pages.dart';

import '../../../core/constants/assets_constants.dart';

class TodoSplashController extends GetxController {
  final icon = todoIcon;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(
      const Duration(milliseconds: 3000),
      () {
        Get.toNamed(Routes.TODO_LIST);
      },
    );
  }
}
