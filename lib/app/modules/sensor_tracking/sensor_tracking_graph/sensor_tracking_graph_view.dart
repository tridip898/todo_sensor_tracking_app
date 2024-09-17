import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/widgets/my_app_bar.dart';
import 'sensor_tracking_graph_controller.dart';

class SensorTrackingGraphView extends GetView<SensorTrackingGraphController> {
  const SensorTrackingGraphView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: "Sensor Tracking"),
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Obx(() {
            return buildGraph(
              'Gyroscope Data',
              controller.gyroscopeX.value,
              controller.gyroscopeY.value,
              controller.gyroscopeZ.value,
            );
          }),

          Obx(() {
            return buildGraph(
              'Accelerometer Data',
              controller.accelerometerX.value,
              controller.accelerometerY.value,
              controller.accelerometerZ.value,
            );
          }),
        ],
      ),
    );
  }

  Widget buildGraph(String title, List<double> xData, List<double> yData,
      List<double> zData) {
    return Expanded(
      child: Padding(
        padding: mainPaddings(20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: Get.height * .4,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.borderColor),
                borderRadius: borderCircular(16),
              ),
              child: SfCartesianChart(
                title: ChartTitle(text: title),
                legend: const Legend(isVisible: true),
                primaryXAxis:
                    const NumericAxis(title: AxisTitle(text: 'Time (Index)')),
                primaryYAxis:
                    const NumericAxis(title: AxisTitle(text: 'Sensor Values')),
                series: <LineSeries>[
                  LineSeries<double, int>(
                    name: 'X-axis',
                    dataSource: xData,
                    xValueMapper: (data, index) => index,
                    yValueMapper: (data, _) => data,
                    color: Colors.blue,
                  ),
                  LineSeries<double, int>(
                    name: 'Y-axis',
                    dataSource: yData,
                    xValueMapper: (data, index) => index,
                    yValueMapper: (data, _) => data,
                    color: Colors.green,
                  ),
                  LineSeries<double, int>(
                    name: 'Z-axis',
                    dataSource: zData,
                    xValueMapper: (data, index) => index,
                    yValueMapper: (data, _) => data,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}