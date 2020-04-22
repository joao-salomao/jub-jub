// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppState on _AppStateBase, Store {
  final _$thinksAtom = Atom(name: '_AppStateBase.thinks');

  @override
  ObservableList<Think> get thinks {
    _$thinksAtom.context.enforceReadPolicy(_$thinksAtom);
    _$thinksAtom.reportObserved();
    return super.thinks;
  }

  @override
  set thinks(ObservableList<Think> value) {
    _$thinksAtom.context.conditionallyRunInAction(() {
      super.thinks = value;
      _$thinksAtom.reportChanged();
    }, _$thinksAtom, name: '${_$thinksAtom.name}_set');
  }

  final _$getDataAsyncAction = AsyncAction('getData');

  @override
  Future getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  final _$addThinkAsyncAction = AsyncAction('addThink');

  @override
  Future addThink(Think think) {
    return _$addThinkAsyncAction.run(() => super.addThink(think));
  }

  final _$_AppStateBaseActionController =
      ActionController(name: '_AppStateBase');

  @override
  dynamic deleteThink(Think think) {
    final _$actionInfo = _$_AppStateBaseActionController.startAction();
    try {
      return super.deleteThink(think);
    } finally {
      _$_AppStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateThink(Think think) {
    final _$actionInfo = _$_AppStateBaseActionController.startAction();
    try {
      return super.updateThink(think);
    } finally {
      _$_AppStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addAnnotation(Annotation annotation) {
    final _$actionInfo = _$_AppStateBaseActionController.startAction();
    try {
      return super.addAnnotation(annotation);
    } finally {
      _$_AppStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic deleteAnnotation(Annotation annotation) {
    final _$actionInfo = _$_AppStateBaseActionController.startAction();
    try {
      return super.deleteAnnotation(annotation);
    } finally {
      _$_AppStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateAnnotation(Annotation annotation) {
    final _$actionInfo = _$_AppStateBaseActionController.startAction();
    try {
      return super.updateAnnotation(annotation);
    } finally {
      _$_AppStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'thinks: ${thinks.toString()}';
    return '{$string}';
  }
}
