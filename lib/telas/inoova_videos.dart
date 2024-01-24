import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class InoovaVideos extends StatefulWidget {
  const InoovaVideos({super.key});

  @override
  State<InoovaVideos> createState() => _InoovaVideosState();
}

class _InoovaVideosState extends State<InoovaVideos> {

  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      "assets/videos/videoteste.mp4")
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });

    /*
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://sample-videos.com/video321/mp4/720/big_buck_bunny_720p_10mb.mp4'))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });

     */
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Inoova Videos",
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: _controller.value.isInitialized
              ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
              : Container(),//Texto Aperte o Play
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying
                ? Icons.pause
                : Icons.play_arrow,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
