import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../entities/task_model.dart';

class TaskRepo {
  static const String baseUrl =
      "https://hcm23-03-dev-default-rtdb.asia-southeast1.firebasedatabase.app";
  static const String category = "tasks";
  static Future<Task?> getTask({
    String userId = "sdk53jUx82QqLdURqYw8R6mvhoe2",
    required String taskUid,
  }) async {
    try {
      final respone =
          await http.get(Uri.parse("$baseUrl/$category/$userId/$taskUid.json"));

      final Map<String, dynamic> taskMap =
          jsonDecode(respone.body) as Map<String, dynamic>;

      final Task taskObj = Task.fromMapToFullDetails(taskMap);
      return taskObj;
    } catch (e) {
      return null;
    }
  }

  static Future<List<Task>?> getTasksList({
    String userId = "sdk53jUx82QqLdURqYw8R6mvhoe2",
  }) async {
    try {
      final respone =
          await http.get(Uri.parse("$baseUrl/$category/$userId.json"));

      final Map<String, dynamic> originMap =
          jsonDecode(respone.body) as Map<String, dynamic>;
      final List<Map<String, dynamic>> tasksMap = originMap.values
          .map((e) => jsonDecode(jsonEncode(e)) as Map<String, dynamic>)
          .toList();
      final List<Task> taskList =
          tasksMap.map((e) => Task.fromMapToThumbnail(e)).toList();
      return taskList;
    } catch (e) {
      return null;
    }
  }

  // Bai tap ve nha
  static Future<bool> updateTask({
    String userId = "sdk53jUx82QqLdURqYw8R6mvhoe2",
    required String taskId,
    required Task updatedTask,
  }) async {
    final Map<String, dynamic> updatedTaskMap = updatedTask.toMap();
    final Response response = await http.put(
      Uri.parse(
        "$baseUrl/$category/$userId/${updatedTask.uid}.json",
      ),
      body: jsonEncode(updatedTaskMap),
    );
    return response.statusCode == 200;
  }

  static Future<Task> addNewTask({
    String userId = "sdk53jUx82QqLdURqYw8R6mvhoe2",
    required Task newTask,
  }) async {
    final Map<String, dynamic> map = newTask.toMap();
    final respone = await http.post(
      Uri.parse(
        "$baseUrl/$category/$userId.json",
      ),
      body: jsonEncode(map),
    );

    final Map<String, dynamic> resMap =
        jsonDecode(respone.body) as Map<String, dynamic>;
    //todo: Update tinh nang nay sau khi co cap nhat user
    final Task newTask2 = newTask.copyWith(
      uid: resMap['name'],
      userId: userId,
    );
    final Map<String, dynamic> newTaskMap = newTask2.toMap();
    await http.put(
      Uri.parse(
        "$baseUrl/$category/$userId/${resMap['name']}.json",
      ),
      body: jsonEncode(newTaskMap),
    );

    return newTask2;
  }

  static Future<bool> deleteTask({
    String userId = "sdk53jUx82QqLdURqYw8R6mvhoe2",
    required String taskId,
  }) async {
    final respone = await http.delete(
      Uri.parse(
        "$baseUrl/$category/$userId/$taskId.json",
      ),
    );
    return respone.statusCode == 200;
  }
}
