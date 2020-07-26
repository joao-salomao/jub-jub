// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'think_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ThinkListController on _ThinkListControllerBase, Store {
  final _$thinksAtom = Atom(name: '_ThinkListControllerBase.thinks');

  @override
  ObservableList<ThinkModel> get thinks {
    _$thinksAtom.reportRead();
    return super.thinks;
  }

  @override
  set thinks(ObservableList<ThinkModel> value) {
    _$thinksAtom.reportWrite(value, super.thinks, () {
      super.thinks = value;
    });
  }

  final _$createThinkAsyncAction =
      AsyncAction('_ThinkListControllerBase.createThink');

  @override
  Future createThink(String title, Color color) {
    return _$createThinkAsyncAction.run(() => super.createThink(title, color));
  }

  final _$_ThinkListControllerBaseActionController =
      ActionController(name: '_ThinkListControllerBase');

  @override
  dynamic getThinks() {
    final _$actionInfo = _$_ThinkListControllerBaseActionController.startAction(
        name: '_ThinkListControllerBase.getThinks');
    try {
      return super.getThinks();
    } finally {
      _$_ThinkListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateList() {
    final _$actionInfo = _$_ThinkListControllerBaseActionController.startAction(
        name: '_ThinkListControllerBase.updateList');
    try {
      return super.updateList();
    } finally {
      _$_ThinkListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic reOrderThinks(int oldIndex, int newIndex) {
    final _$actionInfo = _$_ThinkListControllerBaseActionController.startAction(
        name: '_ThinkListControllerBase.reOrderThinks');
    try {
      return super.reOrderThinks(oldIndex, newIndex);
    } finally {
      _$_ThinkListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
thinks: ${thinks}
    ''';
  }
}
