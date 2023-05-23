// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LoginCubit()
      : super(const LoginState(
          hidePassword: true,
          rememberAccount: false,
        ));

  void loginWithUsernameAndPw(BuildContext context) async {
    EasyLoading.show();
    await Future.delayed(const Duration(seconds: 1));

    // context.read<AuthCubit>().login(context, null);
    EasyLoading.dismiss();
  }

  void changeRememberAccount(bool? value) {
    emit(state.copyWith(rememberAccount: value));
  }

  void toogleHidePassword() {
    emit(state.copyWith(hidePassword: !state.hidePassword));
  }
}
