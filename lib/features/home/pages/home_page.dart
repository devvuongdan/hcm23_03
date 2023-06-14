// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:hcm23_03/features/tasks/pages/new_task_page.dart';
import 'package:hcm23_03/shared/shared_ui/btn/btn_default/btn_default.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../login/pages/login_page.dart';
import '../../tasks/entities/task_model.dart';
import '../../tasks/pages/today_tasks_page.dart';
import '../widgets/bubble_bottom_bar.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "/HomePage";
  final String userId;
  const HomePage({
    Key? key,
    required this.userId,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? currentIndex = 0;
  final PageController pageController = PageController(initialPage: 1);
  void changePage(int? idx) {}

  void createNewTask() async {
    Navigator.of(context).pushNamed(NewTaskPage.routeName);
  }

  void addNewTaskSuccess(Task task) {
    setState(() {
      _tasks.add(task);
    });
  }

  void viewTask() {}
  late final List<Task> _tasks = [];

  @override
  void initState() {
    getTask();
    super.initState();
  }

  void getTask() async {}

  Future<void> _signOut() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.remove('remember');
    await preferences.remove('username');
    await preferences.remove('password');

    // Navigate back to the LoginPage
    Navigator.of(context).pushNamedAndRemoveUntil(LoginPage.routeName, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(

      //   onPressed: createNewTask,
      //   backgroundColor: const Color(0xFFB7ABFD),
      //   child: const Icon(Icons.add),
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BubbleBottomBar(
        hasNotch: true,
        fabLocation: BubbleBottomBarFabLocation.end,
        opacity: .2,
        currentIndex: currentIndex,
        onTap: (int? index) {
          setState(() {
            currentIndex = index;
          });
        },
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
            //badge: Text("1"),
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
            title: Text("All Task"),
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
              title: Text("Time")),
        ],
      ),
      body: _buildBody(currentIndex ?? 1),
    );
  }

  Widget _buildBody(int index) {
    switch (index) {
      case 1:
        return TodayTasksPage(
          userId: widget.userId,
          // tasks: _tasks,
        );
      default:
        return Center(
          child: BtnDefault(
            onTap: _signOut,
            title: "Đăng Xuất",
            height: 64,
            width: 128,
          )
        );
    }
  }
}
// I/flutter (18313): [{uid: 3bab90ba-cb8f-4ab4-98d3-12cc4ab20cff, username: 123, password: 123}, {uid: 928d62cd-5b28-47c0-b5cc-5e90514aef3c, username: 123, password: 123}, {uid: 35c03ed1-57aa-495e-974b-f9adfdd9e235, username: 123, password: 123}, {uid: 41291b19-7abf-454c-9e83-1a3c6b9582f3, username: 123, password: 123}, {uid: 1ca70e39-7922-4ec6-9666-2d48de008f97, username: 123, password: 123}, {uid: 30297697-bad8-4962-bf96-74ad2aa661ce, username: 123, password: 123}, {uid: 25e854e2-1107-402d-bf14-6a1d1fd5015d, username: qwe, password: 23}, {uid: 5c2f34a5-f3a7-489f-9b97-82c034dc1a15, username: qwer, password: 1}, {uid: ac613923-e05b-46df-bb4b-6091b38c980b, username: dung, password: 123}, {uid: 3a8d5519-8649-4b2d-b40d-dc1e2f09c5b1, username: , password: }, {uid: db0f2300-70c5-4279-938d-3020e112bbd7, username: , password: }, {uid: c3dbc0e6-356b-496a-aa05-d7aa840b89c0, username: rt, password: e4}, {uid: a00a3ddc-62f3-4a77-9187-c5a4b6722ff4, username: dung, password: 123}, {uid: eb1c5224-7279-403d-805f-a1924b4a43f9, username: dung, p
