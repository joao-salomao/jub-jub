import 'dart:io';
import 'package:mobx/mobx.dart';
import 'package:jubjub/services/backup_service.dart';
part 'backup_controller.g.dart';

class BackupController = _BackupControllerBase with _$BackupController;

abstract class _BackupControllerBase with Store {
  final backupService = BackupService();

  @observable
  ObservableList<File> backups = ObservableList<File>();

  @observable
  bool isLoading = true;

  @observable
  bool hasError = false;

  @action
  getBackups() async {
    backups.clear();
    try {
      final files = await backupService.getBackupsList();
      if (files != null) {
        backups.forEach((file) => backups.add(file));
      }
      isLoading = false;
    } catch (e) {
      hasError = true;
      print(e);
    }
  }
}
