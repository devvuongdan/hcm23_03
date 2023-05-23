// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Hcm23User {
  final String? uuid;
  final String? email;
  final String? fullName;
  final String? phone;
  final String? avatar;
  Hcm23User({
    this.uuid,
    this.email,
    this.fullName,
    this.phone,
    this.avatar,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uuid': uuid,
      'email': email,
      'fullName': fullName,
      'phone': phone,
      'avatar': avatar,
    };
  }

  factory Hcm23User.fromMap(Map<String, dynamic> map) {
    return Hcm23User(
      uuid: map['uuid'] != null ? map['uuid'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      fullName: map['fullName'] != null ? map['fullName'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Hcm23User.fromJson(String source) =>
      Hcm23User.fromMap(json.decode(source) as Map<String, dynamic>);
}
