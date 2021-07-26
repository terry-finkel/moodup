import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Result extends StatefulWidget {
  @override
  ResultView createState() {
    return ResultView();
  }
}

class ResultView extends State<Result> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final Map<String, Object> arguments = ModalRoute.of(context).settings.arguments;
    final double _bpm = arguments['bpm'];
    final double _previousBPM = arguments['previousBPM'];
    final double _previousStress = arguments['previousStress'];
    final double _stress = arguments['stress'];
    print("previous bpm: $_previousBPM | bpm: $_bpm");
    print("previous stress: $_previousStress | stress: $_stress");

    final double _diff = (_bpm * 100 / _previousBPM) * (_stress * 100 / _previousStress) / 100;
    final String _result = _diff <= 70.0 ? "G" : _diff <= 90.0 ? "N" : "B";

    print(_result);

    return Scaffold(
        appBar: AppBar(
          title: Text("Mood Up!"),
        ),
        backgroundColor: Colors.white,
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                    _result == "N" ? "😐" : _result == "B" ? "😟" : "🙂",
                    style: TextStyle(fontSize: 42)
                ),
                _result == "G"
                    ? InkWell(
                    child: Text("Lien vers le site (changer le wording)"),
                    onTap: () => launch('https://bisson.psy.free.fr')
                )
                    : ElevatedButton(
                  child: Text(_result == "N"
                      ? "C'est bien mais il faut refaire un exercice. Cela fonctionne ! Courage."
                      : "Votre stress est très important, vous devez vous focaliser encore plus sur les images et le texte. Suivez bien la respiration..."
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/exercises', arguments: {
                      "bpm": _bpm,
                      "stress": _stress
                    });
                  },
                )
              ],
            )
        )
    );
  }
}
