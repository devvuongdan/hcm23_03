// ignore_for_file: public_member_api_docs, sort_constructors_first, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hcm23_03/features/change_password/pages/change_password_page.dart';

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
    Navigator.of(context)
        .pushNamedAndRemoveUntil(LoginPage.routeName, (route) => false);
  }

  void _navigateToChangePasswordPage() {
    Navigator.of(context).pushNamed(
      ChangePasswordPage.routeName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: _buildHomeDrawer(context),
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

  Drawer _buildHomeDrawer(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width * 0.75,
        child: Column(children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                children: [
                  DrawerHeader(
                    decoration: const BoxDecoration(
                      color: Color(0xFFB7ABFD),
                    ),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.75,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  )
                ],
              ),
              const CircleAvatar(
                radius: 60,
                backgroundColor: Colors.green,
                child: CircleAvatar(
                  radius: 58,
                  backgroundImage: AssetImage('assets/images/Avatar1.png'),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Wang Yin",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(
                width: 6,
              ),
              Image.asset("assets/images/tick_square.png"),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Column(
            children: [
              TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Thông tin người dùng',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      "assets/icons/angle_right_solid.svg",
                      fit: BoxFit.contain,
                      height: 20,
                      width: 20,
                    ),
                  ],
                ),
              ),
              const Divider(
                indent: 12,
                endIndent: 12,
                thickness: 1,
                height: 16,
              ),
              TextButton(
                onPressed: () {
                  _navigateToChangePasswordPage();
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Đổi mật khẩu',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      "assets/icons/angle_right_solid.svg",
                      fit: BoxFit.contain,
                      height: 20,
                      width: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          Padding(
              padding: const EdgeInsets.all(20),
              child: BtnDefault(
                onTap: _signOut,
                title: "Đăng Xuất",
                height: 64,
                width: 128,
                type: BtnDefaultType.secondary,
              ))
        ]),
      ),
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
        return const Center(
          child: Text(
            "Tính năng đang trong quá trìh phát triển",
          ),
        );
    }
  }
}
