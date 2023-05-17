import 'package:flutter/material.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              //todo: Trinh voi Dung
              child: Container(
            color: Colors.green[100],
          )),
          Expanded(
              // todo: Tan, HaGiaMinh, Nhat
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Tasks of 13rd September',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        height: 28/18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    //const SizedBox(height: 24),
                    Expanded(
                      child: _buildTaskList(),
                    ),

                    // Column(
                    //   children: [
                    //     Row(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: [
                    //         const Expanded(
                    //           flex: 1,
                    //           child: Text(
                    //             '08:30 AM',
                    //             textAlign: TextAlign.center,
                    //             style: TextStyle(
                    //               color: Colors.black87,
                    //               fontSize: 14,
                    //               height: 1.5,
                    //               fontWeight: FontWeight.w500,
                    //             ),
                    //           ),
                    //         ),
                    //         Expanded(
                    //           flex: 6,
                    //           child: Container(
                    //             margin: const EdgeInsets.only(left: 16),
                    //             decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(16),
                    //               color:
                    //                   const Color.fromRGBO(182, 146, 246, 0.15),
                    //             ),
                    //             //color: const Color.fromARGB(255, 200, 169, 235),
                    //             height: 126,
                    //             child: Padding(
                    //               padding: const EdgeInsets.symmetric(
                    //                   horizontal: 16, vertical: 8),
                    //               child: Column(
                    //                 crossAxisAlignment:
                    //                     CrossAxisAlignment.start,
                    //                 mainAxisAlignment: MainAxisAlignment.center,
                    //                 children: const [
                    //                   Text(
                    //                     'Meeting with Client',
                    //                     style: TextStyle(
                    //                       color: Colors.black87,
                    //                       fontSize: 16,
                    //                       height: 1.5,
                    //                       fontWeight: FontWeight.w700,
                    //                     ),
                    //                   ),
                    //                   SizedBox(height: 6),
                    //                   Text(
                    //                     'To discuss about the upcoming project & organization of figma files.',
                    //                     style: TextStyle(
                    //                       color: Colors.black45,
                    //                       fontSize: 12,
                    //                       height: 1.5,
                    //                       fontWeight: FontWeight.w400,
                    //                     ),
                    //                   ),
                    //                   SizedBox(height: 6),
                    //                   Text(
                    //                     '08:30 AM - 09:30 AM',
                    //                     style: TextStyle(
                    //                       color: Colors.black87,
                    //                       fontSize: 13,
                    //                       height: 1.5,
                    //                       fontWeight: FontWeight.w400,
                    //                     ),
                    //                   ),
                    //                 ],
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //     const Divider(
                    //       color: Colors.black12,
                    //       thickness: 1,
                    //       height: 48,
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

Widget _buildTaskList() {
  List<String> startTime = [
    '''
    8:30
    AM
    ''',
    '''
    9:30
    AM
    ''',
    '''
    10:30
    AM
    ''',
  ];

  List<String> taskTitles = [
    'Meeting with Client',
    'Lunch Break',
    'Daily Stand-up',
  ];
  List<String> taskDescriptions = [
    'To discuss about the upcoming project & organization of figma files.',
    'To discuss about the upcoming meeting.',
    'A stand-up meeting is a meeting in which attendees typically participate while standing. The discomfort...',
  ];
  List<String> taskTimes = [
    '08:30 AM - 09:30 AM',
    '9:30 AM - 10:30 AM',
    '10:30 AM - 11:30 AM',
  ];

  return ListView.builder(
    itemCount: taskTitles.length,
    itemBuilder: (context, index) {
      Color containerColor;
      if (index % 3 == 0) {
        containerColor = const Color.fromRGBO(182, 146, 246, 0.15);
      } else if (index % 3 == 1) {
        containerColor = const Color.fromRGBO(253, 234, 235, 1);

      } else {
        containerColor = const Color.fromRGBO(232, 245, 243, 1);

      }


      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  startTime[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                    height: 1.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  margin: const EdgeInsets.only(left: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: containerColor,
                  ),
                  //height: 126,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          taskTitles[index],
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                            height: 1.5,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          taskDescriptions[index],
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 12,
                            height: 1.5,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          taskTimes[index],
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 13,
                            height: 1.5,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (index != taskTitles.length - 1)
          
            const Divider(
              color: Colors.black12,
              thickness: 1,
              height: 48,
          ),
        ],
      );
    },
  );
}