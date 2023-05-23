// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hcm23_03/features/home/cubit/home_cubit.dart';
import 'package:hcm23_03/features/task/pages/task_details_page.dart';
import 'package:uuid/uuid.dart';

import '../../../shared/shared_ui/dialogs/hcm23_dialog.dart';
import '../entities/task.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  final HomeCubit homeCubit;
  final Task? task;
  late final String originTaskString;
  late final String newTaskString;
  TaskCubit({this.task, required this.homeCubit})
      : super(const TaskState(task: null, action: TaskAction.creatingNew));
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  void initState() {
    if (task == null) {
      final Task newTask = Task(
        id: const Uuid().v4(),
        title: "",
        description: "",
        startTime: DateTime.now(),
        dueTime: DateTime.now(),
        teamMembers: const [],
        taskStages: const [],
      );
      newTaskString = newTask.toJson();
      emit(state.copyWith(
        action: TaskAction.creatingNew,
        newTask: newTask,
      ));
      titleController.addListener(
        () {
          emit(state.copyWith(
              newTask: state.newTask?.copyWith(title: titleController.text)));
        },
      );
      descriptionController.addListener(
        () {
          emit(state.copyWith(
              newTask: state.newTask
                  ?.copyWith(description: descriptionController.text)));
        },
      );
    } else {
      titleController.text = task?.title ?? "";
      descriptionController.text = task?.description ?? "";
      originTaskString = task!.toJson();
      titleController.addListener(
        () {
          emit(state.copyWith(
              task: state.task?.copyWith(title: titleController.text)));
        },
      );
      descriptionController.addListener(
        () {
          emit(state.copyWith(
              task: state.task
                  ?.copyWith(description: descriptionController.text)));
        },
      );
      emit(state.copyWith(action: TaskAction.view, task: task));
    }
  }

  void toggleAction() {
    if (state.action == TaskAction.view) {
      emit(state.copyWith(action: TaskAction.edit));
    } else {
      emit(state.copyWith(action: TaskAction.view));
    }
  }

  void updateTaskStage(int index, bool value) {
    if (task == null) {
      return;
    }
    final TaskStage taskStage = state.task!.taskStages[index].copyWith(
      isDone: value,
    );
    final List<TaskStage> stages = state.task!.taskStages
      ..replaceRange(index, index + 1, [taskStage]);

    emit(state.copyWith(task: task?.copyWith(taskStages: stages)));
  }

  void handleBack(
    BuildContext ctx,
  ) {
    if (state.action == TaskAction.creatingNew) {
      if (newTaskString != state.newTask?.toJson()) {
        showDialog(
          context: ctx,
          builder: (context) => HCM23Dialog(
            title: 'Thông báo',
            content: 'Bạn có muốn tạo task này không?',
            backgroundColor: Colors.amber.withOpacity(0.5),
            titleTextStyle: const TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
            contentTextStyle:
                const TextStyle(fontSize: 16, color: Colors.white),
            actions: [
              CleanDialogActionButtons(
                actionTitle: 'OK',
                onPressed: () {
                  EasyLoading.show();
                  Navigator.of(ctx)
                      .popUntil(ModalRoute.withName(TaskDetailsPage.routeName));
                  EasyLoading.dismiss();
                  homeCubit.addNewTask(state.newTask!);
                  Navigator.of(ctx).pop();
                },
              ),
              CleanDialogActionButtons(
                actionTitle: 'Cancel',
                textColor: const Color(0XFF27ae61),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              ),
            ],
          ),
        );
      } else {
        Navigator.of(ctx).pop();
      }
    } else if (state.task!.toJson() != originTaskString) {
      showDialog(
        context: ctx,
        builder: (context) => HCM23Dialog(
          title: 'Thông báo',
          content: 'Bạn có muốn thực hiện thay đổi không?',
          backgroundColor: Colors.amber.withOpacity(0.5),
          titleTextStyle: const TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          contentTextStyle: const TextStyle(fontSize: 16, color: Colors.white),
          actions: [
            CleanDialogActionButtons(
              actionTitle: 'OK',
              onPressed: () {
                Navigator.of(ctx)
                    .popUntil(ModalRoute.withName(TaskDetailsPage.routeName));
                homeCubit.editTask(state.task!);
                Navigator.of(ctx).pop();
              },
            ),
            CleanDialogActionButtons(
              actionTitle: 'Cancel',
              textColor: const Color(0XFF27ae61),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            ),
          ],
        ),
      );
    } else {
      Navigator.of(ctx).pop();
    }
  }

  void addNewTaskStage(String description) {
    final List<TaskStage> stages = [];
    stages.addAll(state.newTask?.taskStages ?? []);
    stages.add(TaskStage(
        id: const Uuid().v4(), description: description, isDone: false));
    emit(state.copyWith(newTask: state.newTask?.copyWith(taskStages: stages)));
  }

  void removeNewTaskStage(int index) {
    final List<TaskStage> stages = [];
    stages.addAll(state.newTask?.taskStages ?? []);

    stages.removeAt(index);
    final Task? newTask = state.newTask?.copyWith(taskStages: stages);
    emit(state.copyWith(newTask: newTask));
  }
}
