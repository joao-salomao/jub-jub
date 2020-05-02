import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:jubjub/models/annotation_file_model.dart';
import 'package:jubjub/models/model.dart';
part 'annotation_model.g.dart';

class AnnotationModel = _AnnotationModelBase with _$AnnotationModel;

abstract class _AnnotationModelBase extends Model with Store {
  @observable
  int id;

  @observable
  int thinkId;

  @observable
  String title;

  @observable
  String text;

  @observable
  Color color;

  @observable
  int listIndex;

  @observable
  String password;

  @observable
  String createdAt;

  @observable
  ObservableList<AnnotationFileModel> files =
      ObservableList<AnnotationFileModel>();

  _AnnotationModelBase({
    this.id,
    this.text,
    this.color,
    this.files,
    this.title,
    this.thinkId,
    this.createdAt,
    this.listIndex,
  });

  _AnnotationModelBase.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.thinkId = map['think_id'];
    this.title = map['title'];
    this.text = map['text'];
    this.color = Color(map['color']);
    this.password = map['password'];
    this.createdAt = map['createdAt'];
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "text": text,
      "title": title,
      "think_id": thinkId,
      "color": color.value,
      "password": password,
      "createdAt": createdAt,
      "listIndex": listIndex,
    };
  }

  getAnnotationTotalWords() {
    int count = text.trim().split(" ").length;
    files.forEach((f) => count += f.description.trim().split(" ").length);
    return count;
  }

  getAnnotationFilesCountByType(String type) {
    return files.where((f) => f.type == type).length;
  }
}
