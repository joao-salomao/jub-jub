import 'package:mobx/mobx.dart';
import 'package:jubjub/utils/formatters.dart';
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:jubjub/services/backup_service.dart';
part 'backup_file_model.g.dart';

class BackupFile = _BackupFileBase with _$BackupFile;

abstract class _BackupFileBase with Store {
  final BackupService backupService;

  _BackupFileBase(this.backupService, drive.File metaData) {
    this.metaData = metaData;
  }

  @observable
  drive.File metaData;

  @computed
  String get createdAt {
    final milliseconds = int.parse(
      metaData.name.replaceAll("backup-jub-jub-", "").replaceAll(".zip", ""),
    );

    return formatDate(
      DateTime.fromMillisecondsSinceEpoch(milliseconds),
      format: 'dd/MM/yyyy HH:MM',
    );
  }

  @observable
  ObservableStream<List<int>> fileStream;

  @observable
  bool isDone;

  @observable
  bool hasError;

  @observable
  bool isDownloading = false;

  @observable
  bool isDeleting = false;

  @action
  downloadFile() async {
    isDone = false;
    hasError = false;
    isDownloading = true;

    final backupStream =
        await backupService.backupFile(metaData.name, metaData.id);

    fileStream = ObservableStream(backupStream);

    fileStream.listen((data) {}, onDone: () {
      backupService.appController.getData();
      isDone = true;
    }, onError: (error) {
      hasError = true;
      isDownloading = false;
    });
  }
}
