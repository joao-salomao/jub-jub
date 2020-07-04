import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:jubjub/controllers/app_controller.dart';
import 'package:mobx/mobx.dart';
import 'package:jubjub/services/backup_service.dart';
import 'package:jubjub/models/backup_file_model.dart';
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
  ObservableStream<List<int>> fileStream;

  @observable
  bool isLoadingBackups;

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
      });
    } catch (e) {
      hasError = true;
      print(e);
    }
    isLoadingBackups = false;
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
