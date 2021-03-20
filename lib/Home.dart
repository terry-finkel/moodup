import 'package:flutter/material.dart';

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
      backgroundColor: Colors.white,
      body: Center(
        child: ElevatedButton(
          child: Text('Go to sensor'),
          onPressed: () {
            Navigator.pushNamed(context, '/sensor');
          },
        ),
      ),
    );
  }
}
