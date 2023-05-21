import 'package:flutter/material.dart';
import 'package:hcm23_03/features/home/pages/home_page.dart';

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
}
