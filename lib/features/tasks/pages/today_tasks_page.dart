// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math' as math;
import 'package:hcm23_03/features/tasks/repositories/tasks_repo.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:hcm23_03/features/tasks/entities/task_model.dart';
import 'package:hcm23_03/features/tasks/pages/new_task_page.dart';

import 'package:hcm23_03/features/tasks/widgets/task_card.dart';

class TodayTasksPage extends StatefulWidget {
  // final List<Task> tasks;
  final String userId;

  const TodayTasksPage({
    Key? key,
    required this.userId,
  }) : super(key: key);

  @override
  State<TodayTasksPage> createState() => _TodayRecordsPageState();
}

class _TodayRecordsPageState extends State<TodayTasksPage> {
  @override
  void initState() {
    super.initState();
    getTasksList();
  }

  bool isError = false;

  Future<http.Response?> getTasksList() async {
    final List<Task>? tasks = await TaskRepo.getTasksList();

    if (tasks != null) {
      setState(() {
        _tasks.addAll(tasks);
        isError = false;
      });
    } else {
      setState(() {
        isError = true;
      });
    }
    return null;
  }

  final List<Task> _tasks = [];

  void createNewTask() async {
    await Navigator.of(context).pushNamed(
      NewTaskPage.routeName,
      arguments: NewTaskPageArg(
        userId: widget.userId,
        onAddNewTask: addNewTaskSuccess,
      ),
    );
  }

  void addNewTaskSuccess(Task task) async {
    final Task newTask = await TaskRepo.addNewTask(newTask: task);
    setState(() {
      _tasks.add(newTask);
    });
  }

  void deleteTask(String taskUid) async {
    final bool result = await TaskRepo.deleteTask(taskId: taskUid);
    if (result) {
      setState(() {
        final int index =
            _tasks.indexWhere((element) => element.uid == taskUid);

        _tasks.removeAt(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: const Color(0xFFB7ABFD),
        child: const Icon(Icons.add),
      ),
      body: Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          height: 50,
          child: _tasks.isEmpty
              ? Center(
                  child: !isError
                      ? const CircularProgressIndicator()
                      : const Text("Khong co du lieu"))
              : ListView.separated(
                  padding: const EdgeInsets.only(bottom: 20),
                  itemBuilder: (context, index) {
                    final color =
                        Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                            .withOpacity(0.1);
                    return TaskCard(
                      key: UniqueKey(),
                      task: _tasks[index],
                      color: color,
                      deleteTask: deleteTask,
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
                  itemCount: _tasks.length,
                )),
    );
  }
}
