// ignore_for_file: public_member_api_docs, sort_constructors_first, use_build_context_synchronously

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../repositories/auth_repo.dart';
import '../../../shared/shared_ui/dialogs/hcm23_dialog.dart';
import '../../login/cubit/login_cubit.dart';
import '../entities/hcm23_user.dart';

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
    emit(
      Authenticated(
        FirebaseDatabase.instanceFor(app: firebaseApp),
        user: user,
      ),
    );
  }

  void loginWithUsernameAndPw({
    required String username,
    required String password,
    bool rememberAccount = false,
    required BuildContext ctx,
  }) async {
    EasyLoading.show();

    final Either<String, UserCredential> userCre =
        await AuthRepo.signInWithEmailAndPassword(
      email: username,
      password: password,
    );
    if (userCre is Right<String, UserCredential>) {
      if (rememberAccount) {
        final SharedPreferences preferences =
            await SharedPreferences.getInstance();
        await preferences.setString(
            rememberAccountKey,
            Hcm23User(
              email: username,
              password: password,
            ).toJson());
      }
      login(ctx, userCre.value);
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

  void logout() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove(rememberAccountKey);
    emit(
      UnAuthenticated(
        FirebaseDatabase.instanceFor(app: firebaseApp),
      ),
    );
  }
}
