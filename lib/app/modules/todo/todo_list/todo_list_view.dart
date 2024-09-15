import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_sensor_tracking_app/app/core/data/todo_model.dart';
import 'package:todo_sensor_tracking_app/app/core/widgets/app_edit_text.dart';
import 'package:todo_sensor_tracking_app/app/core/widgets/app_widgets.dart';

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
      appBar: MyAppBar(
        title: 'To-Do List',
        backTap: () {
          Get.back();
          Get.back();
        },
      ),
      backgroundColor: AppColors.white,
      floatingActionButton: floatingActionButton(context),
      body: Padding(
        padding: mainPaddings(20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            gapH8,
            AppEditText(
              title: "",
              controller: controller.searchController,
              hintText: "Search task....",
              suffixIcon: Icons.search_rounded,
              isRequired: false,
              needTopSpace: false,
            ),
            gapH16,
            Obx(
              () => Text(
                '${controller.completedCount.value} Completed, ${controller.incompleteCount.value} Incomplete',
                style: text14Style(),
              ),
            ),
            gapH12,
            Expanded(
              child: Obx(() {
                if (controller.todos.isEmpty) {
                  return AppWidget().noDataFoundMsg();
                }
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

  floatingActionButton(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: AppColors.primaryColor,
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
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          shape: RoundedRectangleBorder(borderRadius: borderCircular(16)),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: borderCircular(16),
            ),
            padding: mainPaddings(16, 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Add New Task",
                    style: text18Style(),
                  ),
                  gapH8,
                  Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        AppEditText(
                          title: "Enter Title",
                          controller: controller.titleController,
                          focusNode: controller.titleFocusNode,
                          nextFocus: controller.subtitleFocusNode,
                        ),
                        AppEditText(
                          title: "Enter Subtitle",
                          controller: controller.subtitleController,
                          focusNode: controller.subtitleFocusNode,
                          nextFocus: controller.dateFocusNode,
                        ),
                        AppEditText(
                          title: "Select Date",
                          controller: controller.dateController,
                          isReadonly: true,
                          suffixIcon: Icons.calendar_month_rounded,
                          clickListener: controller.startDateClick,
                          focusNode: controller.dateFocusNode,
                        ),
                      ],
                    ),
                  ),
                  gapH12,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        child: const Text('Cancel'),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor),
                        onPressed: () {
                          controller.addTaskClick();
                        },
                        child: const Text('Add Task'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget toDoCard(BuildContext context, Todo todo) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: borderCircular(16),
          border: Border.all(
              color: todo.isCompleted == 1
                  ? AppColors.primaryColor
                  : AppColors.borderColor,
              width: 1),
          boxShadow: [
            BoxShadow(
              color: AppColors.grey.withOpacity(.2),
              blurRadius: 16,
              spreadRadius: -3,
            )
          ]),
      padding: mainPaddings(0, 10, leftPadding: 8, rightPadding: 16),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Checkbox(
              value: todo.isCompleted == 1,
              activeColor: AppColors.primaryColor,
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
            VerticalDivider(
              color: AppColors.grey,
              width: 18.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
      ),
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
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          shape: RoundedRectangleBorder(borderRadius: borderCircular(16)),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: borderCircular(16),
            ),
            padding: mainPaddings(16, 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Update Task",
                    style: text18Style(),
                  ),
                  gapH8,
                  Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        AppEditText(
                          title: "Enter Title",
                          controller: controller.titleController,
                          focusNode: controller.titleFocusNode,
                          nextFocus: controller.subtitleFocusNode,
                        ),
                        AppEditText(
                          title: "Enter Subtitle",
                          controller: controller.subtitleController,
                          focusNode: controller.subtitleFocusNode,
                          nextFocus: controller.dateFocusNode,
                        ),
                        AppEditText(
                          title: "Select Date",
                          controller: controller.dateController,
                          isReadonly: true,
                          suffixIcon: Icons.calendar_month_rounded,
                          clickListener: controller.startDateClick,
                          focusNode: controller.dateFocusNode,
                        ),
                      ],
                    ),
                  ),
                  gapH12,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        child: const Text('Cancel'),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor),
                        onPressed: () {
                          controller.updateTaskClick(todo);
                        },
                        child: const Text('Update Task'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
