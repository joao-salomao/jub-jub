import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:potato_notes/entities/annotation.dart';
import 'package:potato_notes/entities/think.dart';
import 'package:potato_notes/views/app_state/app_state.dart';
part 'think_page_state.g.dart';

class ThinkPageState = _ThinkPageStateBase with _$ThinkPageState;

abstract class _ThinkPageStateBase with Store {
  final appState = GetIt.I<AppState>();

  _ThinkPageStateBase(Think think) {
    this.think = think;
    this.color = think.color;
    this.title = think.title;
    think.annotations.forEach((a) => this.annotations.add(a));
  }

  @observable
  Think think;

  @observable
  Color color;

  @observable
  String title;

  @observable
  var annotations = ObservableList<Annotation>();

  @action
  deleteThink() async {
    await appState.thinkDAO.delete(think.id).then((_) => appState.getData());
  }

  @action
  saveThink() async {
    think.color = color;
    think.title = title;
    await appState.thinkDAO.save(think);
  }

  @action
  setColor(Color newColor) => color = newColor;

  @action
  setTitle(String newtitle) => title = newtitle;
}
