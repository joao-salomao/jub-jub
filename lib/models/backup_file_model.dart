import 'dart:io' as io;
import 'package:mobx/mobx.dart';
import 'package:jubjub/utils/formatters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:jubjub/services/backup_service.dart';
import 'package:googleapis/drive/v3.dart' as drive;
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
  String get createdAt => formatDate(
        DateTime.parse(metaData.name
            .replaceAll("backup-jub-jub-", "")
            .replaceAll(".json", "")),
        format: 'dd/MM/yyyy HH:MM',
      );

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

    final directory = await getExternalStorageDirectory();
    print(directory.path);

    file = io.File(
        '${directory.path}/${DateTime.now().millisecondsSinceEpoch}${metaData.name}');

    final List<int> dataStore = [];
    fileStream.listen((data) {
      dataStore.insertAll(dataStore.length, data);
    }, onDone: () async {
      await file.writeAsBytes(dataStore);

      isDownloading = false;

      await backupService.backupFile(file);
      await Future.delayed(Duration(seconds: 1));
      await backupService.appController.getData();

      isDone = true;
      file.delete();
    }, onError: (error) {
      hasError = true;
      isDownloading = false;
      file.delete();
    });
  }
}
