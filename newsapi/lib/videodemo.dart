import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Videodemo extends StatefulWidget {
  const Videodemo({Key? key}) : super(key: key);

  @override
  _VideodemoState createState() => _VideodemoState();
}

class _VideodemoState extends State<Videodemo> {
  late VideoPlayerController _controller;
  // late VoidCallback onPlay;
  bool isPlaying = true;
  double currentPlayerTime = 0;
  double videoPositionTime = 0;
  double totalvideoTime = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _controller = VideoPlayerController.asset("assets/video.mp4");
    _controller = VideoPlayerController.network(
        "https://vmlane.com/ios/raw/MobileDemo.mp4");
    initData();
  }

  initData() async {
    await _controller.initialize();
    _controller.addListener(() {
      print(_controller.value.position.inSeconds);
      setState(() {
        totalvideoTime = _controller.value.duration.inSeconds.toDouble();
        videoPositionTime = _controller.value.position.inSeconds.toDouble();
        currentPlayerTime = _controller.value.position.inSeconds /
            _controller.value.duration.inSeconds;
      });
    });
    _controller.play();
    _controller.setLooping(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AspectRatio(
        aspectRatio: MediaQuery.of(context).size.width /
            MediaQuery.of(context)
                .size
                .height, // _controller_value_aspectRatio,
        child: Stack(
          children: [
            GestureDetector(
              child: VideoPlayer(_controller),
              onTap: () {
                if (_controller.value.isPlaying) {
                  _controller.pause();
                  setState(() {
                    isPlaying = false;
                  });
                } else {
                  _controller.play();
                  setState(() {
                    isPlaying = true;
                  });
                }
                // IconButton(
                //   icon: Icon(Icons.play_arrow),
                //   iconSize: 24.0,
                //   color: Colors.grey,
                //   onPressed: this.onPlay,
                // );
              },
            ),
            if (!isPlaying) ...[
              Center(
                child: Icon(
                  Icons.play_arrow,
                  color: Colors.yellow,
                  size: 100,
                ),
              )
            ],
            SizedBox(
              height: 50,
              child: Slider(
                  min: 0,
                  max: totalvideoTime,
                  value: videoPositionTime,
                  onChanged: (val) {
                    setState(() {
                      videoPositionTime = val;
                    });
                    _controller.seekTo(Duration(seconds: val.toInt()));
                  }),
            ),
            // Align(
            //   alignment: Alignment.bottomCenter,
            //   child: LinearProgressIndicator(
            //     value: currentPlayerTime,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
