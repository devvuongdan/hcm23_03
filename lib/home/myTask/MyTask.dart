import 'package:flutter/material.dart';
import 'package:infinite_scroll_tab_view/infinite_scroll_tab_view.dart';

import '../../features/myTask/Completed.dart';
import '../../features/myTask/DueSoon.dart';
import '../../features/myTask/Today.dart';
import '../../features/myTask/Upcoming.dart';

class MyTask extends StatefulWidget {
  const MyTask({super.key});
  @override
  State<MyTask> createState() => _MyTaskState();
}

class _MyTaskState extends State<MyTask> {
  final List<String> categories = [
    'Today',
    'Upcoming',
    'DueSoon',
    'Completed',
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InfiniteScrollTabView(
          contentLength: categories.length,
          onTabTap: (index) {
            debugPrint('You tapped: $index ');
          },
          tabBuilder: (index, isSelected) => Text(categories[index],
              style: TextStyle(
                  color: isSelected ? Colors.pink : Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
          pageBuilder: (context, index, _) {
            if (index == 0) {
              return const Today();
            }
            if (index == 1) {
              return const Upcoming();
            }
            if (index == 2) {
              return const DueSoon();
            }
            if (index == 4) {
              return const Completed();
            }
            return const Text('Nothing.');
          }),
    );
  }
}
