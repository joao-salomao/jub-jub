import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:jubjub/controllers/app_controller.dart';
import 'package:jubjub/dao/think_dao.dart';
import 'package:jubjub/models/think_model.dart';
import 'package:mobx/mobx.dart';

part 'think_list_controller.g.dart';

class ThinkListController = _ThinkListControllerBase with _$ThinkListController;

abstract class _ThinkListControllerBase with Store {
  final appController = GetIt.I<AppController>();
  final thinkDAO = GetIt.I<ThinkDAO>();

  bool get listIsEmpty => thinks.isEmpty;
  bool get isLoading => appController.isLoading;
  String get mainTitle => appController.mainTitle;
  Color get primaryColor => appController.primaryColor;
  bool get brightnessIsDark => appController.brightnessIsDark;

  @observable
  ObservableList<ThinkModel> thinks = ObservableList<ThinkModel>();

  @action
  getThinks() {
    thinks = appController.thinks;
  }

  @action
  updateList() {
    appController.getData().then((value) {
      thinks = appController.thinks;
    });
  }

  @action
  createThink(String title, Color color) async {
    assert(title != null);
    assert(color != null);

    final think = ThinkModel(
      title: title,
      color: color,
      listIndex: thinks.length,
      createdAt: DateTime.now(),
    );

    await appController.saveThink(think);

    updateList();
  }

  @action
  reOrderThinks(int oldIndex, int newIndex) {
    final isLast = newIndex == thinks.length;
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }

    final think = thinks.removeAt(oldIndex);

    if (isLast) {
      thinks.add(think);
    } else {
      thinks.insert(newIndex, think);
    }

    thinkDAO.updateItemsListIndex(thinks);
  }
}
