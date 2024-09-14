import 'package:get/get.dart';

import 'todo_splash_controller.dart';

class TodoSplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoSplashController>(
      () => TodoSplashController(),
    );
  }
}
