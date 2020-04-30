import 'annotation.dart';
import 'package:flutter/material.dart';
import 'package:potato_notes/models/model.dart';

class Think extends Model {
  int id;
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
    this.color = Color(map['color']);
    this.listIndex = map['listIndex'];
    this.createdAt =  DateTime.parse(map['createdAt']);
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "color": color.value,
      "title": title,
      "listIndex": listIndex,
      "createdAt": createdAt.toString(),
    };
  }
}
