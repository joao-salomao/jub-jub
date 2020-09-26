import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:jubjub/controllers/app_controller.dart';
import 'package:jubjub/controllers/app_audio_player_controller.dart';

class AudioWidget extends StatelessWidget {
  final AppAudioPlayerController appAudioPlayerController =
      GetIt.I<AppAudioPlayerController>();

  final String fileName;
  final String filePath;

  Color get color =>
      GetIt.I<AppController>().brightnessIsDark ? Colors.white : Colors.black;

  AudioWidget(this.fileName, this.filePath);

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
                  fileName,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 16,
                    color: color,
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
    if (appAudioPlayerController.filePath == filePath) {
      if (appAudioPlayerController.isPlaying) {
        appAudioPlayerController.pause();
      } else {
        appAudioPlayerController.play();
      }
    } else {
      appAudioPlayerController.playAudio(filePath);
    }
  }

  _getLeadingIcon() {
    if (appAudioPlayerController.filePath == filePath &&
        appAudioPlayerController.isPlaying) {
      return Icon(Icons.pause);
    }
    return Icon(Icons.play_circle_outline);
  }
}
