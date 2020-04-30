// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_audio_player_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppAudioPlayerController on _AppAudioPlayerControllerBase, Store {
  Computed<String> _$formatedTotaldDurationComputed;

  @override
  String get formatedTotaldDuration => (_$formatedTotaldDurationComputed ??=
          Computed<String>(() => super.formatedTotaldDuration))
      .value;
  Computed<String> _$formatedCurrentDurationComputed;

  @override
  String get formatedCurrentDuration => (_$formatedCurrentDurationComputed ??=
          Computed<String>(() => super.formatedCurrentDuration))
      .value;
  Computed<bool> _$showPlayerComputed;

  @override
  bool get showPlayer =>
      (_$showPlayerComputed ??= Computed<bool>(() => super.showPlayer)).value;

  final _$isPlayingAtom = Atom(name: '_AppAudioPlayerControllerBase.isPlaying');

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

  final _$filePathAtom = Atom(name: '_AppAudioPlayerControllerBase.filePath');

  @override
  String get filePath {
    _$filePathAtom.context.enforceReadPolicy(_$filePathAtom);
    _$filePathAtom.reportObserved();
    return super.filePath;
  }

  @override
  set filePath(String value) {
    _$filePathAtom.context.conditionallyRunInAction(() {
      super.filePath = value;
      _$filePathAtom.reportChanged();
    }, _$filePathAtom, name: '${_$filePathAtom.name}_set');
  }

  final _$totaldDurationAtom =
      Atom(name: '_AppAudioPlayerControllerBase.totaldDuration');

  @override
  Duration get totaldDuration {
    _$totaldDurationAtom.context.enforceReadPolicy(_$totaldDurationAtom);
    _$totaldDurationAtom.reportObserved();
    return super.totaldDuration;
  }

  @override
  set totaldDuration(Duration value) {
    _$totaldDurationAtom.context.conditionallyRunInAction(() {
      super.totaldDuration = value;
      _$totaldDurationAtom.reportChanged();
    }, _$totaldDurationAtom, name: '${_$totaldDurationAtom.name}_set');
  }

  final _$currentDurationAtom =
      Atom(name: '_AppAudioPlayerControllerBase.currentDuration');

  @override
  Duration get currentDuration {
    _$currentDurationAtom.context.enforceReadPolicy(_$currentDurationAtom);
    _$currentDurationAtom.reportObserved();
    return super.currentDuration;
  }

  @override
  set currentDuration(Duration value) {
    _$currentDurationAtom.context.conditionallyRunInAction(() {
      super.currentDuration = value;
      _$currentDurationAtom.reportChanged();
    }, _$currentDurationAtom, name: '${_$currentDurationAtom.name}_set');
  }

  final _$setAudioDurationAsyncAction = AsyncAction('setAudioDuration');

  @override
  Future setAudioDuration(double value) {
    return _$setAudioDurationAsyncAction
        .run(() => super.setAudioDuration(value));
  }

  final _$_AppAudioPlayerControllerBaseActionController =
      ActionController(name: '_AppAudioPlayerControllerBase');

  @override
  dynamic _setIsPlaying(bool value) {
    final _$actionInfo =
        _$_AppAudioPlayerControllerBaseActionController.startAction();
    try {
      return super._setIsPlaying(value);
    } finally {
      _$_AppAudioPlayerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _setFilePath(String value) {
    final _$actionInfo =
        _$_AppAudioPlayerControllerBaseActionController.startAction();
    try {
      return super._setFilePath(value);
    } finally {
      _$_AppAudioPlayerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _setTotaldDuration(Duration value) {
    final _$actionInfo =
        _$_AppAudioPlayerControllerBaseActionController.startAction();
    try {
      return super._setTotaldDuration(value);
    } finally {
      _$_AppAudioPlayerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _setCurrentDuration(Duration value) {
    final _$actionInfo =
        _$_AppAudioPlayerControllerBaseActionController.startAction();
    try {
      return super._setCurrentDuration(value);
    } finally {
      _$_AppAudioPlayerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic playAudio(String path) {
    final _$actionInfo =
        _$_AppAudioPlayerControllerBaseActionController.startAction();
    try {
      return super.playAudio(path);
    } finally {
      _$_AppAudioPlayerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic play() {
    final _$actionInfo =
        _$_AppAudioPlayerControllerBaseActionController.startAction();
    try {
      return super.play();
    } finally {
      _$_AppAudioPlayerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic pause() {
    final _$actionInfo =
        _$_AppAudioPlayerControllerBaseActionController.startAction();
    try {
      return super.pause();
    } finally {
      _$_AppAudioPlayerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic stop() {
    final _$actionInfo =
        _$_AppAudioPlayerControllerBaseActionController.startAction();
    try {
      return super.stop();
    } finally {
      _$_AppAudioPlayerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'isPlaying: ${isPlaying.toString()},filePath: ${filePath.toString()},totaldDuration: ${totaldDuration.toString()},currentDuration: ${currentDuration.toString()},formatedTotaldDuration: ${formatedTotaldDuration.toString()},formatedCurrentDuration: ${formatedCurrentDuration.toString()},showPlayer: ${showPlayer.toString()}';
    return '{$string}';
  }
}
