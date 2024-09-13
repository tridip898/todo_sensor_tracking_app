import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/sensor_tracking_controller.dart';

class SensorTrackingView extends GetView<SensorTrackingController> {
  const SensorTrackingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SensorTrackingView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SensorTrackingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
