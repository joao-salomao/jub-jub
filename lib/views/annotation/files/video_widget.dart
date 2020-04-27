import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:potato_notes/entities/annotation_file.dart';

class VideoWidget extends StatefulWidget {
  final bool shouldPauseOnDispose;
  final AnnotationFile annotationFile;
  VideoWidget(
    this.annotationFile,
    this.shouldPauseOnDispose,
  );

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  AnnotationFile get annotationFile => widget.annotationFile;
  bool get shouldPauseOnDispose => widget.shouldPauseOnDispose;
  ChewieController chewieController;

  @override
  void initState() {
    if (annotationFile.controller == null) {
      final controller = VideoPlayerController.file(widget.annotationFile.file);
      annotationFile.controller = controller;
      annotationFile.controller.initialize();
    }
    _setChewieController();
    super.initState();
  }

  _setChewieController() {
    if (chewieController == null) {
      chewieController = ChewieController(
        videoPlayerController: annotationFile.controller,
        aspectRatio: 1,
        autoPlay: false,
        looping: true,
      );
      return;
    }
    if (chewieController.videoPlayerController != annotationFile.controller) {
      chewieController = ChewieController(
        videoPlayerController: annotationFile.controller,
        aspectRatio: 1,
        autoPlay: false,
        looping: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    _setChewieController();
    return Container(
      child: Chewie(
        controller: chewieController,
      ),
    );
  }

  @override
  void dispose() {
    if (shouldPauseOnDispose) {
      chewieController.pause();
    }
    super.dispose();
  }
}
