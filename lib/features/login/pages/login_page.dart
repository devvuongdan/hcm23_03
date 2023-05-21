import 'package:flutter/material.dart';
import 'package:hcm23_03/features/home/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LoginPage"),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/HomePage");
          },
          child: const Text("Go to Home"),
        ),
      ),
    );
  }

  // _storeOnBoardInfo() async {
  //   int isViewed = 0;
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   await pref.setInt('onBoard', isViewed);
  // }
}
