import 'package:mobx/mobx.dart';
import 'package:jubjub/services/backup_service.dart';
import 'package:jubjub/models/backup_file_model.dart';
part 'backup_controller.g.dart';

class BackupController = _BackupControllerBase with _$BackupController;

abstract class _BackupControllerBase with Store {
  final backupService = BackupService();

  @observable
  ObservableList<BackupFile> backups = ObservableList<BackupFile>();

  @observable
  ObservableStream<List<int>> fileStream;

  @observable
  bool isLoading;

  @observable
  bool hasError = false;

  @action
  getBackups() async {
    isLoading = true;
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
    isLoading = false;
  }
}