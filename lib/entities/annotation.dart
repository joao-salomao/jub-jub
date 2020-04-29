import 'entity.dart';
import 'annotation_file.dart';
import 'package:flutter/material.dart';

class Annotation extends Entity {
  int id;
  int thinkId;
  String title;
  String text;
  Color color;
  int listIndex;
  String createdAt;
  List<AnnotationFile> files = [];

  Annotation({
    this.id,
    this.text,
    this.color,
    this.files,
    this.title,
    this.thinkId,
    this.createdAt,
  });

  Annotation.fromMap(Map<String, dynamic> map) {
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
