import 'dart:io';
import 'dart:convert' as convert;
import 'google_drive_service.dart';
import 'package:get_it/get_it.dart';
import 'package:archive/archive_io.dart';
import 'package:jubjub/models/think_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:jubjub/models/annotation_model.dart';
import 'package:jubjub/controllers/app_controller.dart';
import 'package:jubjub/models/annotation_file_model.dart';
import 'package:permission_handler/permission_handler.dart';

class BackupService {
  final driveService = GoogleDriveService();
  final appController = GetIt.I<AppController>();

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  backup() async {
    final jsonFile = await _getDatabaseJsonCopyFile();
    final zipFile = await _createZipFile(jsonFile);

    await driveService.upload(zipFile);

    zipFile.delete();
    jsonFile.delete();
  }

  createBackupFileName() async {
    final path = await _localPath;
    final millisecondsSinceEpoch =
        DateTime.now().millisecondsSinceEpoch.toString();
    return path + '/backup-jub-jub-$millisecondsSinceEpoch.zip';
  }

  _createZipFile(File json) async {
    final encoder = ZipFileEncoder();
    final filename = await createBackupFileName();

    encoder.create(filename);

    encoder.addFile(json);

    final files = await _getAnnotationsFiles();

    files.forEach(encoder.addFile);

    encoder.close();

    return File(filename);
  }

  Future<List<File>> _getAnnotationsFiles() async {
    return (await appController.annotationFileDAO.getAnnotationsFilesPaths())
        .map((path) => File(path))
        .toList();
  }

  _unzipFiles(File file) {
    final archive = ZipDecoder().decodeBytes(file.readAsBytesSync());

    for (final file in archive) {
      final filename = file.name;
      if (file.isFile) {
        final data = file.content as List<int>;
        File('/storage/emulated/0/JubJub/Files/$filename')
          ..createSync(recursive: true)
          ..writeAsBytesSync(data);
      } else {
        Directory('/storage/emulated/0/JubJub/Files/$filename')
          ..create(recursive: true);
      }
    }
  }

  backupFile(File file) async {
    bool result;
    try {
      _unzipFiles(file);
      final String json =
          File('/storage/emulated/0/JubJub/Files/backup-jub-jub-data.json')
              .readAsStringSync();
      final List thinksMap = convert.json.decode(json);

      await _persistData(thinksMap);

      File('/storage/emulated/0/JubJub/Files/backup-jub-jub-data.json')
          .delete();

      result = true;
    } catch (e) {
      result = false;
    }
    return result;
  }

  _persistData(List thinksMap) async {
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

  _getDatabaseJsonCopyFile() async {
    final path = await _localPath;
    final filename = path + '/backup-jub-jub-data.json';
    final file = new File(filename);
    final data = await _getJson();
    await file.writeAsString(data);
    return file;
  }

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
