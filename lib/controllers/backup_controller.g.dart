// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'backup_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BackupController on _BackupControllerBase, Store {
  Computed<dynamic> _$iconColorComputed;

  @override
  dynamic get iconColor =>
      (_$iconColorComputed ??= Computed<dynamic>(() => super.iconColor)).value;

  final _$driveLimitAtom = Atom(name: '_BackupControllerBase.driveLimit');

  @override
  String get driveLimit {
    _$driveLimitAtom.context.enforceReadPolicy(_$driveLimitAtom);
    _$driveLimitAtom.reportObserved();
    return super.driveLimit;
  }

  @override
  set driveLimit(String value) {
    _$driveLimitAtom.context.conditionallyRunInAction(() {
      super.driveLimit = value;
      _$driveLimitAtom.reportChanged();
    }, _$driveLimitAtom, name: '${_$driveLimitAtom.name}_set');
  }

  final _$driveUsageAtom = Atom(name: '_BackupControllerBase.driveUsage');

  @override
  String get driveUsage {
    _$driveUsageAtom.context.enforceReadPolicy(_$driveUsageAtom);
    _$driveUsageAtom.reportObserved();
    return super.driveUsage;
  }

  @override
  set driveUsage(String value) {
    _$driveUsageAtom.context.conditionallyRunInAction(() {
      super.driveUsage = value;
      _$driveUsageAtom.reportChanged();
    }, _$driveUsageAtom, name: '${_$driveUsageAtom.name}_set');
  }

  final _$usagePercentAtom = Atom(name: '_BackupControllerBase.usagePercent');

  @override
  double get usagePercent {
    _$usagePercentAtom.context.enforceReadPolicy(_$usagePercentAtom);
    _$usagePercentAtom.reportObserved();
    return super.usagePercent;
  }

  @override
  set usagePercent(double value) {
    _$usagePercentAtom.context.conditionallyRunInAction(() {
      super.usagePercent = value;
      _$usagePercentAtom.reportChanged();
    }, _$usagePercentAtom, name: '${_$usagePercentAtom.name}_set');
  }

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

  final _$isLoadingBackupsAtom =
      Atom(name: '_BackupControllerBase.isLoadingBackups');

  @override
  bool get isLoadingBackups {
    _$isLoadingBackupsAtom.context.enforceReadPolicy(_$isLoadingBackupsAtom);
    _$isLoadingBackupsAtom.reportObserved();
    return super.isLoadingBackups;
  }

  @override
  set isLoadingBackups(bool value) {
    _$isLoadingBackupsAtom.context.conditionallyRunInAction(() {
      super.isLoadingBackups = value;
      _$isLoadingBackupsAtom.reportChanged();
    }, _$isLoadingBackupsAtom, name: '${_$isLoadingBackupsAtom.name}_set');
  }

  final _$isLoadingNewBackupAtom =
      Atom(name: '_BackupControllerBase.isLoadingNewBackup');

  @override
  bool get isLoadingNewBackup {
    _$isLoadingNewBackupAtom.context
        .enforceReadPolicy(_$isLoadingNewBackupAtom);
    _$isLoadingNewBackupAtom.reportObserved();
    return super.isLoadingNewBackup;
  }

  @override
  set isLoadingNewBackup(bool value) {
    _$isLoadingNewBackupAtom.context.conditionallyRunInAction(() {
      super.isLoadingNewBackup = value;
      _$isLoadingNewBackupAtom.reportChanged();
    }, _$isLoadingNewBackupAtom, name: '${_$isLoadingNewBackupAtom.name}_set');
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

  final _$getBackupsDataAsyncAction = AsyncAction('getBackupsData');

  @override
  Future getBackupsData() {
    return _$getBackupsDataAsyncAction.run(() => super.getBackupsData());
  }

  final _$storeNewBackupAsyncAction = AsyncAction('storeNewBackup');

  @override
  Future storeNewBackup() {
    return _$storeNewBackupAsyncAction.run(() => super.storeNewBackup());
  }

  final _$deleteFileAsyncAction = AsyncAction('deleteFile');

  @override
  Future deleteFile(BackupFile file) {
    return _$deleteFileAsyncAction.run(() => super.deleteFile(file));
  }

  @override
  String toString() {
    final string =
        'driveLimit: ${driveLimit.toString()},driveUsage: ${driveUsage.toString()},usagePercent: ${usagePercent.toString()},backups: ${backups.toString()},fileStream: ${fileStream.toString()},isLoadingBackups: ${isLoadingBackups.toString()},isLoadingNewBackup: ${isLoadingNewBackup.toString()},hasError: ${hasError.toString()},iconColor: ${iconColor.toString()}';
    return '{$string}';
  }
}
