import 'dart:convert';

import 'package:http/http.dart' as http;

import '../entities/task_model.dart';

class TaskRepo {
  static const String baseUrl =
      "https://hcm23-03-dev-default-rtdb.asia-southeast1.firebasedatabase.app";
  static const String repository = "tasks";

  static Future<Task?> getTask({
    required String userId,
    required String taskUid,
  }) async {
    try {
      final respone = await http
          .get(Uri.parse("$baseUrl/$repository/$userId/$taskUid.json"));

      final Map<String, dynamic> taskMap =
          jsonDecode(respone.body) as Map<String, dynamic>;
      final Task taskObj = Task.fromMap(taskMap);
      return taskObj;
    } catch (e) {
      return null;
    }
  }

  static Future<List<Task>?> getTasksList({
    required String userId,
  }) async {
    try {
      final respone =
          await http.get(Uri.parse("$baseUrl/$repository/$userId.json"));

      final Map<String, dynamic> originMap =
          jsonDecode(respone.body) as Map<String, dynamic>;
      final List<Map<String, dynamic>> tasksMap = originMap.values
          .map((e) => jsonDecode(jsonEncode(e)) as Map<String, dynamic>)
          .toList();
      final List<Task> taskList = tasksMap.map((e) => Task.fromMap(e)).toList();
      return taskList;
    } catch (e) {
      print(e);
      return null;
    }
  }

  // Bai tap ve nha
  static Future<bool> updateTask({
    required String userId,
    required String taskId,
    required Task updatedTask,
  }) async {
    throw UnimplementedError();
  }

  static Future<bool> addNewTask({
    required String userId,
    required String taskId,
    required Task updatedTask,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/$repository/$userId.json'),
        body: jsonEncode(updatedTask.toMap()),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        // Handle error response
        print('Add new task failed');
        print('Status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      // Handle error
      print(e);
      return false;
    }
    throw UnimplementedError();
  }

  static Future<bool> deleteTaskTask({
    required String userId,
    required String taskId,
  }) async {
    try {
      final response = await http
          .delete(Uri.parse('$baseUrl/$repository/$userId/$taskId.json'));

      if (response.statusCode == 200) {
        return true;
      } else {
        // Handle error response
        print('Delete failed');
        print('Status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      // Handle error
      print(e);
      return false;
    }
    throw UnimplementedError();
  }
}
