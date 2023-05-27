import 'package:flutter/material.dart';

class DueSoon extends StatefulWidget {
  const DueSoon({super.key});

  @override
  State<DueSoon> createState() => _DueSoonState();
}

class _DueSoonState extends State<DueSoon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(child: Text('This is Due Soon Screen')),
    );
  }
}
