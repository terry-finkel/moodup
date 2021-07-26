import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  HomeView createState() {
    return HomeView();
  }
}

class HomeView extends State<Home> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mood Up!"),
      ),
      backgroundColor: Colors.white,
      body: Center(
          child: ElevatedButton(
            child: Text('Bonjour. Nous allons vous aider.'),
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              int age = prefs.getInt("age") ?? -1;
              int weight = prefs.getInt("weight") ?? -1;
              String sex = prefs.getString("gender") ?? "?";

              if (age == -1 || weight == -1 || sex == "?") {
                Navigator.pushNamed(context, '/getInfo');
              } else {
                Navigator.pushNamed(context, '/evaluate', arguments: {
                  "bpm": -1.0,
                  "stress": -1.0
                });
              }
            },
          )
      ),
    );
  }
}
