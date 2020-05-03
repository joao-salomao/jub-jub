import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:jubjub/services/auth_service.dart';
import 'package:googleapis/drive/v3.dart' as googleApis;

class GoogleDriveService {
  final _authService = AuthService();

  Future upload(File file) async {
    try {
      var client = await _authService.signInGoogle();
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

  Future<Stream<List<int>>> downloadGoogleDriveFile(String fileName, String fileId) async {
    var client = await _authService.signInGoogle();
    var drive = googleApis.DriveApi(client);
    googleApis.Media file = await drive.files.get(
      fileId,
      downloadOptions: googleApis.DownloadOptions.FullMedia,

    );
    return file.stream;
  }

  Future getBackupsList() async {
    try {
      var client = await _authService.signInGoogle();
      var drive = googleApis.DriveApi(client);
      final fileList = await drive.files.list(
        q: "mimeType = 'application/json' and name contains ' backup-jub-jub'",
        orderBy: 'createdTime desc',
      );
      return fileList.files;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
