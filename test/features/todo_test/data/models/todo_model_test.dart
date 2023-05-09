import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:hcm23_03/features/todo/data/models/todo_model.dart';
import 'package:hcm23_03/features/todo/domain/entities/todo_entity.dart';

void main() {
  final DateTime now = DateTime.now();
  final tTodoModel = TodoModel(
    uuid: "uuid",
    title: "title",
    content: "content",
    isDone: false,
    startTime: now,
    dueTime: now,
    createdTime: now,
    updatedTime: now,
  );

  final tTodoEntity = TodoEntity(
    uuid: "uuid",
    title: "title",
    content: "content",
    isDone: false,
    startTime: now,
    dueTime: now,
  );
  group("Test Todo model", () {
    test("====== Should be a subclass of TodoEntity", () async {
      expect(tTodoModel, isA<TodoEntity>());
    });

    test("===== Test fromJson", () async {
      final Map<String, dynamic> jsonMap = tTodoModel.toMap();
      final result = TodoModel.fromMap(jsonMap);
      expect(result, equals(tTodoModel));
    });
    test("===== Test fromJson with jsonDecode", () async {
      final String jsonString = jsonEncode(tTodoModel.toMap());
      final result = TodoModel.fromMap(jsonDecode(jsonString));
      expect(result, equals(tTodoModel));
    });
    test("===== Test fromJson to Entity", () async {
      final String jsonString = jsonEncode(tTodoModel.toMap());
      final result = TodoModel.fromMap(jsonDecode(jsonString));
      final obj = result.toEntity(jsonDecode(jsonString));
      expect(obj, equals(tTodoEntity));
    });
    test("===== Test fromObject to Entity", () async {
      final String jsonString = jsonEncode(tTodoModel.toMap());
      final result = TodoModel.fromMap(jsonDecode(jsonString));
      final obj = result.toEntityFromModel();
      expect(obj, equals(tTodoEntity));
    });
  });
}
