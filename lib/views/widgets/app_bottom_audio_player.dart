import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:jubjub/controllers/app_audio_player_controller.dart';


class AppBottomAudioPlayer extends StatefulWidget {
  @override
  _AppBottomAudioPlayerState createState() => _AppBottomAudioPlayerState();
}

class _AppBottomAudioPlayerState extends State<AppBottomAudioPlayer> {
  final controller = GetIt.I<AppAudioPlayerController>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (!controller.showPlayer) {
          return Container(
            height: 0,
          );
        }
        return BottomAppBar(
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                SizedBox(
                  width: 10,
                ),
                IconButton(
                  icon: Icon(
                    controller.isPlaying ? Icons.pause : Icons.play_arrow,
                    size: 40,
                  ),
                  onPressed: () {
                    controller.isPlaying
                        ? controller.pause()
                        : controller.play();
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 10,
                ),
                IconButton(
                  icon: Icon(
                    Icons.close,
                    size: 40,
                  ),
                  onPressed: () => controller.stop(),
                ),
                SizedBox(
                  width: 10,
                ),
                Row(
                  children: [
                    Text(controller.formatedCurrentDuration),
                    Container(
                      width: 170,
                      child: Slider(
                        min: 0,
                        max: controller.totaldDuration.inSeconds.toDouble() == 0
                            ? 100
                            : controller.totaldDuration.inSeconds.toDouble(),
                        onChanged: controller.setAudioDuration,
                        value: controller.currentDuration.inSeconds.toDouble(),
                      ),
                    ),
                    Text(controller.formatedTotaldDuration),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
