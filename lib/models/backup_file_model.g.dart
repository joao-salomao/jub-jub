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

  final _$backupStreamAtom = Atom(name: '_BackupFileBase.backupStream');

  @override
  ObservableStream<int> get backupStream {
    _$backupStreamAtom.reportRead();
    return super.backupStream;
  }

  @override
  set backupStream(ObservableStream<int> value) {
    _$backupStreamAtom.reportWrite(value, super.backupStream, () {
      super.backupStream = value;
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

  final _$hasErrorAtom = Atom(name: '_BackupFileBase.hasError');

  @override
  bool get hasError {
    _$hasErrorAtom.reportRead();
    return super.hasError;
  }

  @override
  set hasError(bool value) {
    _$hasErrorAtom.reportWrite(value, super.hasError, () {
      super.hasError = value;
    });
  }

  final _$isDownloadingAtom = Atom(name: '_BackupFileBase.isDownloading');

  @override
  bool get isDownloading {
    _$isDownloadingAtom.reportRead();
    return super.isDownloading;
  }

  @override
  set isDownloading(bool value) {
    _$isDownloadingAtom.reportWrite(value, super.isDownloading, () {
      super.isDownloading = value;
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

  final _$downloadFileAsyncAction = AsyncAction('_BackupFileBase.downloadFile');

  @override
  Future downloadFile() {
    return _$downloadFileAsyncAction.run(() => super.downloadFile());
  }

  @override
  String toString() {
    return '''
metaData: ${metaData},
backupStream: ${backupStream},
isDone: ${isDone},
hasError: ${hasError},
isDownloading: ${isDownloading},
isDeleting: ${isDeleting},
createdAt: ${createdAt}
    ''';
  }
}
