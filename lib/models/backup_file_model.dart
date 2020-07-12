import 'dart:io' as io;
import 'package:mobx/mobx.dart';
import 'package:jubjub/utils/formatters.dart';
import 'package:jubjub/services/backup_service.dart';
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:permission_handler/permission_handler.dart';
part 'backup_file_model.g.dart';

class BackupFile = _BackupFileBase with _$BackupFile;

abstract class _BackupFileBase with Store {
  final BackupService backupService;

  _BackupFileBase(this.backupService, drive.File metaData) {
    this.metaData = metaData;
  }

  @observable
  io.File file;

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

    final stream = await backupService.downloadFile(metaData.name, metaData.id);
    fileStream = ObservableStream(stream);

    if (!(await Permission.storage.status).isGranted) {
      await Permission.storage.request();
    }

    io.Directory('/storage/emulated/0/JubJub').createSync(recursive: true);
    file = io.File('/storage/emulated/0/JubJub/${metaData.name}')..createSync();

    final List<int> dataStore = [];
    fileStream.listen((data) {
      dataStore.insertAll(dataStore.length, data);
    }, onDone: () async {
      file.writeAsBytesSync(dataStore);

      isDownloading = false;

      await backupService.backupFile(file);
      await Future.delayed(Duration(seconds: 1));
      await backupService.appController.getData();

      isDone = true;
      file.deleteSync();
    }, onError: (error) {
      hasError = true;
      isDownloading = false;
      file.deleteSync();
    });
  }
}
