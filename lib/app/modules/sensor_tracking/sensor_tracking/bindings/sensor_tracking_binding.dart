import 'package:get/get.dart';

import '../controllers/sensor_tracking_controller.dart';

class SensorTrackingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SensorTrackingController>(
      () => SensorTrackingController(),
    );
  }
}
