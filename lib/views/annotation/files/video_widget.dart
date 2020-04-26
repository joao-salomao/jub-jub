import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:potato_notes/entities/annotation_file.dart';

class VideoWidget extends StatefulWidget {
  final AnnotationFile annotationFile;
  VideoWidget(this.annotationFile);

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.file(widget.annotationFile.file);
    widget.annotationFile.controller = controller;
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

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
