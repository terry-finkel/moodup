import 'package:flutter/material.dart';
import 'package:quaderi/Home.dart';
import 'package:quaderi/Sensor.dart';

void main() => runApp(MoodUp());

class MoodUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/sensor': (context) => Sensor(),
      },
      theme: ThemeData(
        brightness: Brightness.light
      ),
      title: 'Mood Up',
    );
  }
}
