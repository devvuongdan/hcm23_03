import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hcm23_03/features/login/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../authentication/data/model/hcm23_user.dart';
import '../../authentication/data/resource/sqlite_helper.dart';
import '../../home/pages/home_page.dart';

class SplashPage extends StatefulWidget {
  static const String routeName = "/SplashPage";
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    getRememberedAccount();
  }

  Future<void> getRememberedAccount() async {
    final preferences = await SharedPreferences.getInstance();
    final String? usernameStored = preferences.getString('username');
    final String? passwordStored = preferences.getString('password');
    if (usernameStored != null && passwordStored != null) {
      final String username = usernameStored;
      final String password = passwordStored;

      final List<Map<String, dynamic>> users =
          await Hcm23DBHelper.query(Hcm23User.dbTable);

      try {
        final user = users.firstWhere((user) => user['username'] == username);
        print(user);
        _navigateToHomePage(userId: user['uid']);
      } catch (e) {}
    } else {
      _navigateToLoginPage();
    }
  }

  void _navigateToHomePage({required String userId}) {
    Navigator.of(context).pushNamedAndRemoveUntil(
        HomePage.routeName, arguments: userId, (route) => false);
  }

  void _navigateToLoginPage() {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(LoginPage.routeName, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/icons/r2s-launcher-icon.png',
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
