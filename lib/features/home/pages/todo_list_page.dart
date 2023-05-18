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
}
