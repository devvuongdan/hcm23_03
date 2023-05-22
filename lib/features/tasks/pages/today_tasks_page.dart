// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../entities/task.dart';
import '../widgets/task_card.dart';

class TodayTasksPage extends StatefulWidget {
  final List<Task> tasks;

  const TodayTasksPage({
    Key? key,
    required this.tasks,
  }) : super(key: key);

  @override
  State<TodayTasksPage> createState() => _TodayRecordsPageState();
}

class _TodayRecordsPageState extends State<TodayTasksPage> {
  final List<Task> _hcm23Task = [
    Task(
        id: "1",
        title: "R2s",
        description: "Hoc Flutter 22/5",
        startTime: DateTime.now(),
        dueTime: DateTime.now().add(
          const Duration(hours: 3),
        ),
        teamMembers: const [],
        taskStages: [
          TaskStage(id: '1', isDone: false, description: 'Stage 1'),
          TaskStage(id: '2', isDone: true, description: 'Stage 2'),
          TaskStage(id: '3', isDone: false, description: 'Stage 3'),
        ]),
    Task(
        id: "2",
        title: "R2s2",
        description:
            "To discuss about the upcoming project & organization of figma files.",
        startTime: DateTime.now(),
        dueTime: DateTime.now().add(
          const Duration(hours: 3),
        ),
        teamMembers: const [],
        taskStages: [
          TaskStage(id: '1', isDone: false, description: 'Stage 1'),
          TaskStage(id: '2', isDone: true, description: 'Stage 2'),
          TaskStage(id: '3', isDone: false, description: 'Stage 3'),
        ]),
    Task(
        id: "3",
        title: "R2s3",
        description:
            "To discuss about the upcoming project & organization of figma files. 22/5",
        startTime: DateTime.now(),
        dueTime: DateTime.now().add(
          const Duration(hours: 3),
        ),
        teamMembers: const [],
        taskStages: [
          TaskStage(id: '1', isDone: false, description: 'Stage 1'),
          TaskStage(id: '2', isDone: true, description: 'Stage 2'),
          TaskStage(id: '3', isDone: false, description: 'Stage 3'),
        ]),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Today Task",
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        height: double.infinity,
        child: _hcm23Task.isNotEmpty
            ? ListView.separated(
                padding: const EdgeInsets.only(bottom: 20),
                itemBuilder: (context, index) {
                  final color =
                      Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                          .withOpacity(0.1);
                  return TaskCard(
                    key: UniqueKey(),
                    task: _hcm23Task[index],
                    color: color,
                    deleteTask: () {},
                    updateTask: ((task) {}),
                  );
                },
                separatorBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    height: 0.5,
                    width: double.infinity,
                    color: Colors.black.withOpacity(0.5),
                  );
                },
                itemCount: _hcm23Task.length,
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
