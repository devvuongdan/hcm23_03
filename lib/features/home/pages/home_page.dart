import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hcm23_03/features/home/cubit/home_cubit.dart';
import 'package:hcm23_03/features/home/widgets/home_drawer.dart';
import 'package:hcm23_03/features/task/pages/task_details_page.dart';
import 'package:hcm23_03/features/task/pages/task_details_page_arg.dart';
import 'package:hcm23_03/features/weather/weather_page.dart';
import 'package:hcm23_03/shared/shared_ui/themes/text_styles.dart';

import '../../../shared/shared_ui/base_screen/base_screen.dart';
import '../../../shared/shared_ui/btn/btn_default/btn_default.dart';
import '../../../shared/shared_ui/themes/colors.dart';
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
    context.read<HomeCubit>().getTask();
  }

  TextEditingController locationController = TextEditingController();
  String? city;

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
                  appBar: AppBar(
                    actions: [
                      GestureDetector(
                        child: const Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 32,
                        ),
                        onTap: () {
                          showModalBottomSheet(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(16.0),
                                topLeft: Radius.circular(16.0),
                              ),
                            ),
                            context: context,
                            builder: (BuildContext context) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom),
                                child: Container(
                                  height: 165,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  decoration: const BoxDecoration(),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Text(
                                        "Nhập nơi cần tìm",
                                        style: tStyle
                                            .paragraph14()
                                            .w700()
                                            .copyWith(
                                                color:
                                                    Hcm23Colors.colorTextTitle),
                                      ),
                                      TextField(
                                        controller: locationController,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 10),
                                        ),
                                        style: tStyle.paragraph14().w400(),
                                      ),
                                      BtnDefault(
                                        title: "Tìm vị trí này",
                                        onTap: (() {
                                          setState(() {
                                            city = locationController.text;
                                          });
                                          Navigator.pop(context);
                                        }),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  body: WeatherPage(
                    key: UniqueKey(),
                    city: city,
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
