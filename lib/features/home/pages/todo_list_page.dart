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
