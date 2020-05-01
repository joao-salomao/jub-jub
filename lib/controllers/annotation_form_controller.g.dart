// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annotation_form_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AnnotationFormController on _AnnotationFormControllerBase, Store {
  Computed<dynamic> _$popupMenuButtonColorComputed;

  @override
  dynamic get popupMenuButtonColor => (_$popupMenuButtonColorComputed ??=
          Computed<dynamic>(() => super.popupMenuButtonColor))
      .value;
  Computed<bool> _$hasNoChangesComputed;

  @override
  bool get hasNoChanges =>
      (_$hasNoChangesComputed ??= Computed<bool>(() => super.hasNoChanges))
          .value;

  final _$thinkAtom = Atom(name: '_AnnotationFormControllerBase.think');

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

  final _$annotationAtom =
      Atom(name: '_AnnotationFormControllerBase.annotation');

  @override
  AnnotationModel get annotation {
    _$annotationAtom.context.enforceReadPolicy(_$annotationAtom);
    _$annotationAtom.reportObserved();
    return super.annotation;
  }

  @override
  set annotation(AnnotationModel value) {
    _$annotationAtom.context.conditionallyRunInAction(() {
      super.annotation = value;
      _$annotationAtom.reportChanged();
    }, _$annotationAtom, name: '${_$annotationAtom.name}_set');
  }

  final _$colorAtom = Atom(name: '_AnnotationFormControllerBase.color');

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

  final _$filesAtom = Atom(name: '_AnnotationFormControllerBase.files');

  @override
  ObservableList<AnnotationFileModel> get files {
    _$filesAtom.context.enforceReadPolicy(_$filesAtom);
    _$filesAtom.reportObserved();
    return super.files;
  }

  @override
  set files(ObservableList<AnnotationFileModel> value) {
    _$filesAtom.context.conditionallyRunInAction(() {
      super.files = value;
      _$filesAtom.reportChanged();
    }, _$filesAtom, name: '${_$filesAtom.name}_set');
  }

  final _$deletedFilesAtom =
      Atom(name: '_AnnotationFormControllerBase.deletedFiles');

  @override
  ObservableList<AnnotationFileModel> get deletedFiles {
    _$deletedFilesAtom.context.enforceReadPolicy(_$deletedFilesAtom);
    _$deletedFilesAtom.reportObserved();
    return super.deletedFiles;
  }

  @override
  set deletedFiles(ObservableList<AnnotationFileModel> value) {
    _$deletedFilesAtom.context.conditionallyRunInAction(() {
      super.deletedFiles = value;
      _$deletedFilesAtom.reportChanged();
    }, _$deletedFilesAtom, name: '${_$deletedFilesAtom.name}_set');
  }

  final _$_AnnotationFormControllerBaseActionController =
      ActionController(name: '_AnnotationFormControllerBase');

  @override
  dynamic validateForm() {
    final _$actionInfo =
        _$_AnnotationFormControllerBaseActionController.startAction();
    try {
      return super.validateForm();
    } finally {
      _$_AnnotationFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setColor(Color color) {
    final _$actionInfo =
        _$_AnnotationFormControllerBaseActionController.startAction();
    try {
      return super.setColor(color);
    } finally {
      _$_AnnotationFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _addAnnotationToThink(AnnotationModel ant) {
    final _$actionInfo =
        _$_AnnotationFormControllerBaseActionController.startAction();
    try {
      return super._addAnnotationToThink(ant);
    } finally {
      _$_AnnotationFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _persistAnnotation(AnnotationModel annotation) {
    final _$actionInfo =
        _$_AnnotationFormControllerBaseActionController.startAction();
    try {
      return super._persistAnnotation(annotation);
    } finally {
      _$_AnnotationFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic save() {
    final _$actionInfo =
        _$_AnnotationFormControllerBaseActionController.startAction();
    try {
      return super.save();
    } finally {
      _$_AnnotationFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'think: ${think.toString()},annotation: ${annotation.toString()},color: ${color.toString()},files: ${files.toString()},deletedFiles: ${deletedFiles.toString()},popupMenuButtonColor: ${popupMenuButtonColor.toString()},hasNoChanges: ${hasNoChanges.toString()}';
    return '{$string}';
  }
}
