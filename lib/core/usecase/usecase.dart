import 'package:dartz/dartz.dart';

import '../errors/failures.dart';

abstract class UseCase<T, ParramX> {
  Future<Either<Failure, T>>? call({required ParramX parram});
}
