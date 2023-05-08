import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/todo_entity.dart';

abstract class TodoRepo {
  Future<Either<Failure, List<TodoEntity>>>? getTodoList();

  Future<Either<Failure, bool>>? saveNewTodo(TodoEntity? todo);

  Future<Either<Failure, TodoEntity>>? updateTodo(TodoEntity todo);
}
