import 'dart:io';
import 'package:get_it/get_it.dart';
import 'package:path/path.dart' as path;
import 'package:jubjub/controllers/app_controller.dart';
import 'package:googleapis/drive/v3.dart' as googleApis;

class GoogleDriveService {
  final _appController = GetIt.I<AppController>();

  Future upload(File file) async {
    try {
      var client = _appController.currentUser.client;
      var drive = googleApis.DriveApi(client);

      googleApis.File fileToUpload = googleApis.File();

      // Add file to app folder
      // fileToUpload.parents = ["appDataFolder"];
      fileToUpload.name = path.basename(file.absolute.path);

      var response = await drive.files.create(
        fileToUpload,
        uploadMedia: googleApis.Media(
          file.openRead(),
          file.lengthSync(),
        ),
      );

      print("Result ${response.toJson()}");
    } catch (e) {
      print(e);
    }
  }

  Future getDriveInfo() async {
    try {
      var drive = googleApis.DriveApi(_appController.currentUser.client);
      final about = await drive.about.get($fields: '*');

      final limit = double.parse(about.storageQuota.limit) / 1.074e+9;
      final usage = double.parse(about.storageQuota.usage) / 1.074e+9;
      final usagePercent = double.parse((usage / limit).toStringAsFixed(1));

      return {
        'limit': limit.toStringAsFixed(1),
        'usage': usage.toStringAsFixed(1),
        'usagePercent': usagePercent
      };
    } catch (e) {
      print(e);
    }
  }

  Future deleteFile(googleApis.File file) async {
    try {
      var client = _appController.currentUser.client;
      var drive = googleApis.DriveApi(client);
      await drive.files.delete(file.id);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<Stream<List<int>>> downloadGoogleDriveFile(
    String fileName,
    String fileId,
  ) async {
    var client = _appController.currentUser.client;
    var drive = googleApis.DriveApi(client);
    googleApis.Media file = await drive.files.get(
      fileId,
      downloadOptions: googleApis.DownloadOptions.FullMedia,
    );
    return file.stream;
  }

  Future getBackupsList() async {
    try {
      var client = _appController.currentUser.client;
      var drive = googleApis.DriveApi(client);
      final fileList = await drive.files.list(
        q: "mimeType = 'application/zip' and name contains ' backup-jub-jub' and trashed = false",
        orderBy: 'createdTime desc',
      );
      return fileList.files;
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
