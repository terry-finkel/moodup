import 'package:flutter/material.dart';

class AutoEvaluate extends StatefulWidget {
  @override
  AutoEvaluateView createState() {
    return AutoEvaluateView();
  }
}

class AutoEvaluateView extends State<AutoEvaluate> with SingleTickerProviderStateMixin {
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
