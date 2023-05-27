import 'package:flutter/material.dart';

import 'homeV01/homev01.dart';
import 'myTask/Completed.dart';
import 'myTask/DueSoon.dart';
import 'myTask/Upcoming.dart';

void main(List<String> args) {
  runApp(const Home());
}

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
        iconTheme: const IconThemeData(color: Colors.purpleAccent),
        primaryTextTheme:
            const TextTheme(titleLarge: TextStyle(color: Colors.yellowAccent)),
        textTheme: Theme.of(context)
            .textTheme
            .apply(bodyColor: Colors.cyan, displayColor: Colors.yellowAccent),
        fontFamily: 'Monotype Coursiva',
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  static const String routeName = "/HomePage";
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController pageController = PageController();
  int currentStep = 1;
  int _currentIndex = 0;
  final List<Widget> _screen = [
    const home(),
    const Upcoming(),
    const DueSoon(),
    const Completed(),
  ];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  void handleFloatingActionButton() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MediaQuery(
        data: const MediaQueryData(),
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            mini: false,
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          body: _screen[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.red,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.punch_clock_rounded), label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_month), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
            ],
            selectedItemColor: Colors.black,
            currentIndex: _currentIndex,
            unselectedItemColor: Colors.grey,
            onTap: (value) {
              setState(() {
                _currentIndex = value;
              });
            },
          ),
        ),
      ),
    );
  }
}
