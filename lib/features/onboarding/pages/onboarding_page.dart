import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
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
        backgroundColor: const Color.fromARGB(255, 170, 158, 236),
        floatingActionButton: YinFloatingActionButton(
          args: YinFloatingActionButtonArgs(
            size: 56.0,
            scaffoldBackgroundColor: Colors.black,
            stepCount: 2,
            currentStep: 0,
            onTap: continues,
          ),
        ),
        body: Center(
            // child: Text(
            //   'Hello World',
            //   style: TextStyle(
            //     fontSize: 30,
            //     fontWeight: FontWeight.w700,
            //     color: Colors.white,
            //   ),
            // )
            child: Container(
          height: 600,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('A Community Was Build Just For You',
                  //   style: TextStyle(
                  //     fontSize: 24,
                  //     fontWeight: FontWeight.w700,
                  //     height: 1.5,
                  //     color: Colors.white,

                  // ),
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                    color: Colors.white,
                  )),
              Text(
                'A community was build for you to share your thought, your concerns and improve yourself with other people',
                //   style: TextStyle(
                //     fontSize: 18,
                //     fontWeight: FontWeight.w400,
                //     height: 1.5,
                //     color: Colors.white,
                // ),
                style: GoogleFonts.lora(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: Center(
                  child: SvgPicture.asset("assets/images/onboarding_img_1.svg"),
                ),
              ),
            ],
          ),
        ))
      );
  }
}
