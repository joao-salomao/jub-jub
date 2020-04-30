// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppController on _AppControllerBase, Store {
  final _$thinksAtom = Atom(name: '_AppControllerBase.thinks');

  @override
  ObservableList<ThinkModel> get thinks {
    _$thinksAtom.context.enforceReadPolicy(_$thinksAtom);
    _$thinksAtom.reportObserved();
    return super.thinks;
  }

  @override
  set thinks(ObservableList<ThinkModel> value) {
    _$thinksAtom.context.conditionallyRunInAction(() {
      super.thinks = value;
      _$thinksAtom.reportChanged();
    }, _$thinksAtom, name: '${_$thinksAtom.name}_set');
  }

  final _$mainTitleAtom = Atom(name: '_AppControllerBase.mainTitle');

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

  final _$primaryColorAtom = Atom(name: '_AppControllerBase.primaryColor');

  @override
  Color get primaryColor {
    _$primaryColorAtom.context.enforceReadPolicy(_$primaryColorAtom);
    _$primaryColorAtom.reportObserved();
    return super.primaryColor;
  }

  @override
  set primaryColor(Color value) {
    _$primaryColorAtom.context.conditionallyRunInAction(() {
      super.primaryColor = value;
      _$primaryColorAtom.reportChanged();
    }, _$primaryColorAtom, name: '${_$primaryColorAtom.name}_set');
  }

  final _$getDataAsyncAction = AsyncAction('getData');

  @override
  Future getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  final _$saveThinkAsyncAction = AsyncAction('saveThink');

  @override
  Future saveThink(ThinkModel think) {
    return _$saveThinkAsyncAction.run(() => super.saveThink(think));
  }

  final _$deleteThinkAsyncAction = AsyncAction('deleteThink');

  @override
  Future deleteThink(ThinkModel think) {
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
  Future deleteAnnotation(AnnotationModel annotation) {
    return _$deleteAnnotationAsyncAction
        .run(() => super.deleteAnnotation(annotation));
  }

  final _$_AppControllerBaseActionController =
      ActionController(name: '_AppControllerBase');

  @override
  dynamic getMainTitle() {
    final _$actionInfo = _$_AppControllerBaseActionController.startAction();
    try {
      return super.getMainTitle();
    } finally {
      _$_AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getPrimaryColor() {
    final _$actionInfo = _$_AppControllerBaseActionController.startAction();
    try {
      return super.getPrimaryColor();
    } finally {
      _$_AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updatePrimaryColor(Color color) {
    final _$actionInfo = _$_AppControllerBaseActionController.startAction();
    try {
      return super.updatePrimaryColor(color);
    } finally {
      _$_AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateMainTitle(String text) {
    final _$actionInfo = _$_AppControllerBaseActionController.startAction();
    try {
      return super.updateMainTitle(text);
    } finally {
      _$_AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic saveAnnotation(AnnotationModel annotation,
      {List<AnnotationFileModel> deletedFiles}) {
    final _$actionInfo = _$_AppControllerBaseActionController.startAction();
    try {
      return super.saveAnnotation(annotation, deletedFiles: deletedFiles);
    } finally {
      _$_AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'thinks: ${thinks.toString()},mainTitle: ${mainTitle.toString()},primaryColor: ${primaryColor.toString()}';
    return '{$string}';
  }
}
