// import 'dart:convert';

// import 'package:flutter/services.dart';

// import '../../task/entities/task.dart';

// class TasksRepo {
//   static Future<List<Task>> getTasks() async {
//     String jsonContent = await rootBundle.loadString('assets/jsons/tasks.json');
//     final List jsons = jsonDecode(jsonContent) as List;
//     List<Task> tasks = [];
//     for (dynamic item in jsons) {
//       final String itemToJson = jsonEncode(item);
//       final Map<String, dynamic> itemMap = jsonDecode(itemToJson);
//       final Task task = Task.fromMap(itemMap);
//       tasks.add(task);
//     }
//     tasks.sort((a, b) => (a.startTime ?? DateTime.now())
//         .compareTo(b.startTime ?? DateTime.now()));

//     return tasks;
//   }
// }
