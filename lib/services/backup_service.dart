import 'dart:io';
import 'dart:convert' as convert;
import 'google_drive_service.dart';
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';
import 'package:jubjub/controllers/app_controller.dart';

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

  Future<List<File>> getBackupsList() async {
    return await driveService.getBackupsList();
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

    final map = {'thinks': []};

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
      map['thinks'].add(thinkMap);
    });

    return convert.json.encode(map);
  }
}
