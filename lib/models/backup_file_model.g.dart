// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'backup_file_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BackupFile on _BackupFileBase, Store {
  Computed<String> _$createdAtComputed;

  @override
  String get createdAt =>
      (_$createdAtComputed ??= Computed<String>(() => super.createdAt)).value;

  final _$fileAtom = Atom(name: '_BackupFileBase.file');

  @override
  io.File get file {
    _$fileAtom.context.enforceReadPolicy(_$fileAtom);
    _$fileAtom.reportObserved();
    return super.file;
  }

  @override
  set file(io.File value) {
    _$fileAtom.context.conditionallyRunInAction(() {
      super.file = value;
      _$fileAtom.reportChanged();
    }, _$fileAtom, name: '${_$fileAtom.name}_set');
  }

  final _$metaDataAtom = Atom(name: '_BackupFileBase.metaData');

  @override
  drive.File get metaData {
    _$metaDataAtom.context.enforceReadPolicy(_$metaDataAtom);
    _$metaDataAtom.reportObserved();
    return super.metaData;
  }

  @override
  set metaData(drive.File value) {
    _$metaDataAtom.context.conditionallyRunInAction(() {
      super.metaData = value;
      _$metaDataAtom.reportChanged();
    }, _$metaDataAtom, name: '${_$metaDataAtom.name}_set');
  }

  final _$fileStreamAtom = Atom(name: '_BackupFileBase.fileStream');

  @override
  ObservableStream<List<int>> get fileStream {
    _$fileStreamAtom.context.enforceReadPolicy(_$fileStreamAtom);
    _$fileStreamAtom.reportObserved();
    return super.fileStream;
  }

  @override
  set fileStream(ObservableStream<List<int>> value) {
    _$fileStreamAtom.context.conditionallyRunInAction(() {
      super.fileStream = value;
      _$fileStreamAtom.reportChanged();
    }, _$fileStreamAtom, name: '${_$fileStreamAtom.name}_set');
  }

  final _$isDoneAtom = Atom(name: '_BackupFileBase.isDone');

  @override
  bool get isDone {
    _$isDoneAtom.context.enforceReadPolicy(_$isDoneAtom);
    _$isDoneAtom.reportObserved();
    return super.isDone;
  }

  @override
  set isDone(bool value) {
    _$isDoneAtom.context.conditionallyRunInAction(() {
      super.isDone = value;
      _$isDoneAtom.reportChanged();
    }, _$isDoneAtom, name: '${_$isDoneAtom.name}_set');
  }

  final _$hasErrorAtom = Atom(name: '_BackupFileBase.hasError');

  @override
  bool get hasError {
    _$hasErrorAtom.context.enforceReadPolicy(_$hasErrorAtom);
    _$hasErrorAtom.reportObserved();
    return super.hasError;
  }

  @override
  set hasError(bool value) {
    _$hasErrorAtom.context.conditionallyRunInAction(() {
      super.hasError = value;
      _$hasErrorAtom.reportChanged();
    }, _$hasErrorAtom, name: '${_$hasErrorAtom.name}_set');
  }

  final _$isLoadingAtom = Atom(name: '_BackupFileBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.context.enforceReadPolicy(_$isLoadingAtom);
    _$isLoadingAtom.reportObserved();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.context.conditionallyRunInAction(() {
      super.isLoading = value;
      _$isLoadingAtom.reportChanged();
    }, _$isLoadingAtom, name: '${_$isLoadingAtom.name}_set');
  }

  final _$downloadFileAsyncAction = AsyncAction('downloadFile');

  @override
  Future downloadFile({Function onDone, Function onError}) {
    return _$downloadFileAsyncAction
        .run(() => super.downloadFile(onDone: onDone, onError: onError));
  }

  @override
  String toString() {
    final string =
        'file: ${file.toString()},metaData: ${metaData.toString()},fileStream: ${fileStream.toString()},isDone: ${isDone.toString()},hasError: ${hasError.toString()},isLoading: ${isLoading.toString()},createdAt: ${createdAt.toString()}';
    return '{$string}';
  }
}
