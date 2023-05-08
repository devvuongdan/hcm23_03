import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:hcm23_03/core/errors/failures.dart';

import '../../../../core/usecase/usecase.dart';
import '../entities/todo_entity.dart';
import '../repositories/todo_repo.dart';

class GetTodoList extends UseCase<List<TodoEntity>, NoParam> {
  final TodoRepo repo;
  GetTodoList({
    required this.repo,
  });

  @override
  Future<Either<Failure, List<TodoEntity>>>? call({required NoParam parram}) {
    return repo.getTodoList();
  }
}

class NoParam extends Equatable {
  @override
  List<Object?> get props => [];
}
