import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/todo_add_controller.dart';

class TodoAddView extends GetView<TodoAddController> {
  const TodoAddView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TodoAddView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TodoAddView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
