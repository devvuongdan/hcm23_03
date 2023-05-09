import 'package:dartz/dartz.dart';
import '../errors/failures.dart';

abstract class UseCase<T, Params> {
  Future<Either<Failure, T>>? call({required Params params});
}
