// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'think_page_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ThinkPageState on _ThinkPageStateBase, Store {
  final _$thinkAtom = Atom(name: '_ThinkPageStateBase.think');

  @override
  Think get think {
    _$thinkAtom.context.enforceReadPolicy(_$thinkAtom);
    _$thinkAtom.reportObserved();
    return super.think;
  }

  @override
  set think(Think value) {
    _$thinkAtom.context.conditionallyRunInAction(() {
      super.think = value;
      _$thinkAtom.reportChanged();
    }, _$thinkAtom, name: '${_$thinkAtom.name}_set');
  }

  final _$colorAtom = Atom(name: '_ThinkPageStateBase.color');

  @override
  Color get color {
    _$colorAtom.context.enforceReadPolicy(_$colorAtom);
    _$colorAtom.reportObserved();
    return super.color;
  }

  @override
  set color(Color value) {
    _$colorAtom.context.conditionallyRunInAction(() {
      super.color = value;
      _$colorAtom.reportChanged();
    }, _$colorAtom, name: '${_$colorAtom.name}_set');
  }

  final _$titleAtom = Atom(name: '_ThinkPageStateBase.title');

  @override
  String get title {
    _$titleAtom.context.enforceReadPolicy(_$titleAtom);
    _$titleAtom.reportObserved();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.context.conditionallyRunInAction(() {
      super.title = value;
      _$titleAtom.reportChanged();
    }, _$titleAtom, name: '${_$titleAtom.name}_set');
  }

  final _$annotationsAtom = Atom(name: '_ThinkPageStateBase.annotations');

  @override
  ObservableList<Annotation> get annotations {
    _$annotationsAtom.context.enforceReadPolicy(_$annotationsAtom);
    _$annotationsAtom.reportObserved();
    return super.annotations;
  }

  @override
  set annotations(ObservableList<Annotation> value) {
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

  final _$_ThinkPageStateBaseActionController =
      ActionController(name: '_ThinkPageStateBase');

  @override
  dynamic setColor(Color newColor) {
    final _$actionInfo = _$_ThinkPageStateBaseActionController.startAction();
    try {
      return super.setColor(newColor);
    } finally {
      _$_ThinkPageStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTitle(String newtitle) {
    final _$actionInfo = _$_ThinkPageStateBaseActionController.startAction();
    try {
      return super.setTitle(newtitle);
    } finally {
      _$_ThinkPageStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'think: ${think.toString()},color: ${color.toString()},title: ${title.toString()},annotations: ${annotations.toString()}';
    return '{$string}';
  }
}
