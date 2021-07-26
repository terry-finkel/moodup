import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Exercises extends StatefulWidget {
  @override
  ExercisesView createState() {
    return ExercisesView();
  }
}

class ExercisesView extends State<Exercises> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final Map<String, Object> arguments = ModalRoute.of(context).settings.arguments;
    final double _bpm = arguments['bpm'];
    final double _stress = arguments['stress'];

    return Scaffold(
      appBar: AppBar(
        title: Text("Mood Up!"),
      ),
      backgroundColor: Colors.white,
      /* body: YoutubePlayer(
        controller: YoutubePlayerController(
          initialVideoId: 'LJ_m3boegBI', //Add videoID.
          flags: YoutubePlayerFlags(
            hideControls: false,
            controlsVisibleAtStart: true,
            autoPlay: false,
            mute: false,
          ),
        ),
        showVideoProgressIndicator: true,
      ), */
      body: Center(
        child: ElevatedButton(
          child: Text('Nous vous invitons à suivre les indications du film suivant.'),
          onPressed: () {
            Navigator.pushNamed(context, '/evaluate', arguments: {
              "previousBPM": _bpm,
              "previousStress": _stress
            });
          },
        )
      ),
    );
  }
}
