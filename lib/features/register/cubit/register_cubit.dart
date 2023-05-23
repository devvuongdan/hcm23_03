// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../auth/cubit/auth_cubit.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RegisterCubit()
      : super(const RegisterState(
          hidePassword: true,
        ));

  void registerWithUsernameAndPw(BuildContext context) async {
    EasyLoading.show();
    await Future.delayed(const Duration(seconds: 1));
    context.read<AuthCubit>().login(context, null);
    EasyLoading.dismiss();
  }

  void toogleHidePassword() {
    emit(state.copyWith(hidePassword: !state.hidePassword));
  }
}
