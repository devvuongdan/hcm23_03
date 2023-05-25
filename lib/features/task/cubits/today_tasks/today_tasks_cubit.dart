import 'package:flutter_bloc/flutter_bloc.dart';
// ignore_for_file: use_build_context_synchronously

import 'package:dartz/dartz.dart' hide Task;
import 'package:flutter/material.dart';

import '../../../../shared/shared_ui/dialogs/hcm23_dialog.dart';
import '../../data/entities/task.dart';
import '../../data/repo/tasks_repo.dart';

part 'today_tasks_state.dart';

class TodayTasksCubit extends Cubit<TodayTasksState> {
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  List<Task> todayTasks = [];
  TodayTasksCubit() : super(TodayTaskLoading());

  void getTask(BuildContext ctx) async {
    emit(TodayTaskLoading());
    final Either<String, List<Task>> data = await TasksRepo.getTasks(ctx);

    if (data is Right<String, List<Task>>) {
      await Future.delayed(const Duration(seconds: 2));
      todayTasks.clear();
      for (Task item in data.value) {
        todayTasks.add(item);
      }
    } else if (data is Left<String, List<Task>>) {
      showDialog(
        context: ctx,
        builder: (context) => HCM23Dialog(
          title: 'Error',
          content: data.value,
          backgroundColor: Colors.red.withOpacity(0.4),
          titleTextStyle: const TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          contentTextStyle: const TextStyle(fontSize: 16, color: Colors.white),
          actions: [
            CleanDialogActionButtons(
              actionTitle: 'OK',
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    }
    if (!isClosed) {
      emit(TodayTaskLoaded(todayTasks: todayTasks));
    }
  }

  void addNewTask(Task newTask) {
    // emit(state.copyWith(todayTasks: [
    //   ...state.todayTasks,
    //   ...[newTask]
    // ]));
  }

  void editTask(Task task) {
    // final int index =
    //     state.todayTasks.indexWhere((element) => element.id == task.id);

    // if (index != -1) {
    //   final List<Task> tasks = [];
    //   final List<Task> originTasks = state.todayTasks
    //     ..replaceRange(index, index + 1, [task]);
    //   tasks.addAll(originTasks);

    //   emit(state.copyWith(todayTasks: tasks));
    // }
  }

  void deleteTask(Task currentTask, BuildContext ctx) {}
}
