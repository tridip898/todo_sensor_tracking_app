// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:todo_sensor_tracking_app/app/core/constants/app_colors.dart';
// import 'package:todo_sensor_tracking_app/app/core/constants/app_constants.dart';
// import 'package:todo_sensor_tracking_app/app/core/widgets/my_app_bar.dart';
//
// import 'sensor_tracking_graph_controller.dart';
//
// class SensorTrackingGraphView extends GetView<SensorTrackingGraphController> {
//   const SensorTrackingGraphView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const MyAppBar(title: "Sensor Tracking"),
//       backgroundColor: AppColors.white,
//       body: SafeArea(
//         child: Center(
//           child: Padding(
//             padding: mainPaddings(16, 0),
//             child: Column(
//               children: [
//                 gapH8,
//                 Obx(() {
//                   return controller.alert.value
//                       ? Container(
//                     padding: const EdgeInsets.all(8),
//                     color: Colors.red,
//                     child: const Text(
//                       "ALERT: High movement detected!",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   )
//                       : const SizedBox.shrink();
//                 }),
//                 Obx(() {
//                   return Visibility(
//                     visible: controller.alert.value,
//                     child: gapH8,
//                   );
//                 }),
//                 Expanded(
//                   child: buildGraph(
//                     title: 'Gyro',
//                     xData: controller.gyroX,
//                     yData: controller.gyroY,
//                     zData: controller.gyroZ,
//                   ),
//                 ),
//                 gapH16,
//                 Expanded(
//                   child: buildGraph(
//                     title: 'Accelerometer Sensor Data',
//                     xData: controller.accelerometerX,
//                     yData: controller.accelerometerY,
//                     zData: controller.accelerometerZ,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget buildGraph({
//     required String title,
//     required List<double> xData,
//     required List<double> yData,
//     required List<double> zData,
//   }) {
//     return Container(
//       decoration: BoxDecoration(
//           border: Border.all(color: AppColors.borderColor),
//           borderRadius: borderCircular(16)),
//       padding: mainPaddings(4, 4),
//       child: SfCartesianChart(
//         title: ChartTitle(text: title),
//         legend: const Legend(isVisible: true),
//         primaryXAxis: const NumericAxis(title: AxisTitle(text: 'Time (Index)')),
//         primaryYAxis:
//         const NumericAxis(title: AxisTitle(text: 'Sensor Values')),
//         series: <LineSeries>[
//           LineSeries<double, int>(
//             name: 'X-axis',
//             dataSource: xData,
//             xValueMapper: (data, index) => index,
//             yValueMapper: (data, _) => data,
//             color: Colors.red,
//           ),
//           LineSeries<double, int>(
//             name: 'Y-axis',
//             dataSource: yData,
//             xValueMapper: (data, index) => index,
//             yValueMapper: (data, _) => data,
//             color: Colors.green,
//           ),
//           LineSeries<double, int>(
//             name: 'Z-axis',
//             dataSource: zData,
//             xValueMapper: (data, index) => index,
//             yValueMapper: (data, _) => data,
//             color: Colors.blue,
//           ),
//         ],
//       ),
//     );
//   }
//
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:todo_sensor_tracking_app/app/core/constants/app_colors.dart';
import 'package:todo_sensor_tracking_app/app/core/constants/app_constants.dart';
import 'package:todo_sensor_tracking_app/app/core/constants/app_text_style.dart';
import 'package:todo_sensor_tracking_app/app/core/widgets/my_app_bar.dart';
import 'package:todo_sensor_tracking_app/app/modules/sensor_tracking/sensor_tracking_graph/sensor_tracking_graph_controller.dart';

class SensorTrackingGraphView extends GetView<SensorTrackingGraphController> {
  const SensorTrackingGraphView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: "Sensor Tracking"),
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          // Gyroscope Data Graph
          Obx(() {
            return buildGraph(
              'Gyroscope Data',
              controller.gyroscopeX.value,
              controller.gyroscopeY.value,
              controller.gyroscopeZ.value,
            );
          }),

          // Accelerometer Data Graph
          Obx(() {
            return buildGraph(
              'Accelerometer Data',
              controller.accelerometerX.value,
              controller.accelerometerY.value,
              controller.accelerometerZ.value,
            );
          }),

          // Alert box
          Obx(() {
            if (controller.alertTriggered.value) {
              return Container(
                margin: const EdgeInsets.all(10),
                padding: mainPaddings(20, 10),
                color: Colors.red,
                child: Text(
                  "ALERT: High Movement Detected!",
                  style: text18Style(isWhiteColor: true, isWeight600: true),
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
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

/// todo flchart
/*import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                buildGraph("Gyroscope Data", controller.gyroscopeX,
                    controller.gyroscopeY, controller.gyroscopeZ),
                buildGraph("Accelerometer Data", controller.accelerometerX,
                    controller.accelerometerY, controller.accelerometerZ),
                Obx(() => controller.alertTriggered.value
                    ? Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(10),
                        color: Colors.red,
                        child: const Text(
                          "ALERT: High Movement Detected!",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    : Container()), // Empty container if no alert
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildGraph(String title, RxList<FlSpot> xData, RxList<FlSpot> yData,
      RxList<FlSpot> zData) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              height: Get.height * .35,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Obx(
                () => LineChart(
                  LineChartData(
                    lineBarsData: [
                      createLineData(xData, Colors.blue, "X Axis"),
                      createLineData(yData, Colors.green, "Y Axis"),
                      createLineData(zData, Colors.red, "Z Axis"),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Create line data for chart
  LineChartBarData createLineData(
      RxList<FlSpot> spots, Color color, String axisLabel) {
    return LineChartBarData(
      spots: spots.toList(),
      // Convert RxList to List
      isCurved: true,
      color: color,
      barWidth: 2,
      belowBarData: BarAreaData(show: false),
    );
  }
}*/
