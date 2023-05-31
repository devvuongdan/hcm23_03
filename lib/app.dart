import 'package:flutter/material.dart';
import 'package:hcm23_03/features/home/pages/home_page.dart';
import 'package:hcm23_03/features/login/pages/login_page.dart';
import 'package:hcm23_03/features/onboarding/pages/onboarding_page.dart';
import 'package:hcm23_03/features/tasks/entities/task.dart';
import 'package:hcm23_03/features/tasks/pages/task_details_page.dart';
import 'package:hcm23_03/features/change_password/pages/change_password.dart';
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
          if (setting.name == "/ChangePassword") {
            return MaterialPageRoute(
              settings: const RouteSettings(name: "/ChangePassword"),
              builder: (_) => const ChangePassword(),
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
