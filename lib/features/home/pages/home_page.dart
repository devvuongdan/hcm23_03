import 'package:flutter/material.dart';
import 'package:hcm23_03/features/home/pages/screen1.dart';
import 'package:hcm23_03/features/login/pages/login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
        
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/Screen1");
              },
              child: const Text("Go to Screen1"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Pop to last Screen"),
            ),
          ],
        ),
      ),
    );
  }
}

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen1"),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/Screen2");
              },
              child: const Text("Go to Screen2"),
            ),
            TextButton(              
              onPressed: () {
                Navigator.of(context).popUntil(
                  ModalRoute.withName("/LoginPage"),
                );
              },
              child: const Text("Pop to Login"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).popUntil(
                  ModalRoute.withName("/SplashPage"),
                );
              },
              child: const Text("Pop to Splash"),
            ),
          ],
        ),
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen2"),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              
              onPressed: () {
                
                Navigator.of(context).pop();
              },
              child: const Text("Pop to last Screen (Screen 1)"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).popUntil(
                  ModalRoute.withName("/HomePage"),
                );
              },
              child: const Text("Pop to Home page"),
            ),
             TextButton(
              onPressed: () {
                Navigator.of(context).popUntil(
                  ModalRoute.withName("/LoginPage"),
                );
              },
              child: const Text("Pop to Login"),
            ),
          ],
        ),
      ),
    );
  }
}
