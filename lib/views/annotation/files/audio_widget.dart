import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:jubjub/controllers/app_controller.dart';
import 'package:jubjub/models/annotation_file_model.dart';
import 'package:jubjub/controllers/app_audio_player_controller.dart';

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
    return Observer(
      builder: (_) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: ListTile(
                leading: _getLeadingIcon(),
                title: Text(
                  annotationFile.fileName,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 16,
                    color: appController.brightnessIsDark ? Colors.white : Colors.black,
                  ),
                ),
                onTap: _onTap,
              ),
            ),
          ],
        );
      },
    );
  }

  _onTap() {
    if (appAudioPlayerController.filePath == annotationFile.file.path) {
      if (appAudioPlayerController.isPlaying) {
        appAudioPlayerController.pause();
      } else {
        appAudioPlayerController.play();
      }
    } else {
      appAudioPlayerController.playAudio(annotationFile.file.path);
    }
  }

  _getLeadingIcon() {
    if (appAudioPlayerController.filePath == annotationFile.file.path &&
        appAudioPlayerController.isPlaying) {
      return Icon(Icons.pause);
    }
    return Icon(Icons.play_circle_outline);
  }
}
