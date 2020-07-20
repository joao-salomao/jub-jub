// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annotation_form_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AnnotationFormController on _AnnotationFormControllerBase, Store {
  Computed<dynamic> _$popupMenuButtonColorComputed;

  @override
  dynamic get popupMenuButtonColor => (_$popupMenuButtonColorComputed ??=
          Computed<dynamic>(() => super.popupMenuButtonColor,
              name: '_AnnotationFormControllerBase.popupMenuButtonColor'))
      .value;
  Computed<bool> _$hasNoChangesComputed;

  @override
  bool get hasNoChanges =>
      (_$hasNoChangesComputed ??= Computed<bool>(() => super.hasNoChanges,
              name: '_AnnotationFormControllerBase.hasNoChanges'))
          .value;

  final _$thinkAtom = Atom(name: '_AnnotationFormControllerBase.think');

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

  final _$annotationAtom =
      Atom(name: '_AnnotationFormControllerBase.annotation');

  @override
  AnnotationModel get annotation {
    _$annotationAtom.reportRead();
    return super.annotation;
  }

  @override
  set annotation(AnnotationModel value) {
    _$annotationAtom.reportWrite(value, super.annotation, () {
      super.annotation = value;
    });
  }

  final _$colorAtom = Atom(name: '_AnnotationFormControllerBase.color');

  @override
  Color get color {
    _$colorAtom.reportRead();
    return super.color;
  }

  @override
  set color(Color value) {
    _$colorAtom.reportWrite(value, super.color, () {
      super.color = value;
    });
  }

  final _$filesAtom = Atom(name: '_AnnotationFormControllerBase.files');

  @override
  ObservableList<AnnotationFileModel> get files {
    _$filesAtom.reportRead();
    return super.files;
  }

  @override
  set files(ObservableList<AnnotationFileModel> value) {
    _$filesAtom.reportWrite(value, super.files, () {
      super.files = value;
    });
  }

  final _$deletedFilesAtom =
      Atom(name: '_AnnotationFormControllerBase.deletedFiles');

  @override
  ObservableList<AnnotationFileModel> get deletedFiles {
    _$deletedFilesAtom.reportRead();
    return super.deletedFiles;
  }

  @override
  set deletedFiles(ObservableList<AnnotationFileModel> value) {
    _$deletedFilesAtom.reportWrite(value, super.deletedFiles, () {
      super.deletedFiles = value;
    });
  }

  final _$_AnnotationFormControllerBaseActionController =
      ActionController(name: '_AnnotationFormControllerBase');

  @override
  dynamic validateForm() {
    final _$actionInfo = _$_AnnotationFormControllerBaseActionController
        .startAction(name: '_AnnotationFormControllerBase.validateForm');
    try {
      return super.validateForm();
    } finally {
      _$_AnnotationFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setColor(Color color) {
    final _$actionInfo = _$_AnnotationFormControllerBaseActionController
        .startAction(name: '_AnnotationFormControllerBase.setColor');
    try {
      return super.setColor(color);
    } finally {
      _$_AnnotationFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _addAnnotationToThink(AnnotationModel ant) {
    final _$actionInfo =
        _$_AnnotationFormControllerBaseActionController.startAction(
            name: '_AnnotationFormControllerBase._addAnnotationToThink');
    try {
      return super._addAnnotationToThink(ant);
    } finally {
      _$_AnnotationFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _persistAnnotation(AnnotationModel annotation) {
    final _$actionInfo = _$_AnnotationFormControllerBaseActionController
        .startAction(name: '_AnnotationFormControllerBase._persistAnnotation');
    try {
      return super._persistAnnotation(annotation);
    } finally {
      _$_AnnotationFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic save() {
    final _$actionInfo = _$_AnnotationFormControllerBaseActionController
        .startAction(name: '_AnnotationFormControllerBase.save');
    try {
      return super.save();
    } finally {
      _$_AnnotationFormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
think: ${think},
annotation: ${annotation},
color: ${color},
files: ${files},
deletedFiles: ${deletedFiles},
popupMenuButtonColor: ${popupMenuButtonColor},
hasNoChanges: ${hasNoChanges}
    ''';
  }
}
