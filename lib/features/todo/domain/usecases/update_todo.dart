import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/todo_entity.dart';
import '../repositories/todo_repo.dart';

import '../../../../core/usecase/usecase.dart';

class UpdateTodo extends UseCase<bool?, TodoEntity> {
  final TodoRepo repo;
  UpdateTodo({
    required this.repo,
  });

  @override
  Future<Either<Failure, bool?>>? call({required TodoEntity params}) {
    return repo.updateTodo(params);
  }
}
