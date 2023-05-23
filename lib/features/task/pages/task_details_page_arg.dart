// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hcm23_03/features/home/cubit/home_cubit.dart';

import '../entities/task.dart';

class TaskDetailsPageArg {
  final HomeCubit homeCubit;
  final Task? task;
  TaskDetailsPageArg({
    required this.homeCubit,
    this.task,
  });
}
