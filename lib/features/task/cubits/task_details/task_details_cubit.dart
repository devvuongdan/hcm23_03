// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hcm23_03/features/home/pages/home_page.dart';

import '../../../../shared/shared_ui/dialogs/hcm23_dialog.dart';
import '../../data/entities/task.dart';
import '../../data/entities/task_details_page_arg.dart';

part 'task_details_state.dart';

class TaskDetailsCubit extends Cubit<TaskDetailsState> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TaskDetailsPageArg arg;
  late final String originTask;
  TaskDetailsCubit(
    this.arg,
  ) : super(TaskDetailsLoading());

  void initState() async {
    originTask = jsonEncode(arg.task);
    await Future.delayed(const Duration(seconds: 1));
    titleController.text = arg.task.title ?? "";
    descriptionController.text = arg.task.description ?? "";

    titleController.addListener(
      () {
        final Task editedTask = arg.task.copyWith(title: titleController.text);
        emit(TaskDetailsLoaded(task: editedTask));
      },
    );

    descriptionController.addListener(
      () {
        final Task editedTask =
            arg.task.copyWith(description: descriptionController.text);
        emit(TaskDetailsLoaded(task: editedTask));
      },
    );

    emit(TaskDetailsLoaded(task: arg.task));
  }

  void handleChange(
    Task currentTask,
    BuildContext ctx,
    void Function(Task task, BuildContext ctx) updateTask,
  ) {
    final String taskJson = jsonEncode(currentTask);
    if (taskJson != originTask) {
      showDialog(
        context: ctx,
        builder: (context) => HCM23Dialog(
          title: 'Thông báo',
          content: "Bạn có muốn cập nhật thay đổi?",
          backgroundColor: Colors.amber,
          titleTextStyle: const TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          contentTextStyle: const TextStyle(fontSize: 16, color: Colors.white),
          actions: [
            CleanDialogActionButtons(
              actionTitle: 'OK',
              onPressed: () {
                updateTask(currentTask, ctx);
              },
            ),
          ],
        ),
      );
    } else {
      Navigator.of(ctx).popUntil(ModalRoute.withName(HomePage.routeName));
    }
  }
}
