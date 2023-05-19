import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // DateTime today = DateTime.now();
    return Scaffold(
      // void _onDaySelected(DateTime day, DateTime focusedDay) {
      //   setState(() {
      //     today = day;
      //   });
      // }
      body: Column(
        children: [
          Expanded(
              //todo: Trinh voi Dung
              child: Container(
            color: Colors.green,
          )),
          const Expanded(
              // todo: Tan, HaGiaMinh, Nhat
              flex: 4,
              child: Text(
                "a",
                style: TextStyle(
                    leadingDistribution: TextLeadingDistribution.even),
              )),
        ],
      ),
    );
  }
}
