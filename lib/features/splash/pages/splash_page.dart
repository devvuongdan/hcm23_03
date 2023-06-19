import 'dart:async';

import 'package:flutter/material.dart';
import '../../login/pages/login_page.dart';
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
  late Hcm23User user;
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
        final Map<String, dynamic> userMap =
            users.firstWhere((user) => user['username'] == username);

        user = Hcm23User.fromMap(userMap);
        if (user.password.toString() == password.toString()) {
          _navigateToHomePage(userId: user.uid);
        } else {
          _navigateToLoginPage();
        }
      } catch (e) {
        print(e);
        _navigateToLoginPage();
      }
    } else {
      _navigateToLoginPage();
    }
  }

  void _navigateToHomePage({required String userId}) {
    Navigator.of(context).pushNamedAndRemoveUntil(
        HomePage.routeName, arguments: user, (route) => false);
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
