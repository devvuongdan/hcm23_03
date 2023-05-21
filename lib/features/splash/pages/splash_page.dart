import 'package:flutter/material.dart';
import 'package:hcm23_03/features/login/pages/login_page.dart';
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SplashPage"),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/LoginPage");
          },
          child: const Text("Go to Login"),
        ),
      ),
    );

  }
}
