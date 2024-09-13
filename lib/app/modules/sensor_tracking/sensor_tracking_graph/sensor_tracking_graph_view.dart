import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'sensor_tracking_graph_controller.dart';

class SensorTrackingGraphView extends GetView<SensorTrackingGraphController> {
  const SensorTrackingGraphView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SensorTrackingGraphView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SensorTrackingGraphView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
