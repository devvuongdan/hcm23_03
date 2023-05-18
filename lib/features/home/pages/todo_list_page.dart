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
              child: Column(
                  //todo: Trinh voi Dung
                  // child: Container(
                  //   Image.asset("asset/icon/Frame 5.svg"),
                  //   Column(
                  //     Image.asset("asset/icon/Tue.svg"),
                  //     Image.asset("asset/icon/Wed.svg"),
                  //     Image.asset("asset/icon/Thu.svg"),
                  //     Image.asset("asset/icon/Fri.svg"),
                  //     Image.asset("asset/icon/Sat.svg"),
                  //     Image.asset("asset/icon/Sun.svg"),

                  //   ),
                  //   Column(
                  //     Image.asset("asset/icon/13.svg"),
                  //     Image.asset("asset/icon/14.svg"),
                  //     Image.asset("asset/icon/15.svg"),
                  //     Image.asset("asset/icon/16.svg"),
                  //     Image.asset("asset/icon/17.svg"),
                  //     Image.asset("asset/icon/18.svg"),

                  //   )
                  // ,

                  // locale: "en_US",
                  // rowHeight: 20,
                  // headerStyle:
                  //     HeaderStyle(formatButtonVisible: false, titleCentered: true),
                  // availableGestures: AvailableGestures.all,
                  // focusedDay: today,
                  // firstDay: DateTime.utc(2010, 10, 11),
                  // lastDay: DateTime.utc(2023, 10, 11),
                  // // _onDaySelected: _onDaySelected,
                  // color: Colors.white,
                  )),
          Expanded(
              // todo: Tan, HaGiaMinh, Nhat
              flex: 4,
              child: Container(
                color: Colors.blue,
              )),
        ],
      ),
    );
  }
}
