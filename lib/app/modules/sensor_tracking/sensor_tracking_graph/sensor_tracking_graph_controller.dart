import 'package:get/get.dart';
import 'package:sensors_plus/sensors_plus.dart';

class SensorTrackingGraphController extends GetxController {
  final accelerometerX = <double>[].obs,
      accelerometerY = <double>[].obs,
      accelerometerZ = <double>[].obs,
      gyroX = <double>[].obs,
      gyroY = <double>[].obs,
      gyroZ = <double>[].obs;

  final alert = false.obs;
  final int maxLength = 100;
  final double threshold = 10.0;

  @override
  void onInit() {
    super.onInit();
    accelerometerEvents.listen((AccelerometerEvent event) {
      if (accelerometerX.length > maxLength) {
        accelerometerX.removeAt(0);
        accelerometerY.removeAt(0);
        accelerometerZ.removeAt(0);
      }
      accelerometerX.add(event.x);
      accelerometerY.add(event.y);
      accelerometerZ.add(event.z);
      checkForHighMovement(event.x, event.y, event.z);
    });

    gyroscopeEvents.listen((GyroscopeEvent event) {
      if (gyroX.length > maxLength) {
        gyroX.removeAt(0);
        gyroY.removeAt(0);
        gyroZ.removeAt(0);
      }
      gyroX.add(event.x);
      gyroY.add(event.y);
      gyroZ.add(event.z);
      checkForHighMovement(event.x, event.y, event.z);
    });
  }

  void checkForHighMovement(double x, double y, double z) {
    if ((x.abs() > threshold && y.abs() > threshold) ||
        (x.abs() > threshold && z.abs() > threshold) ||
        (y.abs() > threshold && z.abs() > threshold)) {
      alert.value = true; // Trigger alert
    } else {
      alert.value = false; // Reset alert
    }
  }
}

// void checkForAlert() {
//   if ((accelerometerX.value.abs() > movementThreshold &&
//       accelerometerY.value.abs() > movementThreshold) ||
//       (gyroX.value.abs() > movementThreshold &&
//           gyroY.value.abs() > movementThreshold)) {
//     alert.value = true;
//   } else {
//     alert.value = false;
//   }
// }
