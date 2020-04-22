import 'entity.dart';
import 'annotation.dart';
import 'package:flutter/material.dart';

class Think extends Entity {
  String id;
  int listIndex;
  String title;
  Color color;
  DateTime createdAt;
  List<Annotation> annotations = List<Annotation>();

  Think({
    this.id,
    this.color,
    this.title,
    this.createdAt,
    this.listIndex,
  });

  Think.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.title = map['title'];
    this.color = map['color'];
    this.listIndex = map['listIndex'];
    this.createdAt = map['createdAt'];
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "color": color.value,
      "title": title,
      "listIndex": listIndex,
      "createdAt": createdAt,
    };
  }
}
