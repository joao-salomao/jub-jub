import 'package:jubjub/dao/think_dao.dart';
import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:jubjub/models/think_model.dart';
import 'package:jubjub/models/annotation_model.dart';
import 'package:jubjub/controllers/app_controller.dart';
part 'think_page_controller.g.dart';

class ThinkPageController = _ThinkPageControllerBase with _$ThinkPageController;

abstract class _ThinkPageControllerBase with Store {
  final appController = GetIt.I<AppController>();

  _ThinkPageControllerBase(ThinkModel think) {
    this.think = think;
    think.annotations.forEach((a) => this.annotations.add(a));
  }

  @observable
  ThinkModel think;

  @observable
  var annotations = ObservableList<AnnotationModel>();

  @action
  deleteThink() async {
    await GetIt.I<ThinkDAO>()
        .delete(think.id)
        .then((_) => appController.getData());
  }

  @action
  saveThink() async {
    await GetIt.I<ThinkDAO>().save(think);
  }

  @action
  setColor(Color newColor) => think.color = newColor;

  @action
  setTitle(String newtitle) => think.title = newtitle;
}
