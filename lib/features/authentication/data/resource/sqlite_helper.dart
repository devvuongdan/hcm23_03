import 'package:hcm23_03/features/authentication/data/model/hcm23_user.dart';
import 'package:sqflite/sqflite.dart';

class HCM23DBHelper {
  late final Database db;
  Future<void> initDB() async {
    final Database database = await openDatabase(Hcm23User(uid: uid, username: username, password: password))
  }
}
