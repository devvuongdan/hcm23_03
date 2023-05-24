import 'package:flutter/material.dart';
import 'package:hcm23_03/features/home/pages/todo_list_page.dart';
import 'package:hcm23_03/features/splash/pages/splash_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp    (
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashPage(),
    );
  }
}
