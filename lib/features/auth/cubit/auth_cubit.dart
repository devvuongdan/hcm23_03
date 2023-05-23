import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hcm23_03/features/auth/entities/hcm23_user.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(UnAuthenticated());

  void login(
    BuildContext context,
    Hcm23User? user,
  ) async {
    emit(Authenticated());
  }

  void logout() async {
    emit(UnAuthenticated());
  }
}
