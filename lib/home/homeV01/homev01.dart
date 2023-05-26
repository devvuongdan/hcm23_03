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
  final List<String> categories = [
    'Today',
    'Upcoming',
    'DueSoon',
    'Completed',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MediaQuery(
        data: const MediaQueryData(),
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 20, top: 100, right: 20),
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
                    SizedBox(
                      width: 55,
                      height: 55,
                      child: GestureDetector(
                        onTap: () {}, // Image tapped
                        child: Image.asset(
                          'assets/images/notification.png',
                          fit: BoxFit.fill,
                          width: 30.0,
                          height: 48.0, // Fixes border issues
                        ),
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
                  // const Expanded(child: MyTask()),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
