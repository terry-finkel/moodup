import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class Exercises extends StatefulWidget {
  @override
  ExercisesView createState() {
    return ExercisesView();
  }
}

class ExercisesView extends State<Exercises> with SingleTickerProviderStateMixin {
  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;

  Future<void> initializePlayer() async {
    _videoPlayerController = VideoPlayerController.network(''
        'https://github.com/p1tch-black/moodup/blob/main/videos/river.mp4?raw=true'
    );
    await _videoPlayerController.initialize();
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 16 / 9,
      autoPlay: true,
      looping: true,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

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
      body: SafeArea(
        child: Expanded(
          flex: 1,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _chewieController != null &&
                  _chewieController.videoPlayerController.value.isInitialized
                    ? SizedBox(
                        height: MediaQuery.of(context).size.width,
                        child: Chewie(controller: _chewieController)
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CircularProgressIndicator(),
                          SizedBox(height: 20)
                        ],
                      ),
                ElevatedButton(
                  child: Text("Continuer"),
                  onPressed: () {
                    _chewieController.pause();
                    Navigator.pushNamed(context, '/evaluate', arguments: {
                      "bpm": _bpm,
                      "stress": _stress
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
