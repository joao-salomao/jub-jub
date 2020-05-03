// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'backup_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BackupController on _BackupControllerBase, Store {
  final _$backupsAtom = Atom(name: '_BackupControllerBase.backups');

  @override
  ObservableList<BackupFile> get backups {
    _$backupsAtom.context.enforceReadPolicy(_$backupsAtom);
    _$backupsAtom.reportObserved();
    return super.backups;
  }

  @override
  set backups(ObservableList<BackupFile> value) {
    _$backupsAtom.context.conditionallyRunInAction(() {
      super.backups = value;
      _$backupsAtom.reportChanged();
    }, _$backupsAtom, name: '${_$backupsAtom.name}_set');
  }

  final _$fileStreamAtom = Atom(name: '_BackupControllerBase.fileStream');

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

  final _$isLoadingAtom = Atom(name: '_BackupControllerBase.isLoading');

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

  final _$hasErrorAtom = Atom(name: '_BackupControllerBase.hasError');

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

  final _$getBackupsAsyncAction = AsyncAction('getBackups');

  @override
  Future getBackups() {
    return _$getBackupsAsyncAction.run(() => super.getBackups());
  }

  @override
  String toString() {
    final string =
        'backups: ${backups.toString()},fileStream: ${fileStream.toString()},isLoading: ${isLoading.toString()},hasError: ${hasError.toString()}';
    return '{$string}';
  }
}
