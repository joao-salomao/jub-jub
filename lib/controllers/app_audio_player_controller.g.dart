// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_audio_player_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppAudioPlayerController on _AppAudioPlayerControllerBase, Store {
  Computed<String> _$formatedTotaldDurationComputed;

  @override
  String get formatedTotaldDuration => (_$formatedTotaldDurationComputed ??=
          Computed<String>(() => super.formatedTotaldDuration,
              name: '_AppAudioPlayerControllerBase.formatedTotaldDuration'))
      .value;
  Computed<String> _$formatedCurrentDurationComputed;

  @override
  String get formatedCurrentDuration => (_$formatedCurrentDurationComputed ??=
          Computed<String>(() => super.formatedCurrentDuration,
              name: '_AppAudioPlayerControllerBase.formatedCurrentDuration'))
      .value;
  Computed<bool> _$showPlayerComputed;

  @override
  bool get showPlayer =>
      (_$showPlayerComputed ??= Computed<bool>(() => super.showPlayer,
              name: '_AppAudioPlayerControllerBase.showPlayer'))
          .value;

  final _$isPlayingAtom = Atom(name: '_AppAudioPlayerControllerBase.isPlaying');

  @override
  bool get isPlaying {
    _$isPlayingAtom.reportRead();
    return super.isPlaying;
  }

  @override
  set isPlaying(bool value) {
    _$isPlayingAtom.reportWrite(value, super.isPlaying, () {
      super.isPlaying = value;
    });
  }

  final _$filePathAtom = Atom(name: '_AppAudioPlayerControllerBase.filePath');

  @override
  String get filePath {
    _$filePathAtom.reportRead();
    return super.filePath;
  }

  @override
  set filePath(String value) {
    _$filePathAtom.reportWrite(value, super.filePath, () {
      super.filePath = value;
    });
  }

  final _$totaldDurationAtom =
      Atom(name: '_AppAudioPlayerControllerBase.totaldDuration');

  @override
  Duration get totaldDuration {
    _$totaldDurationAtom.reportRead();
    return super.totaldDuration;
  }

  @override
  set totaldDuration(Duration value) {
    _$totaldDurationAtom.reportWrite(value, super.totaldDuration, () {
      super.totaldDuration = value;
    });
  }

  final _$currentDurationAtom =
      Atom(name: '_AppAudioPlayerControllerBase.currentDuration');

  @override
  Duration get currentDuration {
    _$currentDurationAtom.reportRead();
    return super.currentDuration;
  }

  @override
  set currentDuration(Duration value) {
    _$currentDurationAtom.reportWrite(value, super.currentDuration, () {
      super.currentDuration = value;
    });
  }

  final _$setAudioDurationAsyncAction =
      AsyncAction('_AppAudioPlayerControllerBase.setAudioDuration');

  @override
  Future setAudioDuration(double value) {
    return _$setAudioDurationAsyncAction
        .run(() => super.setAudioDuration(value));
  }

  final _$_AppAudioPlayerControllerBaseActionController =
      ActionController(name: '_AppAudioPlayerControllerBase');

  @override
  dynamic _setIsPlaying(bool value) {
    final _$actionInfo = _$_AppAudioPlayerControllerBaseActionController
        .startAction(name: '_AppAudioPlayerControllerBase._setIsPlaying');
    try {
      return super._setIsPlaying(value);
    } finally {
      _$_AppAudioPlayerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _setFilePath(String value) {
    final _$actionInfo = _$_AppAudioPlayerControllerBaseActionController
        .startAction(name: '_AppAudioPlayerControllerBase._setFilePath');
    try {
      return super._setFilePath(value);
    } finally {
      _$_AppAudioPlayerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _setTotaldDuration(Duration value) {
    final _$actionInfo = _$_AppAudioPlayerControllerBaseActionController
        .startAction(name: '_AppAudioPlayerControllerBase._setTotaldDuration');
    try {
      return super._setTotaldDuration(value);
    } finally {
      _$_AppAudioPlayerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _setCurrentDuration(Duration value) {
    final _$actionInfo = _$_AppAudioPlayerControllerBaseActionController
        .startAction(name: '_AppAudioPlayerControllerBase._setCurrentDuration');
    try {
      return super._setCurrentDuration(value);
    } finally {
      _$_AppAudioPlayerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic playAudio(String path) {
    final _$actionInfo = _$_AppAudioPlayerControllerBaseActionController
        .startAction(name: '_AppAudioPlayerControllerBase.playAudio');
    try {
      return super.playAudio(path);
    } finally {
      _$_AppAudioPlayerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic play() {
    final _$actionInfo = _$_AppAudioPlayerControllerBaseActionController
        .startAction(name: '_AppAudioPlayerControllerBase.play');
    try {
      return super.play();
    } finally {
      _$_AppAudioPlayerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic pause() {
    final _$actionInfo = _$_AppAudioPlayerControllerBaseActionController
        .startAction(name: '_AppAudioPlayerControllerBase.pause');
    try {
      return super.pause();
    } finally {
      _$_AppAudioPlayerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic stop() {
    final _$actionInfo = _$_AppAudioPlayerControllerBaseActionController
        .startAction(name: '_AppAudioPlayerControllerBase.stop');
    try {
      return super.stop();
    } finally {
      _$_AppAudioPlayerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isPlaying: ${isPlaying},
filePath: ${filePath},
totaldDuration: ${totaldDuration},
currentDuration: ${currentDuration},
formatedTotaldDuration: ${formatedTotaldDuration},
formatedCurrentDuration: ${formatedCurrentDuration},
showPlayer: ${showPlayer}
    ''';
  }
}
