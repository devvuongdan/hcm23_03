// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'task_cubit.dart';

enum TaskAction {
  creatingNew,
  edit,
  view,
}

class TaskState {
  final TaskAction action;
  final Task? task;
  final Task? newTask;

  const TaskState({
    required this.action,
    required this.task,
    this.newTask,
  });

  TaskState copyWith({
    TaskAction? action,
    Task? task,
    Task? newTask,
  }) {
    return TaskState(
      action: action ?? this.action,
      task: task ?? this.task,
      newTask: newTask ?? this.newTask,
    );
  }
}
