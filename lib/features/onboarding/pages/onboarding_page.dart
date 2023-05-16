import 'package:flutter/material.dart';
import 'package:hcm23_03/features/onboarding/widgets/onboarding_floatting_action_button.dart';

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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 127, right: 64, left: 15),
              child: Text(
                "Always there: more than 1000 cars in Tbilisi",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: 'DancingScript',
                    fontSize: 24,
                    height: 32 / 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, right: 64, left: 15),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: 'Inconsolata',
                    fontSize: 18,
                    height: 24 / 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ),
            Center(
              child: Image.asset("assets/images/onboarding_img_1.png"),
            ),
          ],
        ),
        backgroundColor: const Color(0xFFB7ABFD),
        floatingActionButton: YinFloatingActionButton(
          args: YinFloatingActionButtonArgs(
            size: 58,
            scaffoldBackgroundColor: const Color(0xFFB7ABFD),
            currentStep: 0,
            stepCount: 2,
          ),
        ));
  }
}
