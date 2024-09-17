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
