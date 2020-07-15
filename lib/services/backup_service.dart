import 'dart:io';
import 'dart:async';
import 'dart:convert' as convert;
import 'google_drive_service.dart';
import 'package:get_it/get_it.dart';
import 'package:jubjub/models/think_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:jubjub/services/zip_service.dart';
import 'package:jubjub/models/annotation_model.dart';
import 'package:jubjub/controllers/app_controller.dart';
import 'package:jubjub/models/annotation_file_model.dart';
import 'package:permission_handler/permission_handler.dart';

class BackupService {
  static const String DB_BACKUP_FILE_PATH =
      '/storage/emulated/0/JubJub/Files/backup-jub-jub-data.json';

  final zipService = ZipService();
  final driveService = GoogleDriveService();
  final appController = GetIt.I<AppController>();

  Future<String> get _localPath async {
    return (await getApplicationDocumentsDirectory()).path;
  }

  Future<String> get _temporaryDirectory async {
    return (await getTemporaryDirectory()).path;
  }

  Future getBackupsList() async {
    return await driveService.getBackupsList();
  }

  Future getDriveInfo() async {
    return await driveService.getDriveInfo();
  }

  Future<Stream<List<int>>> downloadFile(String fileName, String fileId) async {
    return await driveService.downloadGoogleDriveFile(fileName, fileId);
  }

  deleteFile(var file) async {
    return await driveService.deleteFile(file);
  }

  Future<void> _requestStorageAccessPermission() async {
    if (!(await Permission.storage.status).isGranted) {
      await Permission.storage.request();
    }
  }

  backup() async {
    await _requestStorageAccessPermission();

    final jsonFile = await _getDatabaseJsonCopyFile();
    final zipFile = await _createZipFile(jsonFile);

    await driveService.upload(zipFile);

    zipFile.delete();
    jsonFile.delete();
  }

  backupFile(String fileName, String id) async {
    File file;
    final List<int> dataStore = [];
    final controller = StreamController<int>();

    try {
      await _requestStorageAccessPermission();
      controller.add(5);

      Directory('/storage/emulated/0/JubJub/Files').createSync(recursive: true);
      controller.add(5);

      file = File('/storage/emulated/0/JubJub/$fileName')..createSync();
      controller.add(5);

      final stream = await driveService.downloadGoogleDriveFile(fileName, id);
      controller.add(5);

      stream.listen((data) {
        dataStore.insertAll(dataStore.length, data);
      }, onDone: () async {
        file.writeAsBytesSync(dataStore);
        controller.add(30);

        await zipService.unzipFile(file);
        controller.add(10);

        await _persistData();
        controller.add(10);

        File(DB_BACKUP_FILE_PATH).deleteSync();
        controller.add(10);

        file.deleteSync();
        controller.add(20);
        controller.close();
      }, onError: (error) {
        file.deleteSync();
      });
    } catch (e) {
      if (file != null) {
        file.deleteSync();
      }

      controller.addError(-1);
      controller.close();
      print(e);
    }
    return controller.stream;
  }

  Future<String> _createBackupFileName() async {
    final path = await _temporaryDirectory;
    final millisecondsSinceEpoch =
        DateTime.now().millisecondsSinceEpoch.toString();
    return path + '/backup-jub-jub-$millisecondsSinceEpoch.zip';
  }

  _createZipFile(File json) async {
    final filename = await _createBackupFileName();

    final files = await _getAnnotationsFiles();
    files.add(json);

    final zipFile = await zipService.createZipFile(filename, files);

    return zipFile;
  }

  Future<List<File>> _getAnnotationsFiles() async {
    return (await appController.annotationFileDAO.getAnnotationsFilesPaths())
        .map((path) => File(path))
        .toList();
  }

  _persistData() async {
    final String json = File(DB_BACKUP_FILE_PATH).readAsStringSync();
    final List thinksMap = convert.json.decode(json);

    thinksMap.forEach((thinkMap) async {
      final think = ThinkModel.fromMap(thinkMap);
      await appController.saveThink(think);

      thinkMap['annotations'].forEach((annotationMap) async {
        final annotation = AnnotationModel.fromMap(annotationMap);
        annotation.thinkId = think.id;
        await appController.saveAnnotation(annotation);
        think.annotations.add(annotation);

        annotationMap['annotation_files'].forEach((afMap) {
          final baseName = afMap['path'].split('/').last;
          afMap['path'] = '/storage/emulated/0/JubJub/Files/$baseName';
          final annotationFile = AnnotationFileModel.fromMap(afMap);
          annotation.files.add(annotationFile);
        });

        await appController.saveAnnotation(annotation);
      });
    });
  }

  Future<File> _getDatabaseJsonCopyFile() async {
    final path = await _temporaryDirectory;
    final filename = path + '/backup-jub-jub-data.json';
    final file = new File(filename);
    final data = await _getJson();
    await file.writeAsString(data);
    return file;
  }

  // REFATORAR PARA PEGAR OS DADOS DOS DAO'S
  _getJson() async {
    await appController.getData();

    final arr = [];

    appController.thinks.forEach((think) {
      final thinkMap = think.toMap();
      thinkMap['id'] = null;
      thinkMap['annotations'] = [];

      think.annotations.forEach((annotation) {
        final annotationMap = annotation.toMap();
        annotationMap['id'] = null;
        annotationMap['annotation_files'] = [];

        annotation.files.forEach((file) {
          final fileMap = file.toMap();
          fileMap['id'] = null;
          annotationMap['annotation_files'].add(fileMap);
        });

        thinkMap['annotations'].add(annotationMap);
      });
      arr.add(thinkMap);
    });

    return convert.json.encode(arr);
  }
}
