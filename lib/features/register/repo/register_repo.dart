import 'package:firebase_auth/firebase_auth.dart';

class RegisterRepo {
  static Future<UserCredential?> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCre = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCre;
    } catch (e) {
      return null;
    }
  }
}
