import 'package:get/get.dart';

import 'sensor_tracking_controller.dart';

class SensorTrackingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SensorTrackingController>(
      () => SensorTrackingController(),
    );
  }
}
