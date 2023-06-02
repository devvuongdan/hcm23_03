import 'package:flutter/foundation.dart';

class Hcm23User {
  final String uid;
  final String username;
  final String password;

  const Hcm23User({
  required this.uid,
  required this.username,
  required this.password
  });
  Map<String ,dynamic>toMap(){
    return<String, dynamic>{
    'uid':uid,
    'username':username,
    'password':password,
  };
}
factory Hcm23User.fromMap(Map<String, dynamic> map){
  return Hcm23User(
    uid:map['uid']as String,
    username:map['username']as String,
    password:map['password']as String,

  );
}

}
