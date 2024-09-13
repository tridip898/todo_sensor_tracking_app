import 'package:get/get.dart';

import 'initial_screen_controller.dart';

class InitialScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InitialScreenController>(
      () => InitialScreenController(),
    );
  }
}
