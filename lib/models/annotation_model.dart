import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:potato_notes/entities/entity.dart';
import 'package:potato_notes/models/annotation_file_model.dart';
part 'annotation_model.g.dart';

class AnnotationModel = _AnnotationModelBase with _$AnnotationModel;

abstract class _AnnotationModelBase extends Entity with Store {
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
  String createdAt;

  @observable
  ObservableList<AnnotationFileModel> files = ObservableList<AnnotationFileModel>();

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
    this.createdAt = map['createdAt'];
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "think_id": thinkId,
      "title": title,
      "text": text,
      "color": color.value,
      "createdAt": createdAt,
      "listIndex": listIndex,
    };
  }
}
