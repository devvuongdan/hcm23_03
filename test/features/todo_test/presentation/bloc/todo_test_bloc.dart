import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'todo_test_event.dart';
part 'todo_test_state.dart';

class TodoTestBloc extends Bloc<TodoTestEvent, TodoTestState> {
  TodoTestBloc() : super(TodoTestInitial()) {
    on<TodoTestEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
