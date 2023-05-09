// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class Params<F, T> extends Equatable {
  final Future<T> function;
  final bool isShowLoading;

  final void Function(T)? onSuccess;
  final void Function(F)? onFailure;

  const Params({
    required this.function,
    this.isShowLoading = true,
    this.onSuccess,
    this.onFailure,
  });

  @override
  List<Object?> get props => [function, isShowLoading, onFailure, onSuccess];
}
