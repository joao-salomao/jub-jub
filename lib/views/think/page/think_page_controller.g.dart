// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'think_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ThinkPageController on _ThinkPageControllerBase, Store {
  final _$thinkAtom = Atom(name: '_ThinkPageControllerBase.think');

  @override
  ThinkModel get think {
    _$thinkAtom.reportRead();
    return super.think;
  }

  @override
  set think(ThinkModel value) {
    _$thinkAtom.reportWrite(value, super.think, () {
      super.think = value;
    });
  }

  final _$annotationsAtom = Atom(name: '_ThinkPageControllerBase.annotations');

  @override
  ObservableList<AnnotationModel> get annotations {
    _$annotationsAtom.reportRead();
    return super.annotations;
  }

  @override
  set annotations(ObservableList<AnnotationModel> value) {
    _$annotationsAtom.reportWrite(value, super.annotations, () {
      super.annotations = value;
    });
  }

  final _$deleteThinkAsyncAction =
      AsyncAction('_ThinkPageControllerBase.deleteThink');

  @override
  Future deleteThink() {
    return _$deleteThinkAsyncAction.run(() => super.deleteThink());
  }

  final _$saveThinkAsyncAction =
      AsyncAction('_ThinkPageControllerBase.saveThink');

  @override
  Future saveThink() {
    return _$saveThinkAsyncAction.run(() => super.saveThink());
  }

  final _$_ThinkPageControllerBaseActionController =
      ActionController(name: '_ThinkPageControllerBase');

  @override
  dynamic setColor(Color newColor) {
    final _$actionInfo = _$_ThinkPageControllerBaseActionController.startAction(
        name: '_ThinkPageControllerBase.setColor');
    try {
      return super.setColor(newColor);
    } finally {
      _$_ThinkPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTitle(String newtitle) {
    final _$actionInfo = _$_ThinkPageControllerBaseActionController.startAction(
        name: '_ThinkPageControllerBase.setTitle');
    try {
      return super.setTitle(newtitle);
    } finally {
      _$_ThinkPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
think: ${think},
annotations: ${annotations}
    ''';
  }
}
