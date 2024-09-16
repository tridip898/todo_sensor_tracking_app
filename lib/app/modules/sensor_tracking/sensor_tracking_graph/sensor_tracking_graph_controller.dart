import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sensors_plus/sensors_plus.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_text_style.dart';

class SensorTrackingGraphController extends GetxController {
  final gyroscopeData = <double>[0, 0, 0].obs;
  final accelerometerData = <double>[0, 0, 0].obs;

  final gyroscopeX = <double>[].obs,
      gyroscopeY = <double>[].obs,
      gyroscopeZ = <double>[].obs;
  final accelerometerX = <double>[].obs,
      accelerometerY = <double>[].obs,
      accelerometerZ = <double>[].obs;

  final alertTriggered = false.obs;
  final double alertThreshold = 15.0;
  final int maxLength = 100;

  @override
  void onInit() {
    super.onInit();

    gyroscopeEventStream().listen((GyroscopeEvent event) {
      gyroscopeData.value = [event.x, event.y, event.z];
      updateGraph(gyroscopeX, gyroscopeData[0]);
      updateGraph(gyroscopeY, gyroscopeData[1]);
      updateGraph(gyroscopeZ, gyroscopeData[2]);
      checkForAlert();
      gyroscopeData.refresh();
    });

    accelerometerEventStream().listen((AccelerometerEvent event) {
      accelerometerData.value = [event.x, event.y, event.z];
      updateGraph(accelerometerX, accelerometerData[0]);
      updateGraph(accelerometerY, accelerometerData[1]);
      updateGraph(accelerometerZ, accelerometerData[2]);
      checkForAlert();
      accelerometerData.refresh();
    });
  }

  void updateGraph(RxList<double> axisData, double newValue) {
    if (axisData.length >= maxLength) {
      axisData.removeAt(0);
    }
    axisData.add(newValue);
    axisData.refresh();
  }

  void checkForAlert() {
    bool highMovementGyro =
        (gyroscopeData.where((val) => val.abs() > alertThreshold).length >= 2);
    bool highMovementAccel =
        (accelerometerData.where((val) => val.abs() > alertThreshold).length >=
            2);

    alertTriggered.value = highMovementGyro || highMovementAccel;
    if (alertTriggered.value) {
      showAlert();
    }
  }

  void showAlert() {
    Get.dialog(
      AlertDialog(
        title: Text(
          "Alert",
          style: text20Style(color: AppColors.red),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: borderCircular(16),
        ),
        content: Text(
          "High Movement Detected!",
          style: text16Style(),
        ),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Get.back(); // Close the dialog
            },
          ),
        ],
      ),
    );
  }
}

/// todo fl_Chart
/*
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:sensors_plus/sensors_plus.dart';

class SensorTrackingGraphController extends GetxController {
  final gyroscopeData = [0.0, 0.0, 0.0].obs,
      accelerometerData = [0.0, 0.0, 0.0].obs;

  final gyroscopeX = <FlSpot>[const FlSpot(0, 0)].obs,
      gyroscopeY = <FlSpot>[const FlSpot(0, 0)].obs,
      gyroscopeZ = <FlSpot>[const FlSpot(0, 0)].obs;

  final accelerometerX = <FlSpot>[const FlSpot(0, 0)].obs,
      accelerometerY = <FlSpot>[const FlSpot(0, 0)].obs,
      accelerometerZ = <FlSpot>[const FlSpot(0, 0)].obs;

  var alertTriggered = false.obs;
  double alertThreshold = 15.0, xAxisCounter = 0;

  @override
  void onInit() {
    super.onInit();
    gyroscopeEventStream().listen((GyroscopeEvent event) {
      gyroscopeData.value = [event.x, event.y, event.z];
      updateGraph(gyroscopeX, gyroscopeData[0]);
      updateGraph(gyroscopeY, gyroscopeData[1]);
      updateGraph(gyroscopeZ, gyroscopeData[2]);
      checkForAlert();
    });

    accelerometerEventStream().listen((AccelerometerEvent event) {
      accelerometerData.value = [event.x, event.y, event.z];
      updateGraph(accelerometerX, accelerometerData[0]);
      updateGraph(accelerometerY, accelerometerData[1]);
      updateGraph(accelerometerZ, accelerometerData[2]);
      checkForAlert();
    });
  }

  void updateGraph(RxList<FlSpot> axisData, double newValue) {
    if (axisData.length >= 20) {
      axisData.removeAt(0);
    }
    axisData.add(FlSpot(xAxisCounter, newValue));
    xAxisCounter += 1;
  }

  void checkForAlert() {
    bool highMovementGyro =
        (gyroscopeData.where((val) => val.abs() > alertThreshold).length >= 2);
    bool highMovementAccel =
        (accelerometerData.where((val) => val.abs() > alertThreshold).length >=
            2);
    alertTriggered.value = highMovementGyro || highMovementAccel;
  }
}
*/

/// todo old
// import 'package:get/get.dart';
// import 'package:sensors_plus/sensors_plus.dart';
//
// class SensorTrackingGraphController extends GetxController {
//   final accelerometerX = <double>[].obs,
//       accelerometerY = <double>[].obs,
//       accelerometerZ = <double>[].obs,
//       gyroX = <double>[].obs,
//       gyroY = <double>[].obs,
//       gyroZ = <double>[].obs;
//
//   final alert = false.obs;
//   final int maxLength = 100;
//   final double threshold = 10.0;
//
//   @override
//   void onInit() {
//     super.onInit();
//     accelerometerEventStream().listen((AccelerometerEvent event) {
//       if (accelerometerX.length > maxLength) {
//         accelerometerX.removeAt(0);
//         accelerometerY.removeAt(0);
//         accelerometerZ.removeAt(0);
//       }
//       accelerometerX.add(event.x);
//       accelerometerY.add(event.y);
//       accelerometerZ.add(event.z);
//       checkForHighMovement(event.x, event.y, event.z);
//     });
//
//     gyroscopeEventStream().listen((GyroscopeEvent event) {
//       if (gyroX.length > maxLength) {
//         gyroX.removeAt(0);
//         gyroY.removeAt(0);
//         gyroZ.removeAt(0);
//       }
//       gyroX.add(event.x);
//       gyroY.add(event.y);
//       gyroZ.add(event.z);
//       checkForHighMovement(event.x, event.y, event.z);
//     });
//   }
//
//   void checkForHighMovement(double x, double y, double z) {
//     if ((x.abs() > threshold && y.abs() > threshold) ||
//         (x.abs() > threshold && z.abs() > threshold) ||
//         (y.abs() > threshold && z.abs() > threshold)) {
//       alert.value = true; // Trigger alert
//     } else {
//       alert.value = false; // Reset alert
//     }
//   }
// }
