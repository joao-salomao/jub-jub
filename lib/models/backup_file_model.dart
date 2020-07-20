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
  ObservableStream<int> _backupProgressStream;

  @observable
  bool isDone;

  @observable
  bool isBackingUp = false;

  @observable
  bool isDeleting = false;

  @observable
  int backupProgress = 0;

  @action
  setDownloadProgressStream(Stream<int> stream) {
    isDone = false;
    isBackingUp = true;

    backupProgress = 0;

    final onUpdateProgress = (progress) {
      backupProgress += progress;
    };

    final onFinishBackup = () async {
      await Future.delayed(Duration(milliseconds: 500));
      isDone = true;
      isBackingUp = false;
    };

    final onBackupError = (error) {
      isBackingUp = false;
    };

    _backupProgressStream = ObservableStream(stream);

    stream.listen(
      onUpdateProgress,
      onDone: onFinishBackup,
      onError: onBackupError,
      cancelOnError: true,
    );
  }
}
