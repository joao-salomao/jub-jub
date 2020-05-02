import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:googleapis/drive/v3.dart' as ga;
import 'package:jubjub/services/auth_service.dart';

class GoogleDriveService {
  final _authService = AuthService();

  //Upload File
  Future upload(File file) async {
    var client = await _authService.signInGoogle();
    var drive = ga.DriveApi(client);
    print("Uploading file");
    var response = await drive.files.create(
        ga.File()..name = p.basename(file.absolute.path),
        uploadMedia: ga.Media(file.openRead(), file.lengthSync()));

    print("Result ${response.toJson()}");
  }
}

// const _clientId =
//     "59755895341-il9983s1u8gjf4v2fu9ni5gvs90jck0t.apps.googleusercontent.com";
// const _clientSecret = "AIzaSyA-KKMtRIQBpAWnaFHYBzwTr1oP7wduThM";
// const _scopes = [ga.DriveApi.DriveFileScope];
