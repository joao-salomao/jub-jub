import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:potato_notes/entities/annotation_file.dart';
import 'package:video_player/video_player.dart';

class AnnotationFileWidget extends StatefulWidget {
  final AnnotationFile annotationFile;
  AnnotationFileWidget(this.annotationFile);

  @override
  _AnnotationFileWidgetState createState() => _AnnotationFileWidgetState();
}

class _AnnotationFileWidgetState extends State<AnnotationFileWidget> {
  AnnotationFile get annotationFile => widget.annotationFile;

  @override
  Widget build(BuildContext context) {
    if (annotationFile.type == 'image') {
      return Image.file(
        annotationFile.file,
        fit: BoxFit.fitWidth,
      );
    }

    if (annotationFile.type == 'video') {
      final controller = VideoPlayerController.file(annotationFile.file);
      controller.initialize();
      annotationFile.controller = controller;

      final toogleVideoState = () {
        final f = annotationFile.controller.value.isPlaying
            ? annotationFile.controller.pause
            : annotationFile.controller.play;

        f().then((_) => setState(() {}));
      };

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

    if (annotationFile.type == 'audio') {
      final audioPlayer = AudioPlayer();
      return Container(
        color: Colors.black26,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
              child: Icon(
                Icons.play_arrow,
                size: 50,
              ),
              onPressed: () {
                audioPlayer
                    .play(annotationFile.file.path)
                    .then((_) => setState(() => {}));
              },
            ),
            FlatButton(
              child: Icon(
                Icons.pause,
                size: 50,
              ),
              onPressed: () {
                audioPlayer.pause().then((_) => setState(() => {}));
              },
            ),
            FlatButton(
              child: Icon(
                Icons.stop,
                size: 50,
              ),
              onPressed: () {
                audioPlayer.stop().then((_) => setState(() => {}));
              },
            ),
          ],
        ),
      );
    }

    return Container(
      color: Colors.black,
    );
  }
}
