import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatelessWidget {
  const VideoPlayerWidget({Key? key, required this.controller})
      : super(key: key);

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return controller != null && controller.value.isInitialized
        ? Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey),
              // borderRadius: BorderRadius.circular(10),
            ),
            height: 120,
            alignment: Alignment.topCenter,
            child: buildVideo(),
          )
        : Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey),
              // borderRadius: BorderRadius.circular(10),
            ),
            height: 120,
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          );
  }

  Widget buildVideo() {
    return buildVideoPlayer();
  }

  Widget buildVideoPlayer() {
    return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: VideoPlayer(controller),
    );
  }
}
