import 'package:dartz/dartz.dart';
import 'package:hcm23_03/core/errors/failures.dart';
import 'package:hcm23_03/features/todo/domain/entities/todo_entity.dart';

abstract class TodoRepo {
  Future<Either<Failure, List<TodoEntity>>>? getTodoList();

  Future<void>? saveTodo(TodoEntity todo);

  Future<void>? updateTodo(TodoEntity todo);
}
