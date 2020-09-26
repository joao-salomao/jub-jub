import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:googleapis/drive/v3.dart' as g;
import 'package:jubjub/custom/auth_http_client.dart';

class GoogleDriveService {
  g.DriveApi _getDrive(AuthHttpClient client) {
    return g.DriveApi(client);
  }

  Future uploadFile(File file, AuthHttpClient client) async {
    try {
      final drive = _getDrive(client);
      final g.File fileToUpload = g.File();

      // Add file to app folder
      // fileToUpload.parents = ["appDataFolder"];
      fileToUpload.name = path.basename(file.absolute.path);

      var response = await drive.files.create(
        fileToUpload,
        uploadMedia: g.Media(
          file.openRead(),
          file.lengthSync(),
        ),
      );

      print("Result ${response.toJson()}");
    } catch (e) {
      print(e);
    }
  }

  Future getDriveInfo(AuthHttpClient client) async {
    try {
      final drive = _getDrive(client);
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

  Future deleteFile(g.File file, AuthHttpClient client) async {
    try {
      final drive = _getDrive(client);
      await drive.files.delete(file.id);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<Stream<List<int>>> downloadFile(
    String fileName,
    String fileId,
    AuthHttpClient client,
  ) async {
    final drive = _getDrive(client);
    g.Media file = await drive.files.get(
      fileId,
      downloadOptions: g.DownloadOptions.FullMedia,
    );
    return file.stream;
  }

  Future getBackups(AuthHttpClient client) async {
    try {
      final drive = _getDrive(client);
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
