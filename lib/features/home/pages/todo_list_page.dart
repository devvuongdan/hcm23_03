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

  Widget _buildListViewBuilder() {
    List<List> cal = [
      ["Tue", "13"],
      ["Wed", "14"],
      ["Thu", "15"],
      ["Fri", "16"],
      ["Sat", "17"],
      ["Sun", "18"]
    ];
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cal.length,
        itemBuilder: (context, index) {
          if (cal[index][1] != "15") {
            return SizedBox(
              width: 400 / 6,
              height: 70,
              child: Column(
                children: [
                  Text(
                    cal[index][0],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      height: 20 / 14,
                      color: Color(0xFF5D6B98),
                    ),
                  ),
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFFEAECF0),
                          width: 2.0,
                        )),
                    child: Center(
                      child: Text(
                        cal[index][1],
                        style: const TextStyle(
                          leadingDistribution: TextLeadingDistribution.even,
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return SizedBox(
              width: 400 / 6,
              height: 70,
              child: Column(
                children: [
                  Text(
                    cal[index][0],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      height: 20 / 14,
                      color: Color(0xFF5D6B98),
                    ),
                  ),
                  Container(
                    width: 36,
                    height: 36,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 111, 74, 203),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        cal[index][1],
                        style: const TextStyle(
                          leadingDistribution: TextLeadingDistribution.even,
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        });
  }
}
