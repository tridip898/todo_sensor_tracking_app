import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_sensor_tracking_app/app/core/constants/app_constants.dart';
import 'package:todo_sensor_tracking_app/app/core/widgets/app_widgets.dart';

import '../../../core/data/todo_model.dart';
import '../../../core/helper/db_helper.dart';

class TodoListController extends GetxController {
  final titleController = TextEditingController(),
      subtitleController = TextEditingController(),
      dateController = TextEditingController(),
      searchController = TextEditingController();
  final titleFocusNode = FocusNode(),
      subtitleFocusNode = FocusNode(),
      dateFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  final todos = <Todo>[].obs;
  var todoListDemo = <Todo>[];
  final selectedDate = DateTime.now().obs;

  // var alertedTasks = <int>{}.obs;
  final completedCount = 0.obs, incompleteCount = 0.obs;

  DBHelper dbHelper = DBHelper();
  Timer? checkDueTimer;

  @override
  void onInit() {
    super.onInit();
    searchController.addListener(() {
      return searchTask(searchController.text);
    });
    loadTodos();
    checkDueTimer = Timer.periodic(const Duration(hours: 6), (timer) {
      checkForDueToday();
    });
  }

  @override
  void onClose() {
    checkDueTimer?.cancel();
    super.onClose();
  }

  Future<void> loadTodos() async {
    var result = await dbHelper.queryAll();
    todos.clear();
    todoListDemo.clear();
    List<Todo> demo = [];
    for (var element in result) {
      demo.add(Todo.fromMap(element));
    }
    todos.value = demo;
    todoListDemo.addAll(todos);
    updateCounts();
  }

  Future<void> addTodo(Todo todo) async {
    await dbHelper.insert(todo.toMap());
    loadTodos();
  }

  Future<void> updateTodo(Todo todo) async {
    await dbHelper.update(todo.toMap());
    loadTodos();
  }

  Future<void> updateTodoStatus(Todo todo, bool isCompleted) async {
    todo.isCompleted = isCompleted ? 1 : 0;
    await dbHelper.update(todo.toMap());
    loadTodos();
  }

  Future<void> deleteTodoById(int id) async {
    await dbHelper.delete(id);
    loadTodos();
  }

  void updateCounts() {
    completedCount.value = todos.where((todo) => todo.isCompleted == 1).length;
    incompleteCount.value = todos.where((todo) => todo.isCompleted == 0).length;
  }

  void addTaskClick() {
    if (formKey.currentState?.validate() ?? false) {
      addTodo(
        Todo(
          title: titleController.text,
          subtitle: subtitleController.text,
          date: dateController.text,
        ),
      );
      clearTextFields();
      Get.back();
    }
  }

  void clearTextFields() {
    titleController.clear();
    subtitleController.clear();
    dateController.clear();
    selectedDate.value = DateTime.now();
  }

  startDateClick() async {
    selectedDate.value =
        await AppWidget().datePickerMain(initialDate: selectedDate.value) ??
            selectedDate.value;
    dateController.text = DateFormat('dd MMM yyyy').format(selectedDate.value);
  }

  void checkForDueToday() {
    final String today = DateFormat('dd MMM yyyy').format(DateTime.now());

    var dueToday = todos
        .where((todo) => todo.date == today && todo.isCompleted == 0)
        .toList();

    if (dueToday.isNotEmpty) {
      for (var todo in dueToday) {
        showAlert(todo.title);
      }
    }
  }

  /* void checkForDueToday() {
    final String today = DateFormat('yyyy-MM-dd').format(DateTime.now());
    var dueToday = todos.where((todo) => todo.date == today && todo.isCompleted == 0).toList();
    if (dueToday.isNotEmpty) {
      Get.snackbar(
        "Reminder",
        "You have tasks due today. Please complete them!",
        snackPosition: SnackPosition.BOTTOM,
      );
      dueToday.forEach((todo) {
        if (!alertedTasks.contains(todo.id)) {
          showAlert(todo.title);
          alertedTasks.add(todo.id!);
        }
      });
    }
  }*/
  void showAlert(String todoTitle) {
    Get.dialog(
      AlertDialog(
        title: const Text("Task Due Today"),
        shape: RoundedRectangleBorder(
          borderRadius: borderCircular(16),
        ),
        content: Text(
            "Today is the last day for the task: $todoTitle. Please complete it."),
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

  void updateTaskClick(Todo todo) {
    if (formKey.currentState?.validate() ?? false) {
      updateTodo(
        Todo(
          id: todo.id,
          title: titleController.text,
          subtitle: subtitleController.text,
          date: dateController.text,
          isCompleted: todo.isCompleted,
        ),
      );
      Get.back();
    }
  }

  void searchTask(String searchKeyword) {
    List<Todo> results = [];
    if (searchKeyword.isEmpty) {
      results = todoListDemo;
    } else {
      results = todoListDemo.where((dictionary) {
        return (dictionary.title ?? "")
            .toLowerCase()
            .contains(searchKeyword.toLowerCase());
      }).toList();
    }
    todos.value = results;
  }
}
