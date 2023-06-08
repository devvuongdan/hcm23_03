// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hcm23_03/features/tasks/entities/task_model.dart';

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
