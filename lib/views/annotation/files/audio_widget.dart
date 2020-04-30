import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:potato_notes/models/annotation_file_model.dart';
import 'package:potato_notes/controllers/app_audio_player_controller.dart';

class AudioWidget extends StatelessWidget {
  final AppAudioPlayerController audioState = GetIt.I<AppAudioPlayerController>();
  final AnnotationFileModel annotationFile;
  final Color textColor;

  AudioWidget(
    this.annotationFile, {
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      hoverColor: Colors.yellowAccent,
      splashColor: Colors.white70,
      child: Text(
        annotationFile.fileName,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          decoration: TextDecoration.underline,
          fontSize: 16,
          color: Colors.white,
        ),
      ),
      onPressed: () {
        if (audioState.filePath == annotationFile.file.path) {
          if (audioState.isPlaying) {
            audioState.pause();
          } else {
            audioState.play();
          }
        } else {
          audioState.playAudio(annotationFile.file.path);
        }
      },
    );
  }
}
