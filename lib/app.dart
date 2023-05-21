import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hcm23_03/features/home/pages/home_page.dart';
import 'package:hcm23_03/features/login/pages/login_page.dart';
import 'package:hcm23_03/features/onboarding/pages/onboarding_page.dart';
import 'package:hcm23_03/features/splash/pages/splash_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
bool? seenOnboard;
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom,SystemUiOverlay.top]);
  
//   SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom,
//   SystemUiOverlay.top
// ]);
  final pref = await SharedPreferences.getInstance();
  final seenOnboard = pref.getBool('seenOnboard')??false;
  runApp(MyApp());
  
}
// int? isViewed;
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   SharedPreferences pref = await SharedPreferences.getInstance();   
//   isViewed = pref.getInt('onBoard');
//   await pref.setInt('onBoard', 1);
//   runApp(MyApp());
// }

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

          return null;
        },
        initialRoute: "/",
      );
    });
  }
}
