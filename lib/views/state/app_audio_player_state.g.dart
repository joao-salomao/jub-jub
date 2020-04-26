// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_audio_player_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppAudioPlayerState on _AppAudioPlayerStateBase, Store {
  final _$isPlayingAtom = Atom(name: '_AppAudioPlayerStateBase.isPlaying');

  @override
  bool get isPlaying {
    _$isPlayingAtom.context.enforceReadPolicy(_$isPlayingAtom);
    _$isPlayingAtom.reportObserved();
    return super.isPlaying;
  }

  @override
  set isPlaying(bool value) {
    _$isPlayingAtom.context.conditionallyRunInAction(() {
      super.isPlaying = value;
      _$isPlayingAtom.reportChanged();
    }, _$isPlayingAtom, name: '${_$isPlayingAtom.name}_set');
  }

  final _$_AppAudioPlayerStateBaseActionController =
      ActionController(name: '_AppAudioPlayerStateBase');

  @override
  dynamic _setIsPlaying(bool value) {
    final _$actionInfo =
        _$_AppAudioPlayerStateBaseActionController.startAction();
    try {
      return super._setIsPlaying(value);
    } finally {
      _$_AppAudioPlayerStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic playAudio(String path) {
    final _$actionInfo =
        _$_AppAudioPlayerStateBaseActionController.startAction();
    try {
      return super.playAudio(path);
    } finally {
      _$_AppAudioPlayerStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic play() {
    final _$actionInfo =
        _$_AppAudioPlayerStateBaseActionController.startAction();
    try {
      return super.play();
    } finally {
      _$_AppAudioPlayerStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic pause() {
    final _$actionInfo =
        _$_AppAudioPlayerStateBaseActionController.startAction();
    try {
      return super.pause();
    } finally {
      _$_AppAudioPlayerStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic stop() {
    final _$actionInfo =
        _$_AppAudioPlayerStateBaseActionController.startAction();
    try {
      return super.stop();
    } finally {
      _$_AppAudioPlayerStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'isPlaying: ${isPlaying.toString()}';
    return '{$string}';
  }
}
