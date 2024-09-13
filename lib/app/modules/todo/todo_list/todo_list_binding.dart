import 'package:get/get.dart';

import 'todo_list_controller.dart';

class TodoListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoListController>(
      () => TodoListController(),
    );
  }
}
