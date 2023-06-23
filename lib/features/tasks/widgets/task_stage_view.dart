// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import '../entities/task_model.dart';

class CheckListRow extends StatefulWidget {
  final void Function(bool) onChangeStatus;
  final TaskStage stage;

  const CheckListRow({
    Key? key,
    required this.onChangeStatus,
    required this.stage,
  }) : super(key: key);

  @override
  _CheckListRowState createState() => _CheckListRowState();
}

class _CheckListRowState extends State<CheckListRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Container(
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 235, 235, 241),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Checkbox(
              shape: const CircleBorder(),
              checkColor: Colors.white,
              value: widget.stage.isDone,
              onChanged: (value) {
                widget.onChangeStatus.call(value == true);
              },
            ),
            const SizedBox(width: 16),
            Text(
              widget.stage.stageName,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                height: 24 / 16,
                color: Color(0xFF30374F),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
