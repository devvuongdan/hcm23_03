import 'package:hcm23_03/features/authentication/data/resource/sqlite_helper.dart';

class Hcm23User extends DBModel {
  final String username;
  final String password;

  Hcm23User({
    required super.uid,
    required this.username,
    required this.password,
  });

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'username': username,
      'password': password,
    };
  }

  factory Hcm23User.fromMap(Map<String, dynamic> map) {
    return Hcm23User(
      uid: map['uid'] as String,
      username: map['username'] as String,
      password: map['password'] as String,
    );
  }
}
