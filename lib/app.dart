import 'package:flutter/material.dart';
import 'package:hcm23_03/features/change_pass/pages/change_pass1_pages.dart';
import 'package:hcm23_03/features/change_pass/pages/change_pass_pages.dart';
import 'package:hcm23_03/features/home/pages/home_page.dart';
import 'package:hcm23_03/features/login/pages/login_page.dart';
import 'package:hcm23_03/features/onboarding/pages/onboarding_page.dart';
import 'package:hcm23_03/features/register/pages/register_pages.dart';
import 'package:hcm23_03/features/tasks/entities/task.dart';
import 'package:hcm23_03/features/tasks/pages/task_details_page.dart';

import 'features/onboarding/pages/onboarding_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        navigatorObservers: [
          NavigatorObserver(),
        ],
        onGenerateRoute: (setting) {
          if (setting.name == "/HomePage") {
            return MaterialPageRoute(
              settings: const RouteSettings(name: "/HomePage"),
              builder: (_) => const HomePage(),
            );
          }
          if (setting.name == "/LoginPage") {
            return MaterialPageRoute(
              settings: const RouteSettings(name: "/LoginPage"),
              builder: (_) => const LoginPage(),
            );
          }

          if (setting.name == "/") {
            return MaterialPageRoute(
              settings: const RouteSettings(name: "/OnboardingPage"),
              builder: (_) => const OnboardingPage(),
            );
          }
          if (setting.name == "/OnboardingPage") {
            return MaterialPageRoute(
              settings: const RouteSettings(name: "/OnboardingPage"),
              builder: (_) => const OnboardingPage(),
            );
          }
          if (setting.name == "/ChangePage") {
            return MaterialPageRoute(
              settings: const RouteSettings(name: "/ChangePage"),
              builder: (_) => const ChangePage(),
            );
          }
          if (setting.name == "/ChangePass1Page") {
            return MaterialPageRoute(
              settings: const RouteSettings(name: "/ChangePass1Page"),
              builder: (_) => const ChangePass1Page(),
            );
          }
          if (setting.name == "/RegisterPage") {
            return MaterialPageRoute(
              settings: const RouteSettings(name: "/RegisterPage"),
              builder: (_) => const RegisterPage(),
            );
          }
          if (setting.name == "/TaskDetailsPage") {
            final Task task = setting.arguments as Task;
            return MaterialPageRoute(
              settings: const RouteSettings(name: "/TaskDetailsPage"),
              builder: (_) => TaskDetailsPage(task: task),
            );
          }
          return null;
        },
        initialRoute: "/",
      );
    });
  }
}
