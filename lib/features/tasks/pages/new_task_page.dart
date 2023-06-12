import 'dart:math';

import 'package:hcm23_03/features/tasks/entities/task_model.dart';
import 'package:hcm23_03/shared/shared_ui/btn/btn_default/btn_default.dart';
// import 'package:date_time_picker/date_time_picker.dart';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import 'task_details_page.dart';

class NewTaskPage extends StatefulWidget {
  static const String routeName = "/NewTaskPage";
  const NewTaskPage({
    Key? key,
  }) : super(key: key);

  @override
  _NewTaskPageState createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  bool isEditing = false;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  late Task newTask;
  @override
  void initState() {
    super.initState();
    final String taskUid = const Uuid().v4();
    newTask = Task(
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
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void toggleEditMode() {
    setState(() {
      isEditing = !isEditing;
    });
  }

  void saveChanges() {
    setState(() {
      newTask.title = titleController.text;
      newTask.description = descriptionController.text;

      isEditing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task Details"),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: toggleEditMode,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Task Title',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                  height: 20 / 14,
                ),
              ),
              const SizedBox(height: 4),
              isEditing
                  ? TextField(
                      controller: titleController,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        height: 28 / 20,
                      ),
                    )
                  : Text(
                      newTask.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        height: 28 / 20,
                      ),
                    ),
              const SizedBox(height: 16),
              const Text(
                'Due Date',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                  height: 20 / 14,
                ),
              ),
              const SizedBox(height: 4),
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
                          fontSize: 16,
                        )),
                    const Spacer(),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.green[50],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Text(
                          'On Progress',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 18, 67, 21),
                            fontWeight: FontWeight.normal,
                          ),
                        )),
                  ]),
              const SizedBox(height: 16),
              const Text(
                'Description',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                  height: 20 / 14,
                ),
              ),
              const SizedBox(height: 4),
              isEditing
                  ? TextField(
                      controller: descriptionController,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        height: 20 / 14,
                      ),
                    )
                  : Text(
                      newTask.description,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        height: 20 / 14,
                      ),
                    ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  for (var i = 0; i < min(newTask.teamMembers.length, 3); i++)
                    Align(
                      widthFactor: 0.64,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 18,
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          padding: const EdgeInsets.all(5.0),
                          child: Image.network(
                            "https://github.com/identicons/guest.png",
                          ),
                        ),
                      ),
                    ),
                  if (newTask.teamMembers.length > 3)
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
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
              const SizedBox(height: 16),
              const Text('Stages of Task',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  )),
              Column(
                children: [
                  for (var i = 0; i < newTask.stages.length; i++)
                    CheckListRow(content: newTask.stages[i].stageName),
                ],
              ),
              // const Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: isEditing
                    ? BtnDefault(
                        onTap: saveChanges,
                        title: 'Save Changes',
                      )
                    : const SizedBox.shrink(),
              ),
              const SizedBox(height: 24),
            ]),
      ),
    );
  }
}
