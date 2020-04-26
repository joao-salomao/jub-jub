import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:potato_notes/entities/annotation_file.dart';
import 'package:potato_notes/views/state/app_audio_player_state.dart';

class AudioWidget extends StatelessWidget {
  final AppAudioPlayerState audioState = GetIt.I<AppAudioPlayerState>();
  final AnnotationFile annotationFile;
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
