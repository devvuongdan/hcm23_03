import 'package:hcm23_03/features/todo/data/models/todo_model.dart';

abstract class TodoLocalDataSource {
  Future<List<TodoModel>>? getListTodo();
  Future<bool>? saveNewTodo(TodoModel? todoModel);
  Future<bool>? updateTodo(TodoModel? todoModel);
}
