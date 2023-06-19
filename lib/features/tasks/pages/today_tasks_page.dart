// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:hcm23_03/features/tasks/entities/task_model.dart';
import 'package:hcm23_03/features/tasks/pages/new_task_page.dart';
import 'package:uuid/uuid.dart';

import 'package:hcm23_03/features/tasks/widgets/task_card.dart';

import '../../authentication/data/resource/sqlite_helper.dart';

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

final String taskUid = const Uuid().v4();

class _TodayRecordsPageState extends State<TodayTasksPage> {
  Future<void> queryTask({required String userId}) async {
    // print("queryTask");
    final List<Map<String, dynamic>> tasks =
        await Hcm23DBHelper.query(Task.dbTable);
    final List<Map<String, dynamic>> taskOfUser = tasks.where((element) {
      return element['userId'] == widget.userId;
    }).toList();
    // print(taskOfUser);
    final List<Task> taskModels =
        taskOfUser.map((e) => Task.fromMap(e)).toList();
    for (int i = 0; i < taskOfUser.length; i++) {
      final List<TaskStage> taskStage =
          await queryStage(taskId: taskModels[i].uid);
      taskModels[i].stages = taskStage;
      final List<TeamMember> teammember =
          await queryTeammember(taskId: taskModels[i].uid);
      taskModels[i].teamMembers = teammember;
      setState(() {
        _tasks.add(taskModels[i]);
      });
    }

    // for (int i = 0; i < taskOfUser.length; i++) {
    //   final List<TeamMember> teammember =
    //       await queryTeammember(taskId: taskModels[i].uid);
    //   taskModels[i].teamMembers = teammember;
    //   setState(() {
    //     _hcm23Task.add(taskModels[i]);
    //   });
    // }
  }

  Future<List<TaskStage>> queryStage({
    required String taskId,
  }) async {
    final List<Map<String, dynamic>> stages =
        await Hcm23DBHelper.query(TaskStage.dbTable);
    final List<Map<String, dynamic>> stageOfTask = stages.where((element) {
      return element['taskUid'] == taskId;
    }).toList();
    final List<TaskStage> stageModels =
        stageOfTask.map((e) => TaskStage.fromMap(e)).toList();

    return stageModels;
  }

  Future<List<TeamMember>> queryTeammember({
    required String taskId,
  }) async {
    final List<Map<String, dynamic>> teammember =
        await Hcm23DBHelper.query(TeamMember.dbTable);
    final List<Map<String, dynamic>> listTeammember =
        teammember.where((element) {
      return element['taskUid'] == taskId;
    }).toList();
    final List<TeamMember> teammembers =
        listTeammember.map((e) => TeamMember.fromMap(e)).toList();

    return teammembers;
  }

  void getTasks({required String userId}) async {
    await queryTask(userId: userId);
  }

  @override
  void initState() {
    super.initState();

    getTasks(userId: widget.userId);
  }

  final List<Task> _tasks = [];

  void createNewTask() async {
    Navigator.of(context).pushNamed(
      NewTaskPage.routeName,
      arguments: NewTaskPageArg(
        userId: widget.userId,
        onAddNewTask: addNewTaskSuccess,
      ),
    );
  }

  void addNewTaskSuccess(Task task) {
    setState(() {
      _tasks.add(task);
    });
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
          height: double.infinity,
          child: ListView.separated(
            padding: const EdgeInsets.only(bottom: 20),
            itemBuilder: (context, index) {
              final color =
                  Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                      .withOpacity(0.1);
              return TaskCard(
                key: UniqueKey(),
                task: _tasks[index],
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
            itemCount: _tasks.length,
          )),
    );
  }
}
