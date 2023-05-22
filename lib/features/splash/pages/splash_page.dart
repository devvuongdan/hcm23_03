import 'package:flutter/material.dart';
import 'package:hcm23_03/features/onboarding/pages/onboarding_page.dart';
import 'package:hcm23_03/shared/shared_ui/base_screen/base_screen.dart';

class SplashPage extends StatefulWidget {
  static const String routeName = "/";
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
          .pushNamedAndRemoveUntil(OnboardingPage.routeName, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(builder: (context) {
      return const Scaffold();
    });
  }
}
