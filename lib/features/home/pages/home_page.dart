import 'package:flutter/material.dart';
import 'package:hcm23_03/features/login/pages/login_page.dart';

import '../../tasks/entities/task.dart';
import '../../tasks/pages/today_tasks_page.dart';
import '../widgets/bubble_bottom_bar.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "/HomePage";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? currentIndex = 1;

  void changePage(int? idx) {
    setState(() {
      currentIndex = idx;
    });
  }

  void createNewTask() async {}

  void addNewTaskSuccess(Task task) {
    setState(() {
      _tasks.add(task);
    });
  }

  late final List<Task> _tasks = [];

  @override
  void initState() {
    getTask();
    super.initState();
  }

  void getTask() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: const Color(0xFFB7ABFD),
        child: const Icon(Icons.add),
      ),
<<<<<<< HEAD
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
              onPressed: () {},
              child: const Text("Pop to Home page"),
            ),
          ],
=======
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BubbleBottomBar(
        hasNotch: true,
        fabLocation: BubbleBottomBarFabLocation.end,
        opacity: .2,
        currentIndex: currentIndex,
        onTap: changePage,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(16),
>>>>>>> dev-v1
        ),
        elevation: 8,
        tilesPadding: const EdgeInsets.symmetric(
          vertical: 8.0,
        ),
        items: const <BubbleBottomBarItem>[
          BubbleBottomBarItem(
            showBadge: true,
            // badge: Text("1"),
            badgeColor: Colors.deepPurpleAccent,
            backgroundColor: Colors.red,
            icon: Icon(
              Icons.dashboard,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.dashboard,
              color: Colors.red,
            ),
            title: Text("All Tasks"),
          ),
          BubbleBottomBarItem(
              backgroundColor: Colors.deepPurple,
              icon: Icon(
                Icons.calendar_month,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.calendar_month,
                color: Colors.deepPurple,
              ),
              title: Text("T Tasks")),
          BubbleBottomBarItem(
              backgroundColor: Colors.deepPurple,
              icon: Icon(
                Icons.access_time,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.access_time,
                color: Colors.deepPurple,
              ),
              title: Text("")),
        ],
      ),
      body: TodayTasksPage(
        tasks: _tasks,
      ),
    );
  }
}
