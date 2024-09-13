import 'package:get/get.dart';

import 'sensor_tracking_graph_controller.dart';

class SensorTrackingGraphBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SensorTrackingGraphController>(
      () => SensorTrackingGraphController(),
    );
  }
}
