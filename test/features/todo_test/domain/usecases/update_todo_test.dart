// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hcm23_03/features/todo/domain/usecases/update_todo.dart';
import 'package:mockito/mockito.dart';

import 'package:hcm23_03/features/todo/domain/entities/todo_entity.dart';
import 'package:hcm23_03/features/todo/domain/repositories/todo_repo.dart';

class MockTodoRepo extends Mock implements TodoRepo {}

void main() {
  final MockTodoRepo mockRepo = MockTodoRepo();
  final UpdateTodo usecase = UpdateTodo(repo: mockRepo);

  test("\n =========== Should return TodoEntity when update newTodo success",
      () async {
    final TodoEntity newTodo = TodoEntity(
      title: "Title",
      content: "Content",
      isDone: false,
      startTime: DateTime.now(),
      dueTime: DateTime.now().add(
        const Duration(hours: 1),
      ),
    );

    when(mockRepo.updateTodo(newTodo))
        .thenAnswer((_) async => const Right(true));

    final result = await usecase.call(params: newTodo);

    expect(result, const Right(true));
    verify(mockRepo.updateTodo(newTodo));
  });
}
