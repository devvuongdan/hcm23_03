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
        _hcm23Task.add(taskModels[i]);
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

  final List<Task> _hcm23Task = [
    // Task(
    //   uid: taskUid,
    //   userId: "123",
    //   title: "title",
    //   description: "description",
    //   starttime: DateTime.now().toString(),
    //   duetime: DateTime.now().toString(),
    //   teamMembers: [
    //     TeamMember(
    //         taskUid: taskUid, uid: const Uuid().v4(), avatarUrl: "avatarUrl"),
    //     TeamMember(
    //         taskUid: taskUid, uid: const Uuid().v4(), avatarUrl: "avatarUrl"),
    //     TeamMember(
    //         taskUid: taskUid, uid: const Uuid().v4(), avatarUrl: "avatarUrl"),
    //     TeamMember(
    //         taskUid: taskUid, uid: const Uuid().v4(), avatarUrl: "avatarUrl"),
    //     TeamMember(
    //         taskUid: taskUid, uid: const Uuid().v4(), avatarUrl: "avatarUrl"),
    //   ],
    //   stages: [
    //     TaskStage(
    //       uid: const Uuid().v4(),
    //       taskUid: taskUid,
    //       isDone: true,
    //       stageName: "stageName",
    //     ),
    //     TaskStage(
    //       uid: const Uuid().v4(),
    //       taskUid: taskUid,
    //       isDone: true,
    //       stageName: "stageName",
    //     ),
    //     TaskStage(
    //       uid: const Uuid().v4(),
    //       taskUid: taskUid,
    //       isDone: true,
    //       stageName: "stageName",
    //     ),
    //   ],
    // ),
  ];
  // void addNewTask(BuildContext context) async {
  //   final result = await Navigator.push<Task?>(
  //       context, MaterialPageRoute(builder: (context) => const NewTaskPage()));
  //   setState(() {
  //     if (result != null) {
  //       _hcm23Task.add(result);
  //     }
  //   });
  // }

  void addNewTaskWithoutPop(Task newTask) {
    setState(() {
      _hcm23Task.add(newTask);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          // addNewTask(context);
          Navigator.of(context).pushNamed(
            NewTaskPage.routeName,
            arguments: addNewTaskWithoutPop,
          );
        }),
        backgroundColor: const Color(0xFFB7ABFD),
        child: const Icon(Icons.add),
      ),
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

  // List<List> taskCard = [
  //   [
  //     "8:30 AM",
  //     "Meeting with Client",
  //     "To discuss about the upcoming project & organization of figma files.",
  //     "08:30 AM - 09:30 AM"
  //   ],
  //   [
  //     "9:30 AM",
  //     "Lunch Break",
  //     "To discuss about the upcoming meeting.",
  //     "09:30 AM - 10:30 AM"
  //   ],
  //   [
  //     "10:30 AM",
  //     "Dailly Stand-Up",
  //     "A stand-up meeting is a meeting in which attendees typically participate while standing. The discomfort..",
  //     "10:30 AM - 11:30 AM"
  //   ]
  // ];

  // Widget _builTaskCard() {
  //   return ListView.separated(
  //     itemCount: taskCard.length,
  //     separatorBuilder: (context, index) {
  //       return Container(
  //         margin: const EdgeInsets.symmetric(vertical: 10),
  //         height: 0.5,
  //         width: double.infinity,
  //         color: Colors.black.withOpacity(0.5),
  //       );
  //     },
  //     itemBuilder: (context, index) {
  //       return Row(
  //         children: [
  //           Container(
  //             padding: EdgeInsets.symmetric(horizontal: 16),
  //             width: 80,
  //             child: Text(
  //               taskCard[index][0],
  //               textAlign: TextAlign.center,
  //               style: TextStyle(
  //                 fontSize: 14,
  //                 fontWeight: FontWeight.w500,
  //               ),
  //             ),
  //           ),
  //           Expanded(
  //             child: Container(
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(20),
  //                 color: Color.fromRGBO(182, 146, 246, 0.15),
  //               ),
  //               padding: const EdgeInsets.all(16),
  //               child: Column(
  //                 children: [
  //                   Align(
  //                     alignment: Alignment.centerLeft,
  //                     child: Text(
  //                       taskCard[index][1],
  //                       style: TextStyle(
  //                           fontWeight: FontWeight.w700,
  //                           fontSize: 16,
  //                           height: 20 / 16),
  //                     ),
  //                   ),
  //                   const SizedBox(
  //                     height: 8,
  //                   ),
  //                   Align(
  //                     alignment: Alignment.centerLeft,
  //                     child: Text(
  //                       taskCard[index][2],
  //                       style: TextStyle(
  //                           fontWeight: FontWeight.w400,
  //                           fontSize: 12,
  //                           height: 20 / 12),
  //                     ),
  //                   ),
  //                   const SizedBox(
  //                     height: 8,
  //                   ),
  //                   Align(
  //                     alignment: Alignment.centerLeft,
  //                     child: Text(
  //                       taskCard[index][3],
  //                       style: TextStyle(
  //                           fontWeight: FontWeight.w500,
  //                           fontSize: 13,
  //                           height: 20 / 13),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}
