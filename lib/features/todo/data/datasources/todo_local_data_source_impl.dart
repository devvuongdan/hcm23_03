import 'dart:convert';

import 'package:hcm23_03/features/todo/data/datasources/todo_local_data_source.dart';
import 'package:hcm23_03/features/todo/data/models/todo_model.dart';
import 'package:hcm23_03/shared/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoLocalDataSourceImpl implements TodoLocalDataSource {
  @override
  Future<List<TodoModel>>? getListTodo() async {
    final List<TodoModel> todoModels = [];
    final pref = await SharedPreferences.getInstance();
    final List<String> keys = pref.getStringList("keys") ?? [];

    if (keys.isNotEmpty) {
      for (String key in keys) {
        final String valueString = pref.getString(key) ?? "";
        final TodoModel model = TodoModel.fromMap(jsonDecode(valueString));
        todoModels.add(model);
      }
    }
    return todoModels;
  }

  @override
  Future<bool>? saveNewTodo(TodoModel? todoModel) async {
    try {
      final pref = await SharedPreferences.getInstance();
      final String jsonString = jsonEncode(todoModel?.toMap());
      pref.setString(todoModel?.uuid ?? "", jsonString);

      final TodoModel saved = TodoModel.fromMap(
          jsonDecode(pref.getString(todoModel?.uuid ?? "") ?? ""));
      if (saved.uuid != "" && saved.uuid == todoModel?.uuid) {
        final List<String> keys =
            pref.getStringList(AppConstants.todoKeys) ?? [];
        keys.add(saved.uuid);
        pref.setStringList(AppConstants.todoKeys, keys);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool>? updateTodo(TodoModel? todoModel) {
    return null;
  }
}
