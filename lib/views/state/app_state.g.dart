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

  final _$mainTitleAtom = Atom(name: '_AppStateBase.mainTitle');

  @override
  String get mainTitle {
    _$mainTitleAtom.context.enforceReadPolicy(_$mainTitleAtom);
    _$mainTitleAtom.reportObserved();
    return super.mainTitle;
  }

  @override
  set mainTitle(String value) {
    _$mainTitleAtom.context.conditionallyRunInAction(() {
      super.mainTitle = value;
      _$mainTitleAtom.reportChanged();
    }, _$mainTitleAtom, name: '${_$mainTitleAtom.name}_set');
  }

  final _$getDataAsyncAction = AsyncAction('getData');

  @override
  Future getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  final _$saveThinkAsyncAction = AsyncAction('saveThink');

  @override
  Future saveThink(Think think) {
    return _$saveThinkAsyncAction.run(() => super.saveThink(think));
  }

  final _$deleteThinkAsyncAction = AsyncAction('deleteThink');

  @override
  Future deleteThink(Think think) {
    return _$deleteThinkAsyncAction.run(() => super.deleteThink(think));
  }

  final _$getThinkAnnotationsAsyncAction = AsyncAction('getThinkAnnotations');

  @override
  Future getThinkAnnotations(int thinkId) {
    return _$getThinkAnnotationsAsyncAction
        .run(() => super.getThinkAnnotations(thinkId));
  }

  final _$getAnnotationFilesAsyncAction = AsyncAction('getAnnotationFiles');

  @override
  Future getAnnotationFiles(int annotationId) {
    return _$getAnnotationFilesAsyncAction
        .run(() => super.getAnnotationFiles(annotationId));
  }

  final _$deleteAnnotationAsyncAction = AsyncAction('deleteAnnotation');

  @override
  Future deleteAnnotation(Annotation annotation) {
    return _$deleteAnnotationAsyncAction
        .run(() => super.deleteAnnotation(annotation));
  }

  final _$_AppStateBaseActionController =
      ActionController(name: '_AppStateBase');

  @override
  dynamic updateMainTitle(String text) {
    final _$actionInfo = _$_AppStateBaseActionController.startAction();
    try {
      return super.updateMainTitle(text);
    } finally {
      _$_AppStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic saveAnnotation(Annotation annotation,
      {List<AnnotationFile> deletedFiles}) {
    final _$actionInfo = _$_AppStateBaseActionController.startAction();
    try {
      return super.saveAnnotation(annotation, deletedFiles: deletedFiles);
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
    final string =
        'thinks: ${thinks.toString()},mainTitle: ${mainTitle.toString()}';
    return '{$string}';
  }
}
