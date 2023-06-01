import 'package:flutter/cupertino.dart';

class WeatherTaskPage extends StatelessWidget {
  const WeatherTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [Text("Weather Page")],
      ),
    );
  }
}
