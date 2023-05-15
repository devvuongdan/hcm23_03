import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  double start = 0;
  double end = 0.5;
  void continues() {
    setState(() {
      start += 0.5;
      end += 0.5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4C27F),
      floatingActionButton: Container(
        height: 58,
        width: 58,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red,
        ),
      ),
    );
  }
}
