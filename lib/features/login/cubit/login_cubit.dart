// ignore_for_file: use_build_context_synchronously

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hcm23_03/shared/shared_ui/dialogs/hcm23_dialog.dart';

import '../../../repositories/auth_repo.dart';
import '../../auth/cubit/auth_cubit.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LoginCubit()
      : super(const LoginState(
          hidePassword: true,
          rememberAccount: false,
        ));

  void loginWithUsernameAndPw(BuildContext ctx) async {
    EasyLoading.show();

    final Either<String, UserCredential> userCre =
        await AuthRepo.signInWithEmailAndPassword(
      email: usernameController.text,
      password: passwordController.text,
    );
    if (userCre is Right<String, UserCredential>) {
      ctx.read<AuthCubit>().login(ctx, userCre.value);
    } else if (userCre is Left<String, UserCredential>) {
      showDialog(
        context: ctx,
        builder: (context) => HCM23Dialog(
          title: 'Error',
          content: userCre.value,
          backgroundColor: Colors.red.withOpacity(0.4),
          titleTextStyle: const TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          contentTextStyle: const TextStyle(fontSize: 16, color: Colors.white),
          actions: [
            CleanDialogActionButtons(
              actionTitle: 'OK',
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    }
    EasyLoading.dismiss();
  }

  void changeRememberAccount(bool? value) {
    emit(state.copyWith(rememberAccount: value));
  }

  void toogleHidePassword() {
    emit(state.copyWith(hidePassword: !state.hidePassword));
  }
}
