import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:hcm23_03/features/login/pages/login_page.dart';
class SplashPage extends StatelessWidget {
=======

class SplashPage extends StatefulWidget {
>>>>>>> dev-v1
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil("/OnboardingPage", (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
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

=======
    return const Scaffold();
>>>>>>> dev-v1
  }
}
