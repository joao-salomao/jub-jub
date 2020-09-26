// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'backup_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BackupController on _BackupControllerBase, Store {
  Computed<dynamic> _$iconColorComputed;

  @override
  dynamic get iconColor =>
      (_$iconColorComputed ??= Computed<dynamic>(() => super.iconColor,
              name: '_BackupControllerBase.iconColor'))
          .value;

  final _$driveLimitAtom = Atom(name: '_BackupControllerBase.driveLimit');

  @override
  String get driveLimit {
    _$driveLimitAtom.reportRead();
    return super.driveLimit;
  }

  @override
  set driveLimit(String value) {
    _$driveLimitAtom.reportWrite(value, super.driveLimit, () {
      super.driveLimit = value;
    });
  }

  final _$driveUsageAtom = Atom(name: '_BackupControllerBase.driveUsage');

  @override
  String get driveUsage {
    _$driveUsageAtom.reportRead();
    return super.driveUsage;
  }

  @override
  set driveUsage(String value) {
    _$driveUsageAtom.reportWrite(value, super.driveUsage, () {
      super.driveUsage = value;
    });
  }

  final _$usagePercentAtom = Atom(name: '_BackupControllerBase.usagePercent');

  @override
  double get usagePercent {
    _$usagePercentAtom.reportRead();
    return super.usagePercent;
  }

  @override
  set usagePercent(double value) {
    _$usagePercentAtom.reportWrite(value, super.usagePercent, () {
      super.usagePercent = value;
    });
  }

  final _$backupsAtom = Atom(name: '_BackupControllerBase.backups');

  @override
  ObservableList<BackupFile> get backups {
    _$backupsAtom.reportRead();
    return super.backups;
  }

  @override
  set backups(ObservableList<BackupFile> value) {
    _$backupsAtom.reportWrite(value, super.backups, () {
      super.backups = value;
    });
  }

  final _$isLoadingBackupsAtom =
      Atom(name: '_BackupControllerBase.isLoadingBackups');

  @override
  bool get isLoadingBackups {
    _$isLoadingBackupsAtom.reportRead();
    return super.isLoadingBackups;
  }

  @override
  set isLoadingBackups(bool value) {
    _$isLoadingBackupsAtom.reportWrite(value, super.isLoadingBackups, () {
      super.isLoadingBackups = value;
    });
  }

  final _$isLoadingNewBackupAtom =
      Atom(name: '_BackupControllerBase.isLoadingNewBackup');

  @override
  bool get isLoadingNewBackup {
    _$isLoadingNewBackupAtom.reportRead();
    return super.isLoadingNewBackup;
  }

  @override
  set isLoadingNewBackup(bool value) {
    _$isLoadingNewBackupAtom.reportWrite(value, super.isLoadingNewBackup, () {
      super.isLoadingNewBackup = value;
    });
  }

  final _$hasErrorAtom = Atom(name: '_BackupControllerBase.hasError');

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

  final _$getBackupsDataAsyncAction =
      AsyncAction('_BackupControllerBase.getBackupsData');

  @override
  Future getBackupsData() {
    return _$getBackupsDataAsyncAction.run(() => super.getBackupsData());
  }

  final _$storeNewBackupAsyncAction =
      AsyncAction('_BackupControllerBase.storeNewBackup');

  @override
  Future storeNewBackup() {
    return _$storeNewBackupAsyncAction.run(() => super.storeNewBackup());
  }

  final _$restoreBackupAsyncAction =
      AsyncAction('_BackupControllerBase.restoreBackup');

  @override
  Future restoreBackup(BackupFile file) {
    return _$restoreBackupAsyncAction.run(() => super.restoreBackup(file));
  }

  final _$deleteBackupAsyncAction =
      AsyncAction('_BackupControllerBase.deleteBackup');

  @override
  Future deleteBackup(BackupFile file) {
    return _$deleteBackupAsyncAction.run(() => super.deleteBackup(file));
  }

  @override
  String toString() {
    return '''
driveLimit: ${driveLimit},
driveUsage: ${driveUsage},
usagePercent: ${usagePercent},
backups: ${backups},
isLoadingBackups: ${isLoadingBackups},
isLoadingNewBackup: ${isLoadingNewBackup},
hasError: ${hasError},
iconColor: ${iconColor}
    ''';
  }
}
