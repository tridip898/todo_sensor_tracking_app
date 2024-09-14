import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:todo_sensor_tracking_app/app/core/constants/app_colors.dart';
import 'package:todo_sensor_tracking_app/app/core/constants/app_constants.dart';
import 'package:todo_sensor_tracking_app/app/core/widgets/my_app_bar.dart';

import 'sensor_tracking_graph_controller.dart';

class SensorTrackingGraphView extends GetView<SensorTrackingGraphController> {
  const SensorTrackingGraphView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: "Sensor Tracking"),
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: mainPaddings(16, 0),
            child: Column(
              children: [
                gapH8,
                Obx(() {
                  return controller.alert.value
                      ? Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.red,
                          child: const Text(
                            "ALERT: High movement detected!",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      : const SizedBox.shrink();
                }),
                Visibility(
                  visible: controller.alert.value,
                  child: gapH8,
                ),
                Expanded(
                  child: buildGraph(
                    title: 'Gyro',
                    xData: controller.gyroX,
                    yData: controller.gyroY,
                    zData: controller.gyroZ,
                  ),
                ),
                gapH16,
                Expanded(
                  child: buildGraph(
                    title: 'Accelerometer Sensor Data',
                    xData: controller.accelerometerX,
                    yData: controller.accelerometerY,
                    zData: controller.accelerometerZ,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildGraph({
    required String title,
    required List<double> xData,
    required List<double> yData,
    required List<double> zData,
  }) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.borderColor),
          borderRadius: borderCircular(16)),
      padding: mainPaddings(4, 4),
      child: SfCartesianChart(
        title: ChartTitle(text: title),
        legend: const Legend(isVisible: true),
        primaryXAxis: const NumericAxis(title: AxisTitle(text: 'Time (Index)')),
        primaryYAxis:
            const NumericAxis(title: AxisTitle(text: 'Sensor Values')),
        series: <LineSeries>[
          LineSeries<double, int>(
            name: 'X-axis',
            dataSource: xData,
            xValueMapper: (data, index) => index,
            yValueMapper: (data, _) => data,
            color: Colors.red,
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
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
