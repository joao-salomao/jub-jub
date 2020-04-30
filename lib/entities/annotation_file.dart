import 'dart:io';
import 'package:potato_notes/models/model.dart';
import 'package:potato_notes/utils/file_picker.dart';

class AnnotationFile extends Model {
  int id;
  File file;
  String path;
  String type;
  String title;
  int annotationId;
  String description;
  String fileName;
  var controller;

  AnnotationFile({
    this.file,
    this.path,
    this.type,
    this.title,
    this.fileName,
    this.description,
    this.annotationId,
  });

  AnnotationFile.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.annotationId = map['annotation_id'];
    this.title = map['title'];
    this.description = map['description'];
    this.path = map['path'];
    this.type = map['type'];
    this.file = File(map['path']);
    getFileNameWithExtension(this.file).then((name) {
      fileName = name;
    });
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "type": type,
      "path": path,
      "title": title,
      "description": description,
      "annotation_id": annotationId
    };
  }

  disposeController() {
    if (controller != null) {
      controller.dispose();
    }
  }
}
