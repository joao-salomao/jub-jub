import 'dart:io';
import 'dart:convert' as convert;
import 'google_drive_service.dart';
import 'package:get_it/get_it.dart';
import 'package:jubjub/models/think_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:jubjub/models/annotation_model.dart';
import 'package:jubjub/controllers/app_controller.dart';
import 'package:jubjub/models/annotation_file_model.dart';

class BackupService {
  final driveService = GoogleDriveService();
  final appController = GetIt.I<AppController>();

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  backup() async {
    final data = await _getJson();
    final file = await _getFile(data);

    await driveService.upload(file);

    file.delete();
  }

  backupFile(File file) async {
    bool result;
    try {
      final String json = await file.readAsString();
      final List thinksMap = convert.json.decode(json);

      thinksMap.forEach((thinkMap) async {
        final think = ThinkModel.fromMap(thinkMap);
        await appController.saveThink(think);

        thinkMap['annotations'].forEach((annotationMap) async {
          final annotation = AnnotationModel.fromMap(annotationMap);
          annotation.thinkId = think.id;
          await appController.saveAnnotation(annotation);

          annotationMap['annotation_files'].forEach((afMap) {
            final annotationFile = AnnotationFileModel.fromMap(afMap);
            annotation.files.add(annotationFile);
          });

          await appController.saveAnnotation(annotation);
        });
      });
      result = true;
    } catch (e) {
      result = false;
    }
    return result;
  }

  getBackupsList() async {
    return await driveService.getBackupsList();
  }

  Future<Stream<List<int>>> downloadFile(String fileName, String fileId) async {
    return await driveService.downloadGoogleDriveFile(fileName, fileId);
  }

  deleteFile(var file) async {
    return await driveService.deleteFile(file);
  }

  _getFile(String data) async {
    final path = await _localPath;
    final filename =
        path + '/backup-jub-jub-' + DateTime.now().toString() + '.json';
    final file = new File(filename);
    await file.writeAsString(data);
    return file;
  }

  _getJson() async {
    await appController.getData();

    final arr = [];

    appController.thinks.forEach((think) {
      final thinkMap = think.toMap();
      thinkMap['annotations'] = [];

      think.annotations.forEach((annotation) {
        final annotationMap = annotation.toMap();
        annotationMap['annotation_files'] = [];

        annotation.files.forEach((file) {
          annotationMap['annotation_files'].add(file.toMap());
        });

        thinkMap['annotations'].add(annotationMap);
      });
      arr.add(thinkMap);
    });

    return convert.json.encode(arr);
  }
}
