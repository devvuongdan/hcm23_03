// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hcm23_03/features/todo/domain/entities/todo_entity.dart';
import 'package:hcm23_03/features/todo/domain/usecases/get_todo_list.dart';
import 'package:mockito/mockito.dart';

import 'package:hcm23_03/features/todo/domain/repositories/todo_repo.dart';

class MockTodoRepo extends Mock implements TodoRepo {}

void main() {
  final MockTodoRepo mockRepo = MockTodoRepo();
  final GetTodoList usecase = GetTodoList(repo: mockRepo);

  test(
      "\n =========== Should return List<TodoEntity> when calling success => Passed",
      () async {
    final List<TodoEntity> todoList = [
      TodoEntity(
        title: "Title",
        content: "Content",
        isDone: false,
        startTime: DateTime.now(),
        dueTime: DateTime.now().add(
          const Duration(hours: 1),
        ),
        children: const [],
      ),
    ];

    when(mockRepo.getTodoList()).thenAnswer((_) async => Right(todoList));

    final result = await usecase.call(parram: NoParam());

    expect(result, Right(todoList));
    verify(mockRepo.getTodoList());
  });
}
