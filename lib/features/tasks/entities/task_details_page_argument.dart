// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'task.dart';

class TaskDetailsPageArgument {
  final Task? currentTask;
  final void Function(Task task)? addNewTask;
  final void Function(Task task)? updateTask;
  TaskDetailsPageArgument({
    this.currentTask,
    this.addNewTask,
    this.updateTask,
  });
}
