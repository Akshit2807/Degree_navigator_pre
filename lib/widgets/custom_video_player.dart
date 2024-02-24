import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../constants/icons.dart';

class CustomVideoPlayer extends StatefulWidget {
  final String videoUrl;
  const CustomVideoPlayer({
    required this.videoUrl,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late VideoPlayerController _controller;
  Widget? controls;




  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      widget.videoUrl
         // 'https://download-video.akamaized.net/v3-1/playback/31e026a5-d8b9-4bfd-b7e5-97a759a7f0c1/c2831d0a?__token__=st=1708812059~exp=1708826459~acl=%2Fv3-1%2Fplayback%2F31e026a5-d8b9-4bfd-b7e5-97a759a7f0c1%2Fc2831d0a%2A~hmac=e663ced034a775f24fa00e92a1bd10ff868a19ad1058d38b0a4c21c0fdd1880c&r=dXMtY2VudHJhbDE%3D',
    )
    // _controller = VideoPlayerController.asset(
    //   'assets/videos/25666164.mp4',
    // )
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
        _controller.play();
      })
      ..addListener(() {
        if (_controller.value.isPlaying) {
          controls = GestureDetector(
            onTap: () {
              setState(() {
                _controller.pause();
              });
            },
            child: Image.asset(
              icPause,
              height: 50,
            ),
          );
        } else if (_controller.value.position.inMilliseconds -
            _controller.value.duration.inMilliseconds <
            1) {
          setState(() {
            controls = GestureDetector(
              onTap: () {
                setState(() {
                  _controller.play();
                });
              },

              child: Image.asset(
                icLearning,
                height: 50,
              ),
            );
          });
        } else {
          controls = GestureDetector(
            onTap: () {
              setState(() {
                _controller.play();
              });
            },
            child: Image.asset(
              icLearning,
              height: 50,
            ),
          );
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: Stack(
        children: [
          VideoPlayer(
            _controller,
          ),
          Positioned.fill(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [controls ?? Container()],
            ),
          )
        ],
      ),
    );
  }
}


