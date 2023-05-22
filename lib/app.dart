import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hcm23_03/features/home/pages/home_page.dart';
import 'package:hcm23_03/features/login/pages/login_page.dart';
import 'package:hcm23_03/features/onboarding/pages/onboarding_page.dart';
import 'package:hcm23_03/features/register/pages/register_page.dart';
import 'package:hcm23_03/features/splash/pages/splash_page.dart';
import 'package:hcm23_03/features/tasks/entities/task_details_page_argument.dart';
import 'package:hcm23_03/features/tasks/pages/task_details_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  // void checkIsFirstTime(BuildContext chk) async {
  //   const String onboardingKey = "onboardingkey";
  //   final SharedPreferences preferences = await SharedPreferences.getInstance();
  //   bool? value = preferences.getBool(onboardingKey);
  //   if (value == false) {
  //     Navigator.of(chk)
  //     .pushNamedAndRemoveUntil('/HomePage', (Route<dynamic> route) => false);
  //   }else{
  //     Navigator.of(chk)
  //     .pushNamedAndRemoveUntil('/OnboardingPage', (Route<dynamic> route) => false);
  //   }
  // }
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return MaterialApp(
        title: 'Flutter Demo',
        // initialRoute: onBoard==0||onBoard==null?'onboard':'login',
        // routes: {
        //   'onboard':(context)=>OnboardingPage();
        //   'login':(context)=>LoginPage();
        // },
        // home: isviewed != 0 ? OnboardingPage() : LoginPage(),
        home: seenOnboard ==true? LoginPage(): OnboardingPage(),
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
<<<<<<< HEAD
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
<<<<<<< HEAD
          if (setting.name == "/Screen1") {
            return MaterialPageRoute(
              settings: const RouteSettings(name: "/Screen1"),
              builder: (_) => const Screen1(),
            );
          }
          if (setting.name == "/Screen2") {
            return MaterialPageRoute(
              settings: const RouteSettings(name: "/Screen2"),
              builder: (_) => const Screen2(),
            );
          }
          if (setting.name == "/SplashPage") {
=======

          if (setting.name == "/") {
>>>>>>> dev-v1
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
<<<<<<< HEAD

=======
>>>>>>> dev-v1
=======
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
            final arg = setting.arguments as TaskDetailsPageArgument;

            return MaterialPageRoute(
              settings: const RouteSettings(name: TaskDetailsPage.routeName),
              builder: (_) => TaskDetailsPage(
                arg: arg,
              ),
            );
          }

>>>>>>> dev-v1-trainer
          return null;
        },
        initialRoute: "/",
      );
    });
  }
}
