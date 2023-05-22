import 'package:flutter/material.dart';
import 'package:hcm23_03/features/home/pages/todo_list_page.dart';
import 'package:hcm23_03/features/login/pages/login_page.dart';
import 'package:hcm23_03/features/onboarding/widgets/onboarding_floatting_action_button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController pageController = PageController();
  int currentStep = 1;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: YinFloatingActionButton(
        args: YinFloatingActionButtonArgs(
          size: 58,
          scaffoldBackgroundColor: const Color(0xFFB7ABFD),
          currentStep: currentStep,
          stepCount: 2,
          onTap: () {
            setState(() {
              if (currentStep < 2 && currentStep >= 0) {
                pageController.animateToPage(currentStep,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn);
              } else {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (_) => const LoginPage(),
                  ),
                  (route) => false,
                );
              }
            });
          },
        ),
      ),
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (value) {
              setState(() {
                currentStep = (value + 1);
              });
            },
            physics: const ClampingScrollPhysics(),
            children: [
              _buildOnboardingStep(
                title: "ONBOARDING TITLE",
                content:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                imageUrl: "assets/images/onboarding_img_1.png",
                bgColor: const Color(0xFFB7ABFD),
              ),
              _buildOnboardingStep(
                title: "ONBOARDING TITLE",
                content:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                imageUrl: "assets/images/onboarding_img_2.png",
                bgColor: const Color(0XFF95B6FF),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 8,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 2,
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 8,
                        );
                      },
                      itemBuilder: (context, idx) {
                        if (idx == currentStep - 1) {
                          return Container(
                            width: 24,
                            height: 8,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              color: Colors.white,
                            ),
                          );
                        } else {
                          return Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4)),
                              color: const Color(0XFFFFFFFF).withOpacity(0.5),
                            ),
                          );
                        }
                      }),
                ),
                const SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _buildOnboardingStep({
    String title = "",
    String content = "",
    String imageUrl = "",
    required Color bgColor,
  }) {
    return Container(
      color: bgColor,
      height: double.infinity,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 100,
            ),
            Text(
              title,
              textAlign: TextAlign.left,
              style: const TextStyle(
                  fontSize: 24,
                  height: 32 / 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              content,
              textAlign: TextAlign.left,
              style: const TextStyle(
                  fontSize: 18,
                  height: 24 / 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            Expanded(
              child: Image.asset(imageUrl),
            ),
          ],
        ),
        // body: Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       const SizedBox(
        //         height: 100,
        //       ),
        //       Text('A Community Was Build Just For You',
        //           //   style: TextStyle(
        //           //     fontSize: 24,
        //           //     fontWeight: FontWeight.w700,
        //           //     height: 1.5,
        //           //     color: Colors.white,

        //           // ),
        //           style: GoogleFonts.poppins(
        //             fontSize: 24,
        //             fontWeight: FontWeight.w700,
        //             height: 1.2,
        //             color: Colors.white,
        //           )),
        //       Text(
        //         'A community was build for you to share your thought, your concerns and improve yourself with other people',
        //         //   style: TextStyle(
        //         //     fontSize: 18,
        //         //     fontWeight: FontWeight.w400,
        //         //     height: 1.5,
        //         //     color: Colors.white,
        //         // ),
        //         style: GoogleFonts.lora(
        //           fontSize: 18,
        //           fontWeight: FontWeight.w400,
        //           height: 1.5,
        //           color: Colors.white,
        //         ),
        //       ),
        //       Expanded(
        //         child: Center(
        //           child: SvgPicture.asset("assets/images/onboarding_img_1.svg"),
        //         ),
        //       ),
        //     ],
        //   ),
        // )
        ));
  }
}
