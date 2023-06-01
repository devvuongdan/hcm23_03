import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepo {
  static Future<Either<String, UserCredential>> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCre = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return Right(userCre);
    } on FirebaseAuthException catch (err) {
      return Left(err.message ?? "");
    } catch (e) {
      return const Left("");
    }
  }

  static Future<Either<String, UserCredential>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCre = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return Right(userCre);
    } on FirebaseAuthException catch (err) {
      return Left(err.message ?? "");
    } catch (e) {
      return const Left("");
    }
  }

  static Future<Either<String, void>> sendPasswordResetEmail({
    required String email,
  }) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return const Right(null);
    } on FirebaseAuthException catch (err) {
      return Left(err.message ?? "");
    } catch (e) {
      return const Left("");
    }
  }
}
