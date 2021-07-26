import 'package:flutter/material.dart';

class Evaluate extends StatefulWidget {
  @override
  EvaluateView createState() {
    return EvaluateView();
  }
}

class EvaluateView extends State<Evaluate> with SingleTickerProviderStateMixin {
  double _stress = 0;

  @override
  Widget build(BuildContext context) {
    final Map<String, Object> arguments = ModalRoute.of(context).settings.arguments;
    final double _previousBPM = arguments['bpm'];
    final double _previousStress = arguments['stress'];

    return Scaffold(
      appBar: AppBar(
        title: Text("Mood Up!"),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Nous vous invitons à évaluer votre niveau de stress.\n\nDe 0 (pas de stress),\nà 10 (stress le plus fort que j\'ai connu).',
              textAlign: TextAlign.center,
            ),
            Slider(
                value: _stress,
                min: 0,
                max: 10,
                divisions: 10,
                label: _stress.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _stress = value;
                  });
                }),
            ElevatedButton(
              child: Text('Continuer'),
              onPressed: () {
                Navigator.pushNamed(context, '/sensor', arguments: {
                  "previousBPM": _previousBPM,
                  "previousStress": _previousStress,
                  "stress": _stress
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
