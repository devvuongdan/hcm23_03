// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:hcm23_03/core/errors/failures.dart';
import 'package:hcm23_03/features/todo/data/datasources/todo_local_data_source.dart';
import 'package:hcm23_03/features/todo/data/models/todo_model.dart';
import 'package:hcm23_03/features/todo/domain/entities/todo_entity.dart';
import 'package:hcm23_03/features/todo/domain/repositories/todo_repo.dart';

class TodoRepoImpl implements TodoRepo {
  final TodoLocalDataSource localDataSource;
  TodoRepoImpl({
    required this.localDataSource,
  });
  @override
  Future<Either<Failure, List<TodoEntity>>>? getTodoList() async {
    try {
      final List<TodoModel> todoModels =
          await localDataSource.getListTodo() ?? [];
      final List<TodoEntity> todoEntities =
          todoModels.map((e) => e.toEntityFromModel()).toList();
      return Right(todoEntities);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, bool>>? saveNewTodo(TodoEntity? todo) async {
    try {
      final TodoModel todoModel = TodoModel(
        uuid: todo?.uuid ?? "",
        title: todo?.title ?? "",
        content: todo?.content ?? "",
        isDone: false,
        startTime: todo?.startTime ?? DateTime.now(),
        dueTime: todo?.dueTime ?? DateTime.now(),
        createdTime: DateTime.now(),
        updatedTime: DateTime.now(),
      );
      final result = await localDataSource.saveNewTodo(todoModel);

      return result == true ? const Right(true) : Left(CacheFailure());
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, bool>>? updateTodo(TodoEntity? todo) async {
    try {
      final TodoModel todoModel = TodoModel(
        uuid: todo?.uuid ?? "",
        title: todo?.title ?? "",
        content: todo?.content ?? "",
        isDone: todo?.isDone ?? false,
        startTime: todo?.startTime ?? DateTime.now(),
        dueTime: todo?.dueTime ?? DateTime.now(),
        createdTime: DateTime.now(),
        updatedTime: DateTime.now(),
      );
      final result = await localDataSource.updateTodo(todoModel);

      return result == true ? const Right(true) : Left(CacheFailure());
    } catch (e) {
      return Left(CacheFailure());
    }
  }
}
