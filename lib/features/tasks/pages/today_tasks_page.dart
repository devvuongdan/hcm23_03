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
  // final List<Task> _hcm23Task = [
  //   Task(
  //       id: "1",
  //       title: "R2s",
  //       description: "Hoc Flutter 22/5",
  //       startTime: DateTime.now(),
  //       dueTime: DateTime.now().add(
  //         const Duration(hours: 3),
  //       ),
  //       teamMembers: const [],
  //       taskStages: [
  //         TaskStage(id: '1', isDone: false, description: 'Stage 1'),
  //         TaskStage(id: '2', isDone: true, description: 'Stage 2'),
  //         TaskStage(id: '3', isDone: false, description: 'Stage 3'),
  //       ]),
  //   Task(
  //       id: "2",
  //       title: "R2s2",
  //       description:
  //           "To discuss about the upcoming project & organization of figma files.",
  //       startTime: DateTime.now(),
  //       dueTime: DateTime.now().add(
  //         const Duration(hours: 3),
  //       ),
  //       teamMembers: const [],
  //       taskStages: [
  //         TaskStage(id: '1', isDone: false, description: 'Stage 1'),
  //         TaskStage(id: '2', isDone: true, description: 'Stage 2'),
  //         TaskStage(id: '3', isDone: false, description: 'Stage 3'),
  //       ]),
  //   Task(
  //       id: "3",
  //       title: "R2s3",
  //       description:
  //           "To discuss about the upcoming project & organization of figma files. 22/5",
  //       startTime: DateTime.now(),
  //       dueTime: DateTime.now().add(
  //         const Duration(hours: 3),
  //       ),
  //       teamMembers: const [],
  //       taskStages: [
  //         TaskStage(id: '1', isDone: false, description: 'Stage 1'),
  //         TaskStage(id: '2', isDone: true, description: 'Stage 2'),
  //         TaskStage(id: '3', isDone: false, description: 'Stage 3'),
  //       ]),
  // ];
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text(
  //         "Today Task",
  //       ),
  //     ),
  //     body: Container(
  //       padding: const EdgeInsets.all(16),
  //       width: double.infinity,
  //       height: double.infinity,
  //       child: _hcm23Task.isNotEmpty
  //           ? ListView.separated(
  //               padding: const EdgeInsets.only(bottom: 20),
  //               itemBuilder: (context, index) {
  //                 final color =
  //                     Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
  //                         .withOpacity(0.1);
  //                 return TaskCard(
  //                   key: UniqueKey(),
  //                   task: _hcm23Task[index],
  //                   color: color,
  //                   deleteTask: () {},
  //                   updateTask: ((task) {}),
  //                 );
  //               },
  //               separatorBuilder: (context, index) {
  //                 return Container(
  //                   margin: const EdgeInsets.symmetric(vertical: 8),
  //                   height: 0.5,
  //                   width: double.infinity,
  //                   color: Colors.black.withOpacity(0.5),
  //                 );
  //               },
  //               itemCount: _hcm23Task.length,
  //             )
  //           : const Center(
  //               child: CircularProgressIndicator(),
  //             ),
  //     ),
  //   );
  // }

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
        child: Column(
          children: [
            Expanded(
              child: _builTaskCard(),
            )
          ],
        ),
      ),
    );
  }

  List<List> taskCard = [
    [
      "8:30 AM",
      "Meeting with Client",
      "To discuss about the upcoming project & organization of figma files.",
      "08:30 AM - 09:30 AM"
    ],
    [
      "9:30 AM",
      "Lunch Break",
      "To discuss about the upcoming meeting.",
      "09:30 AM - 10:30 AM"
    ],
    [
      "10:30 AM",
      "Dailly Stand-Up",
      "A stand-up meeting is a meeting in which attendees typically participate while standing. The discomfort..",
      "10:30 AM - 11:30 AM"
    ]
  ];

  Widget _builTaskCard() {
    return ListView.separated(
      itemCount: taskCard.length,
      separatorBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          height: 0.5,
          width: double.infinity,
          color: Colors.black.withOpacity(0.5),
        );
      },
      itemBuilder: (context, index) {
        return Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              width: 80,
              child: Text(
                taskCard[index][0],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromRGBO(182, 146, 246, 0.15),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        taskCard[index][1],
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            height: 20 / 16),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        taskCard[index][2],
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            height: 20 / 12),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        taskCard[index][3],
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            height: 20 / 13),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
