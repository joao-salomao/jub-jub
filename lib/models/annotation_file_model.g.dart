// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annotation_file_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AnnotationFileModel on _AnnotationFileModelBase, Store {
  final _$idAtom = Atom(name: '_AnnotationFileModelBase.id');

  @override
  int get id {
    _$idAtom.context.enforceReadPolicy(_$idAtom);
    _$idAtom.reportObserved();
    return super.id;
  }

  @override
  set id(int value) {
    _$idAtom.context.conditionallyRunInAction(() {
      super.id = value;
      _$idAtom.reportChanged();
    }, _$idAtom, name: '${_$idAtom.name}_set');
  }

  final _$fileAtom = Atom(name: '_AnnotationFileModelBase.file');

  @override
  File get file {
    _$fileAtom.context.enforceReadPolicy(_$fileAtom);
    _$fileAtom.reportObserved();
    return super.file;
  }

  @override
  set file(File value) {
    _$fileAtom.context.conditionallyRunInAction(() {
      super.file = value;
      _$fileAtom.reportChanged();
    }, _$fileAtom, name: '${_$fileAtom.name}_set');
  }

  final _$pathAtom = Atom(name: '_AnnotationFileModelBase.path');

  @override
  String get path {
    _$pathAtom.context.enforceReadPolicy(_$pathAtom);
    _$pathAtom.reportObserved();
    return super.path;
  }

  @override
  set path(String value) {
    _$pathAtom.context.conditionallyRunInAction(() {
      super.path = value;
      _$pathAtom.reportChanged();
    }, _$pathAtom, name: '${_$pathAtom.name}_set');
  }

  final _$typeAtom = Atom(name: '_AnnotationFileModelBase.type');

  @override
  String get type {
    _$typeAtom.context.enforceReadPolicy(_$typeAtom);
    _$typeAtom.reportObserved();
    return super.type;
  }

  @override
  set type(String value) {
    _$typeAtom.context.conditionallyRunInAction(() {
      super.type = value;
      _$typeAtom.reportChanged();
    }, _$typeAtom, name: '${_$typeAtom.name}_set');
  }

  final _$titleAtom = Atom(name: '_AnnotationFileModelBase.title');

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

  final _$annotationIdAtom =
      Atom(name: '_AnnotationFileModelBase.annotationId');

  @override
  int get annotationId {
    _$annotationIdAtom.context.enforceReadPolicy(_$annotationIdAtom);
    _$annotationIdAtom.reportObserved();
    return super.annotationId;
  }

  @override
  set annotationId(int value) {
    _$annotationIdAtom.context.conditionallyRunInAction(() {
      super.annotationId = value;
      _$annotationIdAtom.reportChanged();
    }, _$annotationIdAtom, name: '${_$annotationIdAtom.name}_set');
  }

  final _$descriptionAtom = Atom(name: '_AnnotationFileModelBase.description');

  @override
  String get description {
    _$descriptionAtom.context.enforceReadPolicy(_$descriptionAtom);
    _$descriptionAtom.reportObserved();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.context.conditionallyRunInAction(() {
      super.description = value;
      _$descriptionAtom.reportChanged();
    }, _$descriptionAtom, name: '${_$descriptionAtom.name}_set');
  }

  final _$fileNameAtom = Atom(name: '_AnnotationFileModelBase.fileName');

  @override
  String get fileName {
    _$fileNameAtom.context.enforceReadPolicy(_$fileNameAtom);
    _$fileNameAtom.reportObserved();
    return super.fileName;
  }

  @override
  set fileName(String value) {
    _$fileNameAtom.context.conditionallyRunInAction(() {
      super.fileName = value;
      _$fileNameAtom.reportChanged();
    }, _$fileNameAtom, name: '${_$fileNameAtom.name}_set');
  }

  final _$controllerAtom = Atom(name: '_AnnotationFileModelBase.controller');

  @override
  dynamic get controller {
    _$controllerAtom.context.enforceReadPolicy(_$controllerAtom);
    _$controllerAtom.reportObserved();
    return super.controller;
  }

  @override
  set controller(dynamic value) {
    _$controllerAtom.context.conditionallyRunInAction(() {
      super.controller = value;
      _$controllerAtom.reportChanged();
    }, _$controllerAtom, name: '${_$controllerAtom.name}_set');
  }

  final _$setFileNameAsyncAction = AsyncAction('setFileName');

  @override
  Future setFileName(File file) {
    return _$setFileNameAsyncAction.run(() => super.setFileName(file));
  }

  final _$_AnnotationFileModelBaseActionController =
      ActionController(name: '_AnnotationFileModelBase');

  @override
  dynamic disposeController() {
    final _$actionInfo =
        _$_AnnotationFileModelBaseActionController.startAction();
    try {
      return super.disposeController();
    } finally {
      _$_AnnotationFileModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'id: ${id.toString()},file: ${file.toString()},path: ${path.toString()},type: ${type.toString()},title: ${title.toString()},annotationId: ${annotationId.toString()},description: ${description.toString()},fileName: ${fileName.toString()},controller: ${controller.toString()}';
    return '{$string}';
  }
}
