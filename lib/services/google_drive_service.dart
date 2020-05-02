import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:jubjub/services/auth_service.dart';
import 'package:googleapis/drive/v3.dart' as googleApis;

class GoogleDriveService {
  final _authService = AuthService();

  Future upload(File file) async {
    var client = await _authService.signInGoogle();
    var drive = googleApis.DriveApi(client);
    print("Uploading file");

    googleApis.File fileToUpload = googleApis.File();

    fileToUpload.parents = ["backups_jubjub"];
    fileToUpload.name = path.basename(file.absolute.path);

    var response = await drive.files.create(
      fileToUpload,
      uploadMedia: googleApis.Media(file.openRead(), file.lengthSync()),
    );

    print("Result ${response.toJson()}");
  }
}

// const _clientId =
//     "59755895341-il9983s1u8gjf4v2fu9ni5gvs90jck0t.apps.googleusercontent.com";
// const _clientSecret = "AIzaSyA-KKMtRIQBpAWnaFHYBzwTr1oP7wduThM";
// const _scopes = [ga.DriveApi.DriveFileScope];
