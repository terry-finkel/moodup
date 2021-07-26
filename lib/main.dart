import 'package:flutter/material.dart';
import 'package:quaderi/Evaluate.dart';
import 'package:quaderi/Exercises.dart';
import 'package:quaderi/GetInfo.dart';
import 'package:quaderi/Home.dart';
import 'package:quaderi/Result.dart';
import 'package:quaderi/Sensor.dart';

void main() => runApp(MoodUp());

class MoodUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/evaluate': (context) => Evaluate(),
        '/exercises': (context) => Exercises(),
        '/getInfo': (context) => GetInfo(),
        '/result': (context) => Result(),
        '/sensor': (context) => Sensor(),
      },
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      title: 'Mood Up!',
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('fr', 'FR'),
      ],
    );
  }
}