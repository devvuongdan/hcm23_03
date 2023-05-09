import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hcm23_03/core/errors/failures.dart';
import 'package:hcm23_03/core/exceptions/exceptions.dart';
import 'package:hcm23_03/features/todo/data/datasources/todo_local_data_source.dart';
import 'package:hcm23_03/features/todo/data/models/todo_model.dart';
import 'package:hcm23_03/features/todo/domain/entities/todo_entity.dart';
import 'package:hcm23_03/features/todo/domain/repositories/todo_repo_impl.dart';
import 'package:mockito/mockito.dart';

class MockLocalDataSource extends Mock implements TodoLocalDataSource {}

void main() {
  MockLocalDataSource mockLocalDataSource = MockLocalDataSource();
  TodoRepoImpl repo = TodoRepoImpl(
    localDataSource: mockLocalDataSource,
  );

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

  group("Test getListTodo (only from Local in this phase)", () {
    test("Should return List<TodoModel> when call success", () async {
      when(mockLocalDataSource.getListTodo())
          .thenAnswer((_) async => [tTodoModel]);

      final result = await repo.getTodoList();

      verify(mockLocalDataSource.getListTodo());

      expect(result, isA<Right<Failure, List<TodoEntity>>>());
    });

    test("Should return CacheFailure when exception", () async {
      when(mockLocalDataSource.getListTodo())
          .thenThrow((_) async => Left(CacheException()));

      final result = await repo.getTodoList();

      verify(mockLocalDataSource.getListTodo());

      expect(result, equals(Left(CacheFailure())));
    });
  });

  group("Test saveNewTodo (only from Local in this phase)", () {
    test("Should return true when call success", () async {
      when(mockLocalDataSource.saveNewTodo(any)).thenAnswer((_) async => true);

      final result = await repo.saveNewTodo(tTodoEntity);

      verify(mockLocalDataSource.saveNewTodo(any));

      expect(result, const Right(true));
    });

    test("Should return CacheFailure when exception", () async {
      when(mockLocalDataSource.saveNewTodo(any))
          .thenThrow((_) async => Left(CacheException()));

      final result = await repo.saveNewTodo(tTodoEntity);

      verify(mockLocalDataSource.saveNewTodo(any));

      expect(result, equals(Left(CacheFailure())));
    });
  });

  group("Test updateTodo (only from Local in this phase)", () {
    test("Should return true when call success", () async {
      when(mockLocalDataSource.updateTodo(any)).thenAnswer((_) async => true);

      final result = await repo.updateTodo(tTodoEntity);

      verify(mockLocalDataSource.updateTodo(any));

      expect(result, const Right(true));
    });

    test("Should return CacheFailure when exception", () async {
      when(mockLocalDataSource.updateTodo(any))
          .thenThrow((_) async => Left(CacheException()));

      final result = await repo.updateTodo(tTodoEntity);

      verify(mockLocalDataSource.updateTodo(any));

      expect(result, equals(Left(CacheFailure())));
    });
  });
}
