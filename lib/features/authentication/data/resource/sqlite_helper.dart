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

//read=query//
  static Future<List<Map<String, dynamic>>> query(String table) async =>
      _db!.query(table);
  // static Future<Map<String, Object?>?> loginUsers(Map<String, dynamic> row) async {
  //   Database? db = await instance.database;
  //   String users = row['username']; String password = row['password'];
  //   var findUser = await db!.query(users, where: "username = '$username' and password = '$password'");
  //   print(findUser[0]);

  //   return findUser.isNotEmpty ? findUser[0] : null;
  // }
//  Future <bool> authentication(dynamic users)async{
//     final Database db = await users;
//     var result = await db.rawQuery("select * from users where usrName = '${users.usrName}' and usrPassword = '${users.usrPassword}' ");
//     if(result.isNotEmpty){

//       return true;
//     }else{
//       return false;
//     }
//   }
//create=insert//
  static Future<int> insert<T extends DBModel>(String table, T model) async =>
      await _db!.insert(table, model.toMap());
//update//
  static Future<int> update<T extends DBModel>(String table, T model) async =>
      await _db!.update(table, model.toMap(),
          where: 'uid = ?', whereArgs: [model.uid]);
//delete//
  static Future<int> delete<T extends DBModel>(String table, T model) async =>
      await _db!.delete(table, where: 'uid = ?', whereArgs: [model.uid]);

  // Future<Hcm23User> saveData(Hcm23User user) async {
  //   var dbClient = await _db;
  //    Hcm23DBHelper.insert<Hcm23User>("users", user);
  //   return user;
  // }
}
