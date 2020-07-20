import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import '../models/backup_file_model.dart';
import 'package:jubjub/services/backup_service.dart';
import 'package:jubjub/models/backup_file_model.dart';
import 'package:jubjub/controllers/app_controller.dart';
part 'backup_controller.g.dart';

class BackupController = _BackupControllerBase with _$BackupController;

abstract class _BackupControllerBase with Store {
  final backupService = BackupService();
  final appController = GetIt.I<AppController>();

  @observable
  String driveLimit = '';

  @observable
  String driveUsage = '';

  @observable
  double usagePercent = 0;

  @observable
  ObservableList<BackupFile> backups = ObservableList<BackupFile>();

  @observable
  bool isLoadingBackups = true;

  @observable
  bool isLoadingNewBackup = false;

  @observable
  bool hasError = false;

  @computed
  get iconColor => appController.brightnessIsDark ? Colors.white : Colors.black;

  get primaryColor => appController.primaryColor;

  @action
  getBackupsData() async {
    hasError = false;
    isLoadingBackups = true;
    backups.clear();

    try {
      Future.wait([
        backupService.getBackupsList(),
        backupService.getDriveInfo(),
      ]).then((results) {
        final files = results[0];
        final driveInfo = results[1];

        if (files != null) {
          files.forEach((file) => backups.add(BackupFile(backupService, file)));
        }

        if (driveInfo != null) {
          driveLimit = driveInfo['limit'];
          driveUsage = driveInfo['usage'];
          usagePercent = driveInfo['usagePercent'];
        }
        isLoadingBackups = false;
      });
    } catch (e) {
      hasError = true;
      isLoadingBackups = false;
      print(e);
    }
  }

  @action
  storeNewBackup() async {
    var result = false;
    isLoadingNewBackup = true;

    try {
      await backupService.backup();
      getBackupsData();
      result = true;
    } catch (e) {
      print(e);
    }

    isLoadingNewBackup = false;
    return result;
  }

  @action
  restoreBackup(BackupFile file) async {
    final completer = Completer<bool>();

    try {
      final stream =
          await backupService.backupFile(file.metaData.name, file.metaData.id);

      stream.listen(
        (data) {},
        onDone: () {
          completer.complete(true);
          Future.delayed(Duration(seconds: 1))
              .then((value) => appController.getData());
        },
        cancelOnError: true,
      );

      file.setDownloadProgressStream(stream);
    } catch (e) {
      completer.complete(false);
      print(e);
    }
    return completer.future;
  }

  @action
  deleteFile(BackupFile file) async {
    var result = false;
    file.isDeleting = true;
    try {
      await backupService.deleteFile(file.metaData);
      backups.remove(file);
      result = true;
    } catch (e) {
      print(e);
    }
    file.isDeleting = false;
    return result;
  }
}
