// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hcm23_03/features/todo/domain/usecases/save_new_todo.dart';
import 'package:mockito/mockito.dart';

import 'package:hcm23_03/features/todo/domain/entities/todo_entity.dart';
import 'package:hcm23_03/features/todo/domain/repositories/todo_repo.dart';

class MockTodoRepo extends Mock implements TodoRepo {}

void main() {
  final MockTodoRepo mockRepo = MockTodoRepo();
  final SaveNewTodo usecase = SaveNewTodo(repo: mockRepo);

  test("\n =========== Should return true when saving newTodo success",
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

    when(mockRepo.saveNewTodo(any)).thenAnswer((_) async => const Right(true));

    final result = await usecase.call(parram: newTodo);

    expect(result, const Right(true));
    verify(mockRepo.saveNewTodo(newTodo));
  });
}
