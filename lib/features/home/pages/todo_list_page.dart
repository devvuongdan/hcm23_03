import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
<<<<<<< HEAD
            //todo: Trinh voi Dung
            child: Container(
              color: Colors.white,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 30, left: 16, bottom: 10),
                        child: Text(
                          "September",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            height: 1,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15, left: 5),
                        child: SvgPicture.asset(
                          "assets/icons/chevron-down.svg",
                          width: 25,
                          height: 25,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 400,
                        height: 70,
                        child: _buildListViewBuilder(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
=======
              //todo: Trinh voi Dung
              child: Container(
            color: Colors.green,
          )),
          const Expanded(
>>>>>>> origin/dev-v1
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
            return Container(
              width: 400 / 6,
              height: 70,
              child: Column(
                children: [
                  Text(
                    cal[index][0],
                    textAlign: TextAlign.center,
                    style: TextStyle(
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
                          color: Color(0xFFEAECF0),
                          width: 2.0,
                        )),
                    child: Center(
                      child: Text(
                        cal[index][1],
                        style: TextStyle(
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
            return Container(
              width: 400 / 6,
              height: 70,
              child: Column(
                children: [
                  Text(
                    cal[index][0],
                    textAlign: TextAlign.center,
                    style: TextStyle(
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
                      color: Color.fromARGB(255, 111, 74, 203),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        cal[index][1],
                        style: TextStyle(
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
