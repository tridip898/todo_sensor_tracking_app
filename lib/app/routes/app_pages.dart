import 'package:get/get.dart';

import '../modules/initial_screen/initial_screen_binding.dart';
import '../modules/initial_screen/initial_screen_view.dart';
import '../modules/sensor_tracking/sensor_tracking/bindings/sensor_tracking_binding.dart';
import '../modules/sensor_tracking/sensor_tracking/views/sensor_tracking_view.dart';
import '../modules/sensor_tracking/sensor_tracking_graph/sensor_tracking_graph_binding.dart';
import '../modules/sensor_tracking/sensor_tracking_graph/sensor_tracking_graph_view.dart';
import '../modules/todo/todo_add/bindings/todo_add_binding.dart';
import '../modules/todo/todo_add/views/todo_add_view.dart';
import '../modules/todo/todo_list/todo_list_binding.dart';
import '../modules/todo/todo_list/todo_list_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.INITIAL_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.INITIAL_SCREEN,
      page: () => const InitialScreenView(),
      binding: InitialScreenBinding(),
    ),
    GetPage(
      name: _Paths.TODO_LIST,
      page: () => const TodoListView(),
      binding: TodoListBinding(),
    ),
    GetPage(
      name: _Paths.TODO_ADD,
      page: () => const TodoAddView(),
      binding: TodoAddBinding(),
    ),
    GetPage(
      name: _Paths.SENSOR_TRACKING_GRAPH,
      page: () => const SensorTrackingGraphView(),
      binding: SensorTrackingGraphBinding(),
    ),
    GetPage(
      name: _Paths.SENSOR_TRACKING,
      page: () => const SensorTrackingView(),
      binding: SensorTrackingBinding(),
    ),
  ];
}
