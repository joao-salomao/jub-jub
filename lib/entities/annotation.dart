import 'package:flutter/material.dart';
import 'annotation_file.dart';

class Annotation {
  String id;
  String title;
  String text;
  Color color;
  String createdAt;
  List<AnnotationFile> files = [];

  Annotation(this.id, this.title, this.text, this.createdAt);
}
