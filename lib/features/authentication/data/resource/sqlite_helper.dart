// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sqflite/sqflite.dart';

abstract class DBModel {
  final String uid;
  DBModel({
    required this.uid,
  });
  Map<String, dynamic> toMap();
}

class Hcm23DBHelper {
  static Database? _db;

  static int get _version => 1;

  static void onCreate(Database db, int version) async => await db.execute(
      'CREATE TABLE users (uid STRING PRIMARY KEY NOT NULL, username STRING, password STRING)');

  static Future<void> init() async {
    if (_db != null) {
      return;
    }

    try {
      String path = '${await getDatabasesPath()}example';
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
