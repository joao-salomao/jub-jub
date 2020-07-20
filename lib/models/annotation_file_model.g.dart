// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annotation_file_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AnnotationFileModel on _AnnotationFileModelBase, Store {
  final _$idAtom = Atom(name: '_AnnotationFileModelBase.id');

  @override
  int get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(int value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  final _$fileAtom = Atom(name: '_AnnotationFileModelBase.file');

  @override
  File get file {
    _$fileAtom.reportRead();
    return super.file;
  }

  @override
  set file(File value) {
    _$fileAtom.reportWrite(value, super.file, () {
      super.file = value;
    });
  }

  final _$pathAtom = Atom(name: '_AnnotationFileModelBase.path');

  @override
  String get path {
    _$pathAtom.reportRead();
    return super.path;
  }

  @override
  set path(String value) {
    _$pathAtom.reportWrite(value, super.path, () {
      super.path = value;
    });
  }

  final _$typeAtom = Atom(name: '_AnnotationFileModelBase.type');

  @override
  String get type {
    _$typeAtom.reportRead();
    return super.type;
  }

  @override
  set type(String value) {
    _$typeAtom.reportWrite(value, super.type, () {
      super.type = value;
    });
  }

  final _$titleAtom = Atom(name: '_AnnotationFileModelBase.title');

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$annotationIdAtom =
      Atom(name: '_AnnotationFileModelBase.annotationId');

  @override
  int get annotationId {
    _$annotationIdAtom.reportRead();
    return super.annotationId;
  }

  @override
  set annotationId(int value) {
    _$annotationIdAtom.reportWrite(value, super.annotationId, () {
      super.annotationId = value;
    });
  }

  final _$descriptionAtom = Atom(name: '_AnnotationFileModelBase.description');

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  final _$fileNameAtom = Atom(name: '_AnnotationFileModelBase.fileName');

  @override
  String get fileName {
    _$fileNameAtom.reportRead();
    return super.fileName;
  }

  @override
  set fileName(String value) {
    _$fileNameAtom.reportWrite(value, super.fileName, () {
      super.fileName = value;
    });
  }

  final _$controllerAtom = Atom(name: '_AnnotationFileModelBase.controller');

  @override
  dynamic get controller {
    _$controllerAtom.reportRead();
    return super.controller;
  }

  @override
  set controller(dynamic value) {
    _$controllerAtom.reportWrite(value, super.controller, () {
      super.controller = value;
    });
  }

  final _$setFileNameAsyncAction =
      AsyncAction('_AnnotationFileModelBase.setFileName');

  @override
  Future setFileName(File file) {
    return _$setFileNameAsyncAction.run(() => super.setFileName(file));
  }

  final _$_AnnotationFileModelBaseActionController =
      ActionController(name: '_AnnotationFileModelBase');

  @override
  dynamic disposeController() {
    final _$actionInfo = _$_AnnotationFileModelBaseActionController.startAction(
        name: '_AnnotationFileModelBase.disposeController');
    try {
      return super.disposeController();
    } finally {
      _$_AnnotationFileModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
file: ${file},
path: ${path},
type: ${type},
title: ${title},
annotationId: ${annotationId},
description: ${description},
fileName: ${fileName},
controller: ${controller}
    ''';
  }
}
