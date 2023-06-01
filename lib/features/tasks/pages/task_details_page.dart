import 'package:flutter/material.dart';

import '../entities/task.dart';

class TaskDetailsPage extends StatelessWidget {
  final Task task;
  const TaskDetailsPage({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Task Details"),
        ),
        body: Center(
          child: Text("${task.description}"),
        ));
  }
}
