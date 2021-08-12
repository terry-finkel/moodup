import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

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

    final YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: 'LJ_m3boegBI'
    );

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
            YoutubePlayerControllerProvider(
              controller: _controller,
              child: YoutubePlayerIFrame(aspectRatio: 16 / 9),
            ),
            YoutubePlayerControllerProvider(
              controller: _controller,
              child: ElevatedButton(
                child: Text("Continuer"),
                onPressed: () {
                  print(_controller);
                  _controller.pause();
                  Navigator.pushNamed(context, '/evaluate', arguments: {
                    "bpm": _bpm,
                    "stress": _stress
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
