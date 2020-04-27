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
  AnnotationFile get annotationFile => widget.annotationFile;

  @override
  void initState() {
    super.initState();
    if (annotationFile.controller == null) {
      final controller = VideoPlayerController.file(widget.annotationFile.file);
      controller.setLooping(true);
      annotationFile.controller = controller;
      init();
    }
  }

  init() {
    annotationFile.controller.initialize().then((_) => setState(() {}));
  }

  toogleVideoState() {
    final f = annotationFile.controller.value.isPlaying
        ? annotationFile.controller.pause
        : annotationFile.controller.play;
    f().then((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: toogleVideoState,
        child: AspectRatio(
          aspectRatio: annotationFile.controller.value.aspectRatio,
          child: VideoPlayer(annotationFile.controller),
        ),
      ),
    );
  }

  @override
  void dispose() {
    annotationFile.controller.pause();
    super.dispose();
  }
}
