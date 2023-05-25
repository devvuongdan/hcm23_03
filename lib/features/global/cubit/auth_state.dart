// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_cubit.dart';

abstract class AuthState {
  final FirebaseDatabase db;
  const AuthState(this.db);
}

class UnAuthenticated extends AuthState {
  UnAuthenticated(super.db);
}

class Authenticated extends AuthState {
  final UserCredential user;

  Authenticated(
    super.db, {
    required this.user,
  });
}
