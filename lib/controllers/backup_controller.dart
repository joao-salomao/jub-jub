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
  get iconColor =>
      appController.brightnessIsDark ? Colors.white : Colors.black;

  get backupAppBarColor => appController.primaryColor;

  @action
  getBackups() async {
    isLoadingBackups = true;
    backups.clear();

    try {
      final files = await backupService.getBackupsList();

      if (files != null) {
        files.forEach((file) => backups.add(BackupFile(backupService, file)));
      }
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
      getBackups();
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
