import 'dart:io';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as path;

Future<File> getFile(String fileType) async {
  File file;
  try {
    if (fileType == 'image') {
      file = await FilePicker.getFile(type: FileType.image);
    }
    if (fileType == 'audio') {
      file = await FilePicker.getFile(type: FileType.audio);
    }
    if (fileType == 'video') {
      file = await FilePicker.getFile(type: FileType.video);
    }
    if (fileType == 'pdf') {
      file = await FilePicker.getFile(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );
    }
    if (fileType == 'others') {
      file = await FilePicker.getFile(type: FileType.any);
    }
  } on PlatformException catch (e) {
    print(e);
  }
  return file != null ? file : null;
}

Future<String> getFileNameWithExtension(File file) async {
  if (await file.exists()) {
    return path.basename(file.path);
  }
  return null;
}
