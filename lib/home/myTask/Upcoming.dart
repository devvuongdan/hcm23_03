import 'package:flutter/material.dart';

class Upcoming extends StatefulWidget {
  const Upcoming({super.key});

  @override
  State<Upcoming> createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(child: Text('This is UpcomingScreen')),
    );
  }
}
