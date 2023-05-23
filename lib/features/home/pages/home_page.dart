import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hcm23_03/features/home/cubit/home_cubit.dart';
import 'package:hcm23_03/features/home/widgets/home_drawer.dart';
import 'package:hcm23_03/features/task/pages/task_details_page.dart';
import 'package:hcm23_03/features/task/pages/task_details_page_arg.dart';

import '../../../shared/shared_ui/base_screen/base_screen.dart';
import '../../task/entities/task.dart';
import '../../task/pages/today_tasks_page.dart';
import '../widgets/home_bottom_bar.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "/HomePage";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void changePage(int? idx) {
    context.read<HomeCubit>().changePage(idx);
  }

  void createNewTask() async {
    await Navigator.of(context).pushNamed(
      TaskDetailsPage.routeName,
      arguments: TaskDetailsPageArg(homeCubit: context.read<HomeCubit>()),
    );
  }

  void addNewTaskSuccess(Task task) {}

  // late List<Task> _tasks = [];

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getTask(context);
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(builder: (context) {
      return BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Scaffold(
            drawer: const HomeDrawer(),
            floatingActionButton: FloatingActionButton(
              onPressed: createNewTask,
              backgroundColor: const Color(0xFFB7ABFD),
              child: const Icon(Icons.add),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.endDocked,
            bottomNavigationBar: HomeBottomBar(
              hasNotch: true,
              fabLocation: BubbleBottomBarFabLocation.end,
              opacity: .2,
              currentIndex: state.currentPage,
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
            body: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: context.read<HomeCubit>().pageController,
              children: [
                Scaffold(
                  appBar: AppBar(),
                  body: const Center(
                    child: Text("Tính năng đang trong quá trình phát triển"),
                  ),
                ),
                TodayTasksPage(
                  tasks: state.tasks,
                ),
                Scaffold(
                  appBar: AppBar(),
                  body: const Center(
                    child: Text("Tính năng đang trong quá trình phát triển"),
                  ),
                ),
              ],
            ),
          );
        },
      );
    });
  }
}
