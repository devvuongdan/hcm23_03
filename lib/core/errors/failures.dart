import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final List<Object?> properties;
  const Failure({this.properties = const []}) : super();
  @override
  List<Object?> get props => properties;
}

class ServerFailure extends Failure {
  final String? message;
  const ServerFailure({
    required this.message,
  });
}

class CacheFailure extends Failure {}
