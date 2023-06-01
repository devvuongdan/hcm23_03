// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:hcm23_03/features/home/pages/home_page.dart';
import 'package:hcm23_03/features/login/pages/login_page.dart';
import 'package:hcm23_03/features/onboarding/pages/onboarding_page.dart';
import 'package:hcm23_03/features/register/pages/register_page.dart';
import 'package:hcm23_03/features/splash/pages/splash_page.dart';
import 'package:hcm23_03/features/task/cubits/task_details/task_details_cubit.dart';
import 'package:hcm23_03/features/task/data/entities/task_details_page_arg.dart';
import 'package:hcm23_03/features/user/pages/user_profile_pages.dart';

import 'features/global/cubit/auth_cubit.dart';
import 'features/home/cubit/home_cubit.dart';
import 'features/login/cubit/login_cubit.dart';
import 'features/register/cubit/register_cubit.dart';
import 'features/splash/cubit/splash_cubit.dart';
import 'features/task/pages/task_details_page.dart';

class MyApp extends StatelessWidget {
  final FirebaseApp firebaseApp;
  const MyApp({
    Key? key,
    required this.firebaseApp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthCubit(firebaseApp),
          ),
        ],
        child: MaterialApp(
          navigatorKey: navigatorKey,
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
                builder: (_) => BlocProvider(
                  create: (context) => SplashCubit(),
                  child: const SplashPage(),
                ),
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
                builder: (_) => BlocProvider(
                  create: (context) => LoginCubit(),
                  child: const LoginPage(),
                ),
              );
            }
            if (setting.name == RegisterPage.routeName) {
              return MaterialPageRoute(
                settings: const RouteSettings(name: RegisterPage.routeName),
                builder: (_) => BlocProvider(
                  create: (context) => RegisterCubit(),
                  child: const RegisterPage(),
                ),
              );
            }
            if (setting.name == HomePage.routeName) {
              return MaterialPageRoute(
                settings: const RouteSettings(name: HomePage.routeName),
                builder: (_) => BlocProvider(
                  create: (context) => HomeCubit(),
                  child: const HomePage(),
                ),
              );
            }
            if (setting.name == TaskDetailsPage.routeName) {
              final TaskDetailsPageArg arg =
                  setting.arguments as TaskDetailsPageArg;

              return MaterialPageRoute(
                settings: const RouteSettings(name: TaskDetailsPage.routeName),
                builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => TaskDetailsCubit(arg)..initState(),
                    ),
                  ],
                  child: TaskDetailsPage(
                    arg: arg,
                  ),
                ),
              );
            }
            if (setting.name == UserProfilePage.routeName) {
              return MaterialPageRoute(
                settings: const RouteSettings(name: UserProfilePage.routeName),
                builder: (_) => const UserProfilePage(),
              );
            }

            return null;
          },
          initialRoute: "/",
          builder: EasyLoading.init(),
        ),
      );
    });
  }
}
