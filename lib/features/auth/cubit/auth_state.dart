part of 'auth_cubit.dart';

abstract class AuthState {
  const AuthState();
}

class UnAuthenticated extends AuthState {}

class Authenticated extends AuthState {}
