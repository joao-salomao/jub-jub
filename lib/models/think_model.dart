import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:jubjub/models/annotation_model.dart';
import 'package:jubjub/models/model.dart';
part 'think_model.g.dart';

class ThinkModel = _ThinkModelBase with _$ThinkModel;

abstract class _ThinkModelBase extends Model with Store {
  @observable
  int id;
  
  @observable
  int listIndex;
  
  @observable
  String title;
  
  @observable
  Color color;
  
  @observable
  DateTime createdAt;

  @observable
  ObservableList<AnnotationModel> annotations =
      ObservableList<AnnotationModel>();

  _ThinkModelBase({
    this.id,
    this.color,
    this.title,
    this.createdAt,
    this.listIndex,
  });

  _ThinkModelBase.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.title = map['title'];
    this.color = Color(map['color']);
    this.listIndex = map['listIndex'];
    this.createdAt = DateTime.parse(map['createdAt']);
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
