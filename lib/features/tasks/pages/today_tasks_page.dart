// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:hcm23_03/features/tasks/entities/task_model.dart';
import 'package:uuid/uuid.dart';

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

final String taskUid = const Uuid().v4();

class _TodayRecordsPageState extends State<TodayTasksPage> {
  final List<Task> _hcm23Task = [
    Task(
      uid: taskUid,
      userId: "123",
      title: "title",
      description: "description",
      starttime: DateTime.now().toString(),
      duetime: DateTime.now().toString(),
      teamMembers: [
        TeamMember(
            taskUid: taskUid, uid: const Uuid().v4(), avatarUrl: "avatarUrl"),
        TeamMember(
            taskUid: taskUid, uid: const Uuid().v4(), avatarUrl: "avatarUrl"),
        TeamMember(
            taskUid: taskUid, uid: const Uuid().v4(), avatarUrl: "avatarUrl"),
        TeamMember(
            taskUid: taskUid, uid: const Uuid().v4(), avatarUrl: "avatarUrl"),
        TeamMember(
            taskUid: taskUid, uid: const Uuid().v4(), avatarUrl: "avatarUrl"),
      ],
      stages: [
        TaskStage(
          uid: const Uuid().v4(),
          taskUid: taskUid,
          isDone: true,
          stageName: "stageName",
        ),
        TaskStage(
          uid: const Uuid().v4(),
          taskUid: taskUid,
          isDone: true,
          stageName: "stageName",
        ),
        TaskStage(
          uid: const Uuid().v4(),
          taskUid: taskUid,
          isDone: true,
          stageName: "stageName",
        ),
      ],
    ),
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
          child: ListView.separated(
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
          )),
    );
  }
}
