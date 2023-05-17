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
      backgroundColor: const Color(0XFF95B6FF),
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(left: 23, right: 25, top: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Always there: more than 1000 cars in Tbilisi",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700,
                  height: 32 / 24,
                  fontSize: 32,
                  color: Colors.white,
                ),
              ),
              const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w400,
                  height: 24 / 19,
                  fontSize: 19,
                  color: Colors.white,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 8, top: 33),
                child: Image.asset(
                  "assets/images/onboarding_img_2.png",
                  width: 300,
                  height: 300,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
