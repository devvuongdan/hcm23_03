// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseApp firebaseApp;
  AuthCubit(
    this.firebaseApp,
  ) : super(UnAuthenticated(FirebaseDatabase.instanceFor(app: firebaseApp)));

  void login(
    BuildContext context,
    UserCredential user,
  ) async {
    final db = FirebaseDatabase.instanceFor(app: firebaseApp);
    emit(Authenticated(FirebaseDatabase.instanceFor(app: firebaseApp),
        user: user));
  }

  void logout() async {
    emit(UnAuthenticated(FirebaseDatabase.instanceFor(app: firebaseApp)));
  }
}
