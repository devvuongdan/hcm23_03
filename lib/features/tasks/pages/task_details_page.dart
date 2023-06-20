// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_import
// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import 'package:intl/intl.dart';

import 'package:hcm23_03/shared/shared_ui/btn/btn_default/btn_default.dart';

import '../entities/task_model.dart';
import 'package:flutter/material.dart';

import '../widgets/task_stage_view.dart';

String formatDueTime(String duetime) {
  DateTime dueDateTime = DateTime.parse(duetime);
  String formattedDueTime =
      DateFormat('hh:mm a, dd MMM yyyy').format(dueDateTime);
  return formattedDueTime;
}

class TaskDetailsPage extends StatefulWidget {
  final Task task;

  const TaskDetailsPage({Key? key, required this.task}) : super(key: key);

  @override
  _TaskDetailsPageState createState() => _TaskDetailsPageState();
}

class _TaskDetailsPageState extends State<TaskDetailsPage> {
  bool isEditing = false;
  late TextEditingController titleController;
  late TextEditingController descriptionController;

  Task? currentTask;

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

  @override
  void initState() {
    super.initState();

    getTask();
    // deleteTask();
  }

  // Future<http.Response?> getTask(
  //     {String taskUid = "69196993-7832-4af4-947f-a445c30ef651"}) async {
  //   final respone = await http.get(Uri.parse(
  //       "https://hcm23-03-dev-default-rtdb.asia-southeast1.firebasedatabase.app/tasks/sdk53jUx82QqLdURqYw8R6mvhoe2/$taskUid.json"));
  //   print("RESPONSE");
  //   print("${respone.body}");
  //   return respone;
  // }

  bool isError = false;
  Future<http.Response?> getTask(
      {String taskUid = "69196993-7832-4af4-947f-a445c30ef651"}) async {
    // Fetch Data
    try {
      final respone = await http.get(Uri.parse(
          "https://hcm23-03-dev-default-rtdb.asia-southeast1.firebasedatabase.app/tasks/sdk53jUx82QqLdURqYw8R6mvhoe2/$taskUid.json"));
      // Convert data => Map<String, dynamic>
      final Map<String, dynamic> taskMap =
          jsonDecode(respone.body) as Map<String, dynamic>;

      // Convert data to Model
      final Task taskObj = Task.fromMap(taskMap);
      setState(() {
        isError = false;
        currentTask = taskObj;
        titleController = TextEditingController(text: currentTask!.title);
        descriptionController =
            TextEditingController(text: currentTask!.description);
      });
      return respone;
    } catch (e) {
      print(e);
      setState(() {
        isError = true;
      });
      return null;
    }
  }

  // Future<http.Response?> updateTask() async {
  //   final uri = Uri.parse(
  //       "https://hcm23-03-dev-default-rtdb.asia-southeast1.firebasedatabase.app/tasks/sdk53jUx82QqLdURqYw8R6mvhoe2/69196993-7832-4af4-947f-a445c30ef651.json");

  //   final response = await http.put(uri);
  //   // ignore: unused_local_variable
  //   Map<String, dynamic> req = {
  //     'uid': "uid".toString(),
  //     'userId': "userId".toString(),
  //     'title': "title".toString(),
  //     'description': "description".toString(),
  //     'starttime': "starttime".toString(),
  //   };

  //   if (response.statusCode == 200) {
  //     return json.decode(response.body);

     
  //   } else {
  //     throw Exception('Failed to load ');
  //     // print('Failed to delete task: ${response.body}');
  //   }
  // }
  // Future<http.Response?> getTask(
  //     {String taskUid = "69196993-7832-4af4-947f-a445c30ef651"}) async {
  //   //Fetch data

  //   final respone = await http.get(Uri.parse(
  //       "https://hcm23-03-dev-default-rtdb.asia-southeast1.firebasedatabase.app/tasks/sdk53jUx82QqLdURqYw8R6mvhoe2/$taskUid.json"));
  //   //Convert data => Map<String,dynamic>
  //   final Map<String, dynamic> taskMap =
  //       jsonDecode(respone.body) as Map<String, dynamic>;
  //   //Convert data to Model
  //   final Task taskObj = Task.fromMap(taskMap);
  //   print(taskObj.toString());
  //   return respone;

  // print("RESPONSE");

  // print("${respone.body}");
  // return respone;

  // Future<http.Response?> deleteTask({String taskUid = "69196993-7832-4af4-947f-a445c30ef651"})async{

  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task Details"),
        // actions: [
      ),
      body: currentTask == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
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
                      // isEditing
                      //     ? TextField(
                      //         controller: titleController,
                      //         style: const TextStyle(
                      //           fontSize: 20,
                      //           fontWeight: FontWeight.w600,
                      //           color: Color(0xFF1D2939),
                      //           height: 30 / 20,
                      //         ),
                      //       )
                      //     :
                      Text(
                        currentTask!.title,
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
                            Text(formatDueTime(currentTask!.duetime),
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
                      // isEditing
                      //     ? TextField(
                      //         controller: descriptionController,
                      //         style: const TextStyle(
                      //           fontSize: 16,
                      //           fontWeight: FontWeight.w500,
                      //           height: 20 / 14,
                      //         ),
                      //       )
                      //     :
                      Text(
                        currentTask!.description,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 20 / 14,
                        ),
                      ),
                      const SizedBox(height: 15),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   crossAxisAlignment: CrossAxisAlignment.center,
                      //   children: [
                      //     SizedBox(
                      //       height: 40,
                      //       width: 80,
                      //       child: Stack(
                      //         alignment: Alignment.centerLeft,
                      //         children: [
                      //           for (var i = 0;
                      //               i < min(currentTask!.teamMembers.length, 3);
                      //               i++)
                      //             Positioned(
                      //               left: (i * 22),
                      //               top: 0,
                      //               child: CircleAvatar(
                      //                 backgroundColor: Colors.white,
                      //                 radius: 16,
                      //                 child: Container(
                      //                   clipBehavior: Clip.antiAlias,
                      //                   decoration: BoxDecoration(
                      //                     border: Border.all(
                      //                         color: Colors.white, width: 2),
                      //                     borderRadius: BorderRadius.circular(50),
                      //                   ),
                      //                   child: Image.asset(
                      //                     currentTask!.teamMembers[i].avatarUrl,
                      //                   ),
                      //                 ),
                      //               ),
                      //             ),
                      //         ],
                      //       ),
                      //     ),
                      // if (currentTask!.teamMembers.length > 3)
                      //   Flexible(
                      //     child: Padding(
                      //       padding: const EdgeInsets.only(bottom: 6),
                      //       child: Text(
                      //         "+${currentTask!.teamMembers.length - 3}",
                      //         style: const TextStyle(
                      //           color: Colors.black,
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      //   ],
                      // ),
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
                          for (var i = 0; i < currentTask!.stages.length; i++)
                            CheckListRow(
                                onChangeStatus: (p0) {},
                                stage: currentTask!.stages[i]),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: BtnDefault(
                            onTap: () {
                              // updateTask();
                            },
                            title: 'Edit task',
                          )),
                    ]),
              ),
            ),
    );
  }
}
