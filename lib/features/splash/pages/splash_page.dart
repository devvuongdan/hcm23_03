import 'package:flutter/material.dart';
<<<<<<< HEAD
<<<<<<< HEAD
import 'package:hcm23_03/features/login/pages/login_page.dart';
class SplashPage extends StatelessWidget {
=======

class SplashPage extends StatefulWidget {
>>>>>>> dev-v1
=======
import 'package:hcm23_03/features/onboarding/pages/onboarding_page.dart';
import 'package:hcm23_03/shared/shared_ui/base_screen/base_screen.dart';

class SplashPage extends StatefulWidget {
  static const String routeName = "/";
>>>>>>> dev-v1-trainer
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
<<<<<<< HEAD
          .pushNamedAndRemoveUntil("/OnboardingPage", (route) => false);
=======
          .pushNamedAndRemoveUntil(OnboardingPage.routeName, (route) => false);
>>>>>>> dev-v1-trainer
    });
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
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
=======
    return BaseScreen(builder: (context) {
      return const Scaffold();
    });
>>>>>>> dev-v1-trainer
  }
}
