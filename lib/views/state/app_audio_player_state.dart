import 'package:mobx/mobx.dart';
import 'package:audioplayers/audioplayers.dart';
part 'app_audio_player_state.g.dart';

class AppAudioPlayerState = _AppAudioPlayerStateBase with _$AppAudioPlayerState;

abstract class _AppAudioPlayerStateBase with Store {
  final audioPlayer = AudioPlayer();
  String filePath;

  @observable
  var isPlaying = false;

  @action
  _setIsPlaying(bool value) => isPlaying = value;

  @action
  playAudio(String path) {
    filePath = path;
    play();
  }

  @action
  play() {
    if (filePath != null) {
      audioPlayer.play(filePath).then((_) {
        _setIsPlaying(true);
      });
    }
  }

  @action
  pause() {
    audioPlayer.pause().then((_) => _setIsPlaying(false));
  }

  @action
  stop() {
    audioPlayer.stop().then((_) => _setIsPlaying(false));
  }
}
