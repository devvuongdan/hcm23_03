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
        child: widget.tasks.isNotEmpty
            ? ListView.separated(
                padding: const EdgeInsets.only(bottom: 20),
                itemBuilder: (context, index) {
                  final color =
                      Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                          .withOpacity(0.1);
                  return TaskCard(
                    key: UniqueKey(),
                    task: widget.tasks[index],
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
                itemCount: widget.tasks.length,
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
