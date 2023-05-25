import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const home());
}

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  final PageController pageController = PageController();
  int currentStep = 1;
  final int _currentIndex = 0;
  final List<String> categories = [
    'Today',
    'Upcoming',
    'Due Soon',
    'Completed',
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
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 20, top: 100),
                child: Row(
                  children: [
                    Container(
                        width: 48.0,
                        height: 48.0,
                        decoration: const BoxDecoration(
                          color: Colors.orange,
                          shape: BoxShape.circle,
                        )),
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Jhon Doe",
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              )),
                          Text("39 tasks today",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w200,
                              )),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: 55,
                      height: 55,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/buttonImage.png')),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20),
                decoration: const BoxDecoration(),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Container(
                          width: 10.0,
                          height: 10.0,
                          margin: const EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromARGB(255, 196, 199, 196),
                              width: 2,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.search)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 1,
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      hintText: 'Search task..',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 300),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    child: const Text("My Task",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        )),
                  ),
                  //   InfiniteScrollTabView(
                  //       contentLength: categories.length,
                  //       onTabTap: (index) {
                  //         debugPrint('You tapped: $index ');
                  //       },
                  //       tabBuilder: (index, isSelected) => Text(categories[index],
                  //           style: TextStyle(
                  //               color: isSelected ? Colors.pink : Colors.black,
                  //               fontWeight: FontWeight.bold,
                  //               fontSize: 18)),
                  //       pageBuilder: (context, index, _) {
                  //         if (index == 0) {
                  //           return const Today();
                  //         }
                  //         if (index == 1) {
                  //           return const Upcoming();
                  //         }
                  //         if (index == 2) {
                  //           return const DueSoon();
                  //         }
                  //         if (index == 4) {
                  //           return const Completed();
                  //         }
                  //         return const Text('HAHA');
                  //       }),
                ],
              )
            ],
          ),
          // bottomNavigationBar: BottomNavigationBar(
          //   backgroundColor: Colors.red,
          //   items: const [
          //     BottomNavigationBarItem(
          //         icon: Icon(Icons.pie_chart), label: "Market"),
          //     BottomNavigationBarItem(
          //         icon: Icon(Icons.list_sharp), label: "Watchlist"),
          //     BottomNavigationBarItem(
          //         icon: Icon(Icons.area_chart), label: "Trading"),
          //     BottomNavigationBarItem(icon: Icon(Icons.settings)),
          //   ],
          //   selectedItemColor: Colors.black,
          //   currentIndex: _currentIndex,
          //   unselectedItemColor: Colors.black,
          //   onTap: (value) {
          //     setState(() {
          //       _currentIndex = value;
          //     });
          //   },
          // ),
        ),
      ),
    );
  }
}
