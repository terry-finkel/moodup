import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  @override
  ResultView createState() {
    return ResultView();
  }
}

class ResultView extends State<Result> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mood Up!"),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: ElevatedButton(
          child: Text('Nous vous invitons à évaluer votre niveau de stress.'),
          onPressed: () {
            Navigator.pushNamed(context, '/sensor');
          },
        )
      ),
    );
  }
}
