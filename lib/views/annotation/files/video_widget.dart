import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends StatefulWidget {
  final File file;
  VideoWidget(this.file);

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.file(widget.file);
    init();
  }

  init() {
    controller.initialize().then((_) => setState(() {}));
  }

  toogleVideoState() {
    final f = controller.value.isPlaying ? controller.pause : controller.play;
    f().then((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: toogleVideoState,
        child: AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: VideoPlayer(controller),
        ),
      ),
    );
  }
}
