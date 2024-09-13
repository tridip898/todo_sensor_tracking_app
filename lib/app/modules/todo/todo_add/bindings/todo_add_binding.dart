import 'package:get/get.dart';

import '../controllers/todo_add_controller.dart';

class TodoAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoAddController>(
      () => TodoAddController(),
    );
  }
}
