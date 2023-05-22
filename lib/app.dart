import 'package:flutter/material.dart';
import 'package:hcm23_03/features/home/pages/home_page.dart';
import 'package:hcm23_03/features/login/pages/login_page.dart';
import 'package:hcm23_03/features/onboarding/pages/onboarding_page.dart';
import 'package:hcm23_03/features/register/pages/register_page.dart';
import 'package:hcm23_03/features/splash/pages/splash_page.dart';
import 'package:hcm23_03/features/tasks/pages/task_details_page.dart';

import 'features/tasks/entities/task.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            appBarTheme: const AppBarTheme(
              elevation: 0.5,
              backgroundColor: Color(0xFFB7ABFD),
            )),
        navigatorObservers: [
          NavigatorObserver(),
        ],
        onGenerateRoute: (setting) {
          if (setting.name == SplashPage.routeName) {
            return MaterialPageRoute(
              settings: const RouteSettings(name: SplashPage.routeName),
              builder: (_) => const SplashPage(),
            );
          }
          if (setting.name == OnboardingPage.routeName) {
            return MaterialPageRoute(
              settings: const RouteSettings(name: OnboardingPage.routeName),
              builder: (_) => const OnboardingPage(),
            );
          }
          if (setting.name == LoginPage.routeName) {
            return MaterialPageRoute(
              settings: const RouteSettings(name: LoginPage.routeName),
              builder: (_) => const LoginPage(),
            );
          }
          if (setting.name == RegisterPage.routeName) {
            return MaterialPageRoute(
              settings: const RouteSettings(name: RegisterPage.routeName),
              builder: (_) => const RegisterPage(),
            );
          }
          if (setting.name == HomePage.routeName) {
            return MaterialPageRoute(
              settings: const RouteSettings(name: HomePage.routeName),
              builder: (_) => const HomePage(),
            );
          }
          if (setting.name == TaskDetailsPage.routeName) {
            final task = setting.arguments as Task?;
            return MaterialPageRoute(
              settings: const RouteSettings(name: TaskDetailsPage.routeName),
              builder: (_) => TaskDetailsPage(
                currentTask: task,
              ),
            );
          }

          return null;
        },
        initialRoute: "/",
      );
    });
  }
}
