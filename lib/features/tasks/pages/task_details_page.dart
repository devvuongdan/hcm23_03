// import 'package:flutter/material.dart';

// import '../entities/task.dart';

// class TaskDetailsPage extends StatelessWidget {
//   final Task task;
//   const TaskDetailsPage({super.key, required this.task});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text("Task Details"),
//         ),
//         body: Center(
//           child: Text("${task.description}"),
//         ));
//   }
// }
import 'package:flutter/material.dart';
import 'package:hcm23_03/features/home/pages/task/data.dart';
import 'package:hcm23_03/features/tasks/entities/task.dart';
import '../pages/today_tasks_page.dart';
import '../widgets/task_card.dart';

class CheckListRow extends StatefulWidget {
  final String content;

  const CheckListRow({super.key, required this.content});

  @override
  _CheckListRowState createState() => _CheckListRowState();
}

class _CheckListRowState extends State<CheckListRow> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Transform.scale(
            scale: 1,
            child: Checkbox(
              
              shape: const CircleBorder(),
              checkColor: Colors.white,
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = value ?? false;
                });
              },
            ),
          ),
          SizedBox(width: 8),
          Text(
            widget.content,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class TaskDetailsPage extends StatelessWidget {
  final Task task;
  const TaskDetailsPage({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Task Details"),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  Navigator.of(context).pushNamed("/HomePage");
                },
              ),
            ]),
      ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       const Text('Task Details'),
      //       const SizedBox(height: 16),
      //       ElevatedButton(
      //         onPressed: () {
      //           Navigator.pop(context); // Pop back to the previous screen
      //         },
      //         child: const Text('Go Back'),
      //       ),
      //     ],
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Task Title',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                  height: 20 / 14,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                task.title ?? 'No Title',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  height: 28 / 20,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Due Date',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                  height: 20 / 14,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.access_time,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 8),
                    Text(
                        "${task.dueTime!.hour}:${task.dueTime!.minute} ${task.dueTime!.hour > 12 ? 'PM' : 'AM'} ${task.dueTime!.day} ${task.dueTime!.month} ${task.dueTime!.year}",
                        style: const TextStyle(
                          fontSize: 16,
                        )),
                    const Spacer(),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.green[50],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Text(
                          'On Progress',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 18, 67, 21),
                            fontWeight: FontWeight.normal,
                          ),
                        )),
                  ]),
              const SizedBox(height: 16),
              const Text(
                'Description',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                  height: 20 / 14,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                task.description ?? 'No Description',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  height: 20 / 14,
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 40,
                child: Stack(
                  children: [
                    for (var i = 0; i < [1, 2, 3, 4].length; i++)
                      Positioned(
                        left: (i * (1 - .4) * 40).toDouble(),
                        top: 0,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 18,
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 2),
                                borderRadius: BorderRadius.circular(50)),
                            padding: const EdgeInsets.all(5.0),
                            child: Image.network(
                              "https://github.com/identicons/guest.png",
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text('Stages of Task',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  )),
              Column(
                children: [
                  for (var i = 0; i < task.taskStages.length; i++)
                    CheckListRow(content: "${task.taskStages[i].description}"),
                ],
              )
            ]),
      ),
    );
  }
}
