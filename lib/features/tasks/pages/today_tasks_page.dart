// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../../../main.dart';
import '../../../shared/shared_ui/base_screen/base_screen.dart';
import '../entities/task.dart';
import '../widgets/task_card.dart';

class TodayTasksPage extends StatefulWidget {
  const TodayTasksPage({
    Key? key,
  }) : super(key: key);

  @override
  State<TodayTasksPage> createState() => _TodayRecordsPageState();
}

class _TodayRecordsPageState extends State<TodayTasksPage> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(builder: (context) {
      return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Today Task",
            ),
          ),
          body: Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            height: double.infinity,
            child: FutureBuilder(
              future: loadJsonData(),
              builder: (context, snapshot) {
                if (snapshot.hasData && (snapshot.data as List).isNotEmpty) {
                  final List<Task> task = snapshot.data as List<Task>;
                  return ListView.separated(
                    padding: const EdgeInsets.only(bottom: 20),
                    itemBuilder: (context, index) {
                      final color =
                          Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                              .withOpacity(0.1);
                      return TaskCard(
                        task: task[index],
                        color: color,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        height: 0.5,
                        width: double.infinity,
                        color: Colors.black,
                      );
                    },
                    itemCount: task.length,
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ));
    });
  }
}
