import 'dart:convert';

import 'package:dartz/dartz.dart' hide Task;
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hcm23_03/features/auth/cubit/auth_cubit.dart';

import '../features/task/entities/task.dart';

class TasksRepo {
  static Future<Either<String, List<Task>>> getTasks(
    BuildContext ctx,
  ) async {
    try {
      final FirebaseDatabase db = ctx.read<AuthCubit>().state.db;
      final String id =
          (ctx.read<AuthCubit>().state as Authenticated).user.user?.uid ?? "";
      final ref = db.ref("tasks/$id");
      late List<Task> tasks = [];
      ref.onValue.listen((DatabaseEvent event) {
        final jsonContent = event.snapshot.value;

        final List jsons = jsonDecode(jsonEncode(jsonContent)) as List;

        for (dynamic item in jsons) {
          final String itemToJson = jsonEncode(item);
          final Map<String, dynamic> itemMap = jsonDecode(itemToJson);
          final Task task = Task.fromMap(itemMap);
          tasks.add(task);
        }
        tasks.sort((a, b) => (a.startTime ?? DateTime.now())
            .compareTo(b.startTime ?? DateTime.now()));
      });

      return Right(tasks);
    } catch (e) {
      return const Left("Có lỗi xảy ra");
    }
  }
}
