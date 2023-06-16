// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../resource/sqlite_helper.dart';

class Hcm23User extends DBModel {
  static const dbTable = "Hcm23User";
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
      uid: map['uid'].toString(),
      username: map['username'].toString(),
      password: map['password'].toString(),
    );
  }

  Hcm23User copyWith({
    String? username,
    String? password,
  }) {
    return Hcm23User(
      uid: uid,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }
}
