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

  Future<void> listGoogleDriveFiles() async {
    try {
      var client = await _authService.signInGoogle();
      var drive = googleApis.DriveApi(client);
      drive.files.list(q: "mimeType = 'application/json' and name contains ' backup-jub-jub'").then((value) {
        for (var i = 0; i < value.files.length; i++) {
          print("Id: ${value.files[i].id} File Name:${value.files[i].name}");
        }
      });
    } catch (e) {
      print(e);
    }
  }
}