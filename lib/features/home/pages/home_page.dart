import 'package:flutter/material.dart';

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
  final PageController pageController = PageController(initialPage: 1);
  void changePage(int? idx) {}

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
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BubbleBottomBar(
        hasNotch: true,
        fabLocation: BubbleBottomBarFabLocation.end,
        opacity: .2,
        currentIndex: currentIndex,
        onTap: changePage,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(16),
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
