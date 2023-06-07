// ignore_for_file: public_member_api_docs, sort_constructors_first, empty_catches
import 'package:hcm23_03/features/authentication/data/model/hcm23_user.dart';
import 'package:sqflite/sqflite.dart';

import '../../../tasks/entities/task_model.dart';

abstract class DBModel {
  final String uid;
  DBModel({
    required this.uid,
  });
  Map<String, dynamic> toMap();
}

abstract class Hcm23DBHelper {
  static Database? _db;

  static int get _version => 1;

  static void onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE ${Hcm23User.dbTable} (uid STRING PRIMARY KEY NOT NULL, username STRING, password STRING)');
    await db.execute(
        'CREATE TABLE ${Task.dbTable} (uid STRING PRIMARY KEY NOT NULL, userId STRING, title STRING, description STRING, starttime STRING, duetime STRING)');
    await db.execute(
        'CREATE TABLE ${TaskStage.dbTable} (uid STRING PRIMARY KEY NOT NULL, isDone STRING, stageName STRING, taskUid STRING)');
    await db.execute(
        'CREATE TABLE ${TeamMember.dbTable} (uid STRING PRIMARY KEY NOT NULL, avatarUrl STRING, taskUid STRING)');
  }

  static Future<void> init() async {
    if (_db != null) {
      return;
    }

    try {
      String path = '${await getDatabasesPath()}-hcm23-03-dev-v1';
      _db = await openDatabase(path, version: _version, onCreate: onCreate);
    } catch (ex) {}
  }

  static Future<List<Map<String, dynamic>>> query(String table) async =>
      _db!.query(table);

  static Future<int> insert<T extends DBModel>(String table, T model) async =>
      await _db!.insert(table, model.toMap());

  static Future<int> update<T extends DBModel>(String table, T model) async =>
      await _db!.update(table, model.toMap(),
          where: 'uid = ?', whereArgs: [model.uid]);

  static Future<int> delete<T extends DBModel>(String table, T model) async =>
      await _db!.delete(table, where: 'uid = ?', whereArgs: [model.uid]);
}
