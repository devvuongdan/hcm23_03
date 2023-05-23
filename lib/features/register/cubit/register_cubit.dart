// ignore_for_file: use_build_context_synchronously

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hcm23_03/features/auth/entities/hcm23_user.dart';
import 'package:hcm23_03/repositories/auth_repo.dart';

import '../../../shared/shared_ui/dialogs/hcm23_dialog.dart';
import '../../auth/cubit/auth_cubit.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RegisterCubit()
      : super(const RegisterState(
          hidePassword: true,
        ));

  void registerWithUsernameAndPw(BuildContext ctx) async {
    EasyLoading.show();
    final Either<String, UserCredential> userCre =
        await AuthRepo.createUserWithEmailAndPassword(
      email: usernameController.text,
      password: passwordController.text,
    );
    if (userCre is Right<String, UserCredential>) {
      final DatabaseReference ref = ctx
          .read<AuthCubit>()
          .state
          .db
          .ref("users/${userCre.value.user?.uid}");
      ref.set(Hcm23User(
        uuid: userCre.value.user?.uid,
        email: usernameController.text,
        avatar: "",
      ).toMap());
      // String jsonContent =
      //     await rootBundle.loadString('assets/jsons/tasks.json');
      // final List jsons = jsonDecode(jsonContent) as List;
      // final DatabaseReference ref2 = ctx
      //     .read<AuthCubit>()
      //     .state
      //     .db
      //     .ref("tasks/${userCre.value.user?.uid}");
      // ref2.set(jsons);

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

  void toogleHidePassword() {
    emit(state.copyWith(hidePassword: !state.hidePassword));
  }
}
