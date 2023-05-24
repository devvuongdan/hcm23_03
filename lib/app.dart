import 'package:flutter/material.dart';
import 'package:hcm23_03/features/home/pages/home_page.dart';
import 'package:hcm23_03/features/home/pages/todo_list_page.dart';
import 'package:hcm23_03/features/login/pages/login_page.dart';
import 'package:hcm23_03/features/onboarding/pages/onboarding_page.dart';
import 'package:hcm23_03/features/splash/pages/splash_page.dart';
import 'package:hcm23_03/features/tasks/pages/task_details_page.dart';
import 'package:hcm23_03/features/tasks/entities/task.dart';


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
        home: const OnboardingPage(),
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
              settings: const RouteSettings(name: "/SplashPage"),
              builder: (_) => const SplashPage(),
            );
          }
          if (setting.name == "/OnboardingPage") {
            return MaterialPageRoute(
              settings: const RouteSettings(name: "/OnboardingPage"),
              builder: (_) => const OnboardingPage(),
            );
          }
          if (setting.name == "/taskDetails") {
            final Task passedTask = setting.arguments as Task;
            return MaterialPageRoute(
              settings: const RouteSettings(name: "/taskDetails"),
              builder: (_) => TaskDetailsPage(task: passedTask),
            );
          }
          return null;
        },
        initialRoute: "/",
      );
    });
  }
}
