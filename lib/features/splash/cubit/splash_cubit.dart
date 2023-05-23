// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hcm23_03/features/login/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../onboarding/pages/onboarding_page.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState());

  Future<void> checkNewUser(BuildContext context) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final bool? value = preferences.getBool(onboardingKey);

    if (value != true) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(LoginPage.routeName, (route) => false);
    } else {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(OnboardingPage.routeName, (route) => false);
    }
  }
}
