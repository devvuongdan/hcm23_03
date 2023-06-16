import 'package:flutter/material.dart';
import 'package:hcm23_03/features/authentication/data/model/hcm23_user.dart';
import 'features/forgot_password/pages/forgot_password_page.dart';
import 'features/home/pages/home_page.dart';
import 'features/login/pages/login_page.dart';
import 'features/onboarding/pages/onboarding_page.dart';
import 'features/register/pages/register_pages.dart';
import 'features/splash/pages/splash_page.dart';
import 'features/tasks/pages/new_task_page.dart';
import 'features/tasks/pages/task_details_page.dart';
import 'features/change_password/pages/change_password_page.dart';

import 'features/tasks/entities/task_model.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.grey),
              backgroundColor: Colors.white,
              titleTextStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 18,
                height: 22 / 18,
              )),
          primarySwatch: Colors.blue,
        ),
        navigatorObservers: [
          NavigatorObserver(),
        ],
        home: const SplashPage(),
        onGenerateRoute: (setting) {
          if (setting.name == HomePage.routeName) {
            final Hcm23User user = setting.arguments as Hcm23User;
            return MaterialPageRoute(
              settings: const RouteSettings(name: HomePage.routeName),
              builder: (_) => HomePage(
                user: user,
              ),
            );
          }
          if (setting.name == ChangePasswordPage.routeName) {
            final Hcm23User user = setting.arguments as Hcm23User;
            return MaterialPageRoute(
              settings: const RouteSettings(name: ChangePasswordPage.routeName),
              builder: (_) => ChangePasswordPage(user: user),
            );
          }
          if (setting.name == NewTaskPage.routeName) {
            // final Task task = setting.arguments as Task;
            final NewTaskPageArg arg = setting.arguments as NewTaskPageArg;

            return MaterialPageRoute(
              settings: const RouteSettings(name: NewTaskPage.routeName),
              builder: (_) => NewTaskPage(
                arg: arg,
              ),
            );
          }
          if (setting.name == LoginPage.routeName) {
            return MaterialPageRoute(
              settings: const RouteSettings(name: LoginPage.routeName),
              builder: (_) => const LoginPage(),
            );
          }

          if (setting.name == "/") {
            return MaterialPageRoute(
              settings: const RouteSettings(name: SplashPage.routeName),
              builder: (_) => const SplashPage(),
            );
          }
          if (setting.name == "/OnboardingPage") {
            return MaterialPageRoute(
              settings: const RouteSettings(name: "/OnboardingPage"),
              builder: (_) => const OnboardingPage(),
            );
          }

          if (setting.name == "/ForgotPasswordPage") {
            return MaterialPageRoute(
              settings: const RouteSettings(name: "/ForgotPasswordPage"),
              builder: (_) => const ForgotPasswordPage(),
            );
          }
          if (setting.name == RegisterPage.routeName) {
            return MaterialPageRoute(
              settings: const RouteSettings(name: RegisterPage.routeName),
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
