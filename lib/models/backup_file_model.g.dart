// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'backup_file_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BackupFile on _BackupFileBase, Store {
  Computed<String> _$createdAtComputed;

  @override
  String get createdAt =>
      (_$createdAtComputed ??= Computed<String>(() => super.createdAt,
              name: '_BackupFileBase.createdAt'))
          .value;

  final _$metaDataAtom = Atom(name: '_BackupFileBase.metaData');

  @override
  drive.File get metaData {
    _$metaDataAtom.reportRead();
    return super.metaData;
  }

  @override
  set metaData(drive.File value) {
    _$metaDataAtom.reportWrite(value, super.metaData, () {
      super.metaData = value;
    });
  }

  final _$_backupProgressStreamAtom =
      Atom(name: '_BackupFileBase._backupProgressStream');

  @override
  ObservableStream<int> get _backupProgressStream {
    _$_backupProgressStreamAtom.reportRead();
    return super._backupProgressStream;
  }

  @override
  set _backupProgressStream(ObservableStream<int> value) {
    _$_backupProgressStreamAtom.reportWrite(value, super._backupProgressStream,
        () {
      super._backupProgressStream = value;
    });
  }

  final _$isDoneAtom = Atom(name: '_BackupFileBase.isDone');

  @override
  bool get isDone {
    _$isDoneAtom.reportRead();
    return super.isDone;
  }

  @override
  set isDone(bool value) {
    _$isDoneAtom.reportWrite(value, super.isDone, () {
      super.isDone = value;
    });
  }

  final _$isBackingUpAtom = Atom(name: '_BackupFileBase.isBackingUp');

  @override
  bool get isBackingUp {
    _$isBackingUpAtom.reportRead();
    return super.isBackingUp;
  }

  @override
  set isBackingUp(bool value) {
    _$isBackingUpAtom.reportWrite(value, super.isBackingUp, () {
      super.isBackingUp = value;
    });
  }

  final _$isDeletingAtom = Atom(name: '_BackupFileBase.isDeleting');

  @override
  bool get isDeleting {
    _$isDeletingAtom.reportRead();
    return super.isDeleting;
  }

  @override
  set isDeleting(bool value) {
    _$isDeletingAtom.reportWrite(value, super.isDeleting, () {
      super.isDeleting = value;
    });
  }

  final _$backupProgressAtom = Atom(name: '_BackupFileBase.backupProgress');

  @override
  int get backupProgress {
    _$backupProgressAtom.reportRead();
    return super.backupProgress;
  }

  @override
  set backupProgress(int value) {
    _$backupProgressAtom.reportWrite(value, super.backupProgress, () {
      super.backupProgress = value;
    });
  }

  final _$_BackupFileBaseActionController =
      ActionController(name: '_BackupFileBase');

  @override
  dynamic setDownloadProgressStream(Stream<int> stream) {
    final _$actionInfo = _$_BackupFileBaseActionController.startAction(
        name: '_BackupFileBase.setDownloadProgressStream');
    try {
      return super.setDownloadProgressStream(stream);
    } finally {
      _$_BackupFileBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
metaData: ${metaData},
isDone: ${isDone},
isBackingUp: ${isBackingUp},
isDeleting: ${isDeleting},
backupProgress: ${backupProgress},
createdAt: ${createdAt}
    ''';
  }
}
