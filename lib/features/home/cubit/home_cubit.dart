import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hcm23_03/features/auth/cubit/auth_cubit.dart';
import 'package:hcm23_03/features/home/repo/tasks_repo.dart';

import '../../task/entities/task.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
      : super(const HomeState(
          currentPage: 1,
          tasks: [],
        ));
  final PageController pageController = PageController(initialPage: 1);

  void logout(BuildContext context) async {
    EasyLoading.show();
    await Future.delayed(const Duration(seconds: 1));
    // ignore: use_build_context_synchronously
    context.read<AuthCubit>().logout();
    EasyLoading.dismiss();
  }

  void changePage(int? idx) {
    pageController.animateToPage(idx ?? 0,
        duration: const Duration(milliseconds: 250), curve: Curves.linear);
    emit(state.copyWith(currentPage: idx));
  }

  void getTask() async {
    final List<Task> tasks = await TasksRepo.getTasks();
    emit(state.copyWith(tasks: tasks));
  }

  void addNewTask(Task newTask) {
    emit(state.copyWith(tasks: [
      ...state.tasks,
      ...[newTask]
    ]));
  }

  void editTask(Task task) {
    final int index =
        state.tasks.indexWhere((element) => element.id == task.id);

    if (index != -1) {
      final List<Task> tasks = [];
      final List<Task> originTasks = state.tasks
        ..replaceRange(index, index + 1, [task]);
      tasks.addAll(originTasks);

      emit(state.copyWith(tasks: tasks));
    }
  }
}
