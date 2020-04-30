import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:potato_notes/models/think_model.dart';
import 'package:potato_notes/models/annotation_model.dart';
import 'package:potato_notes/views/app_state/app_state.dart';
part 'think_page_state.g.dart';

class ThinkPageState = _ThinkPageStateBase with _$ThinkPageState;

abstract class _ThinkPageStateBase with Store {
  final appState = GetIt.I<AppState>();

  _ThinkPageStateBase(ThinkModel think) {
    this.think = think;
    think.annotations.forEach((a) => this.annotations.add(a));
  }

  @observable
  ThinkModel think;

  @observable
  var annotations = ObservableList<AnnotationModel>();

  @action
  deleteThink() async {
    await appState.thinkDAO.delete(think.id).then((_) => appState.getData());
  }

  @action
  saveThink() async {
    await appState.thinkDAO.save(think);
  }

  @action
  setColor(Color newColor) => think.color = newColor;

  @action
  setTitle(String newtitle) => think.title = newtitle;
}
