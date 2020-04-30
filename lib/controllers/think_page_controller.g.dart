// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'think_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ThinkPageController on _ThinkPageControllerBase, Store {
  final _$thinkAtom = Atom(name: '_ThinkPageControllerBase.think');

  @override
  ThinkModel get think {
    _$thinkAtom.context.enforceReadPolicy(_$thinkAtom);
    _$thinkAtom.reportObserved();
    return super.think;
  }

  @override
  set think(ThinkModel value) {
    _$thinkAtom.context.conditionallyRunInAction(() {
      super.think = value;
      _$thinkAtom.reportChanged();
    }, _$thinkAtom, name: '${_$thinkAtom.name}_set');
  }

  final _$annotationsAtom = Atom(name: '_ThinkPageControllerBase.annotations');

  @override
  ObservableList<AnnotationModel> get annotations {
    _$annotationsAtom.context.enforceReadPolicy(_$annotationsAtom);
    _$annotationsAtom.reportObserved();
    return super.annotations;
  }

  @override
  set annotations(ObservableList<AnnotationModel> value) {
    _$annotationsAtom.context.conditionallyRunInAction(() {
      super.annotations = value;
      _$annotationsAtom.reportChanged();
    }, _$annotationsAtom, name: '${_$annotationsAtom.name}_set');
  }

  final _$deleteThinkAsyncAction = AsyncAction('deleteThink');

  @override
  Future deleteThink() {
    return _$deleteThinkAsyncAction.run(() => super.deleteThink());
  }

  final _$saveThinkAsyncAction = AsyncAction('saveThink');

  @override
  Future saveThink() {
    return _$saveThinkAsyncAction.run(() => super.saveThink());
  }

  final _$_ThinkPageControllerBaseActionController =
      ActionController(name: '_ThinkPageControllerBase');

  @override
  dynamic setColor(Color newColor) {
    final _$actionInfo =
        _$_ThinkPageControllerBaseActionController.startAction();
    try {
      return super.setColor(newColor);
    } finally {
      _$_ThinkPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTitle(String newtitle) {
    final _$actionInfo =
        _$_ThinkPageControllerBaseActionController.startAction();
    try {
      return super.setTitle(newtitle);
    } finally {
      _$_ThinkPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'think: ${think.toString()},annotations: ${annotations.toString()}';
    return '{$string}';
  }
}
