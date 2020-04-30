import 'dart:io';
import 'package:mobx/mobx.dart';
import 'package:potato_notes/models/model.dart';
import 'package:potato_notes/utils/file_picker.dart';
part 'annotation_file_model.g.dart';

class AnnotationFileModel = _AnnotationFileModelBase with _$AnnotationFileModel;

abstract class _AnnotationFileModelBase extends Model with Store {
  @observable
  int id;

  @observable
  File file;

  @observable
  String path;

  @observable
  String type;

  @observable
  String title;

  @observable
  int annotationId;

  @observable
  String description;

  @observable
  String fileName;

  @observable
  var controller;

  _AnnotationFileModelBase({
    this.file,
    this.path,
    this.type,
    this.title,
    this.fileName,
    this.description,
    this.annotationId,
  });

  _AnnotationFileModelBase.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.annotationId = map['annotation_id'];
    this.title = map['title'];
    this.description = map['description'];
    this.path = map['path'];
    this.type = map['type'];
    this.file = File(map['path']);
    setFileName(this.file);
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

  @action
  disposeController() {
    if (controller != null) {
      controller.dispose();
    }
  }

  @action
  setFileName(File file) async {
    final name = await getFileNameWithExtension(file);
    this.fileName = name;
  }
}
