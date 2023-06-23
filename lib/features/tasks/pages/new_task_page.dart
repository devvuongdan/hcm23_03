// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:hcm23_03/features/tasks/entities/task_model.dart';
import 'package:hcm23_03/features/tasks/pages/today_tasks_page.dart';
import 'package:hcm23_03/features/tasks/widgets/task_stage_input.dart';
import 'package:hcm23_03/shared/shared_ui/btn/btn_default/btn_default.dart';
import 'package:uuid/uuid.dart';

import 'task_details_page.dart';

class NewTaskPageArg {
  final String userId;
  final void Function(Task) onAddNewTask;
  NewTaskPageArg({
    required this.userId,
    required this.onAddNewTask,
  });
}

class NewTaskPage extends StatefulWidget {
  static const String routeName = "/NewTaskPage";
  final NewTaskPageArg arg;

  const NewTaskPage({
    Key? key,
    required this.arg,
  }) : super(key: key);

  @override
  _NewTaskPageState createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  late Task newTask;
  @override
  void initState() {
    super.initState();
    newTask = Task(
      uid: taskUid,
      userId: widget.arg.userId,
      title: "",
      description: "",
      starttime: DateTime.now().toString(),
      duetime: DateTime.now().toString(),
      teamMembers: [],
      stages: [],
    );
    titleController.addListener(() {
      setState(() {
        newTask.title = titleController.text;
      });
    });
    descriptionController.addListener(() {
      newTask.description = descriptionController.text;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
  Future<http.Response?> createTask() async {
   
    final uri = Uri.parse(
        "https://hcm23-03-dev-default-rtdb.asia-southeast1.firebasedatabase.app/tasks/sdk53jUx82QqLdURqYw8R6mvhoe2/$taskUid.json");

    final response = await http.post(uri, body: jsonEncode(Task.dbTable));

    if (response.statusCode == 200) {
      print('Task created successfully.');
      // Remove the task from the list

      return null;
      // Update the UI
    } else {
      throw Exception('Failed to created task: ${response.body}');
      // print('Failed to delete task: ${response.body}');
    }
  }

  // void createNewTask(BuildContext context) {
  //   newTask.title = titleController.text;
  //   newTask.description = descriptionController.text;
  //   Navigator.pop(context, newTask);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Task"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Task Title',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF5D6B98),
                  height: 20 / 14,
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                    hintText: "Enter title...",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    )),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1D2939),
                  height: 30 / 20,
                ),
              ),
              const SizedBox(height: 21),
              const Text(
                'Due Date',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF5D6B98),
                  height: 20 / 14,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.access_time,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 8),
                    Text(formatDueTime(newTask.duetime),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          height: 18 / 14,
                          color: Color(0xFF111322),
                        )),
                    const Spacer(),
                    Container(
                        height: 34,
                        width: 95,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(3, 152, 85, 0.1),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Text(
                          'On Progress',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF039855),
                            fontWeight: FontWeight.w500,
                            height: 18 / 12,
                          ),
                        )),
                  ]),
              const SizedBox(height: 27),
              const Text(
                'Description',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF5D6B98),
                  height: 20 / 14,
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                    hintText: "Enter description...",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    )),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  height: 20 / 14,
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                    width: 80,
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        for (var i = 0;
                            i < min(newTask.teamMembers.length, 3);
                            i++)
                          Positioned(
                            left: (i * 22),
                            top: 0,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 16,
                              child: Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Image.asset(
                                  newTask.teamMembers[i].avatarUrl,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  if (newTask.teamMembers.length > 3)
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Text(
                          "+${newTask.teamMembers.length - 3}",
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 28),
              const Text('Stages of Task',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  )),
              const SizedBox(
                height: 12,
              ),
              Column(
                children: [
                  for (var i = 0; i < newTask.stages.length; i++)
                    TaskStageInput(
                      onRemove: () {
                        setState(() {
                          newTask.stages.removeWhere((element) =>
                              element.uid == newTask.stages[i].uid);
                        });
                      },
                      onChecked: (value) {
                        setState(() {
                          newTask.stages
                              .firstWhere((element) =>
                                  element.uid == newTask.stages[i].uid)
                              .stageName = value;
                        });
                      },
                    ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: BtnDefault(
                      type: BtnDefaultType.secondary,
                      title: "+",
                      onTap: () {
                        setState(() {
                          final TaskStage newStage = TaskStage(
                              taskUid: newTask.uid,
                              isDone: false,
                              stageName: "",
                              uid: const Uuid().v4());
                          newTask.stages.add(newStage);
                        });
                      },
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              BtnDefault(
                onTap: (() {
                  widget.arg.onAddNewTask.call(newTask);
                  Navigator.of(context).pop();
                  createTask();
                }),
                title: 'Create Task',
              )
            ],
          ),
        ),
      ),
    );
  }
}
