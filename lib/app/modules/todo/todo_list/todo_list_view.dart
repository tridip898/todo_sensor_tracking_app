import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_sensor_tracking_app/app/core/data/todo_model.dart';
import 'package:todo_sensor_tracking_app/app/core/widgets/app_edit_text.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_text_style.dart';
import '../../../core/widgets/my_app_bar.dart';
import 'todo_list_controller.dart';

class TodoListView extends GetView<TodoListController> {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: 'To-Do List',
      ),
      backgroundColor: AppColors.white,
      floatingActionButton: addTaskButton(context),
      body: Padding(
        padding: mainPaddings(20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            gapH8,
            Obx(
              () => Text(
                '${controller.completedCount.value} Completed, ${controller.incompleteCount.value} Incomplete',
                style: text14Style(),
              ),
            ),
            gapH12,
            Expanded(
              child: Obx(() {
                return ListView.separated(
                  itemCount: controller.todos.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final todo = controller.todos[index];
                    return toDoCard(context, todo);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return gapH12;
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  addTaskButton(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        showAddTodoDialog(context);
      },
      label: Text(
        "Add a Task",
        style: text16Style(isWhiteColor: true),
      ),
      icon: Icon(
        Icons.add,
        size: 18.w,
      ),
    );
  }

  void showAddTodoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: borderCircular(16)),
          actionsPadding: mainPaddings(20, 8),
          title: const Text('Add New Task'),
          content: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  AppEditText(
                    title: "Enter Title",
                    controller: controller.titleController,
                  ),
                  AppEditText(
                    title: "Enter Subtitle",
                    controller: controller.subtitleController,
                  ),
                  AppEditText(
                    title: "Select Date",
                    controller: controller.dateController,
                    isReadonly: true,
                    suffixIcon: Icons.calendar_month_rounded,
                    clickListener: controller.startDateClick,
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Get.back();
              },
            ),
            ElevatedButton(
              child: const Text('Add Task'),
              onPressed: () {
                controller.addTaskClick();
              },
            ),
          ],
        );
      },
    );
  }

  Widget toDoCard(BuildContext context, Todo todo) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: borderCircular(16),
          border: Border.all(color: AppColors.borderColor, width: 1),
          boxShadow: [
            BoxShadow(
              color: AppColors.grey.withOpacity(.2),
              blurRadius: 8,
              spreadRadius: -3,
            )
          ]),
      padding: mainPaddings(0, 10, leftPadding: 8, rightPadding: 16),
      child: Row(
        children: [
          Checkbox(
            value: todo.isCompleted == 1,
            onChanged: (val) {
              controller.updateTodoStatus(todo, val ?? false);
            },
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  todo.title,
                  style: text16Style(),
                ),
                gapH3,
                Text(
                  todo.subtitle,
                  style: text14Style(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                gapH3,
                Row(
                  children: [
                    Icon(
                      Icons.calendar_month_rounded,
                      size: 18.w,
                    ),
                    gapW3,
                    Expanded(
                      child: Text(todo.date),
                    ),
                  ],
                ),
              ],
            ),
          ),
          gapW6,
          Column(
            children: [
              actionButton(
                Icons.edit,
                AppColors.green,
                () {
                  showEditTodoDialog(context, todo);
                },
              ),
              gapH6,
              actionButton(
                Icons.delete_outline_rounded,
                AppColors.red,
                () {
                  controller.deleteTodoById(todo.id ?? -1);
                },
              ),
            ],
          )
        ],
      ),
    );
    return ListTile(
      tileColor: AppColors.white,
      title: Text(todo.title),
      subtitle: Text('${todo.subtitle}\n${todo.date}'),
      trailing: Checkbox(
        value: todo.isCompleted == 1,
        onChanged: (val) {
          controller.updateTodoStatus(todo, val!);
        },
      ),
      onLongPress: () {
        controller.deleteTodoById(todo.id!);
      },
    );
  }

  actionButton(IconData icon, Color? color, Function()? onTap) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(4),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(3),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 6.w,
            vertical: 6.w,
          ),
          child: Icon(
            icon,
            size: 16.w,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }

  void showEditTodoDialog(BuildContext context, Todo todo) {
    controller.titleController.text = todo.title;
    controller.subtitleController.text = todo.subtitle;
    controller.dateController.text = todo.date;
    controller.selectedDate.value = DateFormat("dd MMM yyyy").parse(todo.date);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Task'),
          shape: RoundedRectangleBorder(borderRadius: borderCircular(16)),
          actionsPadding: mainPaddings(20, 8),
          content: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  AppEditText(
                    title: "Enter Title",
                    controller: controller.titleController,
                  ),
                  AppEditText(
                    title: "Enter Subtitle",
                    controller: controller.subtitleController,
                  ),
                  AppEditText(
                    title: "Select Date",
                    controller: controller.dateController,
                    isReadonly: true,
                    suffixIcon: Icons.calendar_month_rounded,
                    clickListener: controller.startDateClick,
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text('Update Task'),
              onPressed: () {
                controller.updateTaskClick(todo);
              },
            ),
          ],
        );
      },
    );
  }
}
