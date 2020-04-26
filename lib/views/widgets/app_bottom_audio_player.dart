import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:potato_notes/views/state/app_audio_player_state.dart';

class AppBottomAudioPlayer extends StatefulWidget {
  @override
  _AppBottomAudioPlayerState createState() => _AppBottomAudioPlayerState();
}

class _AppBottomAudioPlayerState extends State<AppBottomAudioPlayer> {
  final audioState = GetIt.I<AppAudioPlayerState>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (!audioState.showPlayer) {
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
            child: Card(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    icon: Icon(
                      audioState.isPlaying ? Icons.pause : Icons.play_arrow,
                      size: 40,
                    ),
                    onPressed: () {
                      audioState.isPlaying
                          ? audioState.pause()
                          : audioState.play();
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
                      Icons.stop,
                      size: 40,
                    ),
                    onPressed: () => audioState.stop(),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: [
                      Text(audioState.formatedCurrentDuration),
                      Container(
                        width: 170,
                        child: Slider(
                          min: 0,
                          max: audioState.totaldDuration.inSeconds.toDouble() ==
                                  0
                              ? 100
                              : audioState.totaldDuration.inSeconds.toDouble(),
                          onChanged: audioState.setAudioDuration,
                          value:
                              audioState.currentDuration.inSeconds.toDouble(),
                        ),
                      ),
                      Text(audioState.formatedTotaldDuration),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
