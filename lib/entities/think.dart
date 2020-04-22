
import 'package:flutter/material.dart';
import 'annotation.dart';

class Think {
  String id;
  int order;
  String title;
  Color color;
  String createdAt;
  List<Annotation> annotations = List<Annotation>();

  Think(this.title, this.createdAt, this.color, this.order);
}
