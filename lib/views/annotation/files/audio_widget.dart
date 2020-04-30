import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:potato_notes/controllers/app_controller.dart';
import 'package:potato_notes/models/annotation_file_model.dart';
import 'package:potato_notes/controllers/app_audio_player_controller.dart';

class AudioWidget extends StatelessWidget {
  final AppController appController = GetIt.I<AppController>();
  final AppAudioPlayerController appAudioPlayerController =
      GetIt.I<AppAudioPlayerController>();
  final AnnotationFileModel annotationFile;
  final Color textColor;

  AudioWidget(
    this.annotationFile, {
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      splashColor: Colors.white70,
      child: Text(
        annotationFile.fileName,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          decoration: TextDecoration.underline,
          fontSize: 16,
          color: appController.brightness == Brightness.dark
              ? Colors.white
              : Colors.black,
        ),
      ),
      onPressed: () {
        if (appAudioPlayerController.filePath == annotationFile.file.path) {
          if (appAudioPlayerController.isPlaying) {
            appAudioPlayerController.pause();
          } else {
            appAudioPlayerController.play();
          }
        } else {
          appAudioPlayerController.playAudio(annotationFile.file.path);
        }
      },
    );
  }
}
