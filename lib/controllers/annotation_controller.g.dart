// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annotation_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AnnotationController on _AnnotationControllerBase, Store {
  final _$thinkAtom = Atom(name: '_AnnotationControllerBase.think');

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

  final _$_AnnotationControllerBaseActionController =
      ActionController(name: '_AnnotationControllerBase');

  @override
  dynamic deleteAnnotation(AnnotationModel annotationModel) {
    final _$actionInfo =
        _$_AnnotationControllerBaseActionController.startAction();
    try {
      return super.deleteAnnotation(annotationModel);
    } finally {
      _$_AnnotationControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic reOrderAnnotations(int oldIndex, int newIndex) {
    final _$actionInfo =
        _$_AnnotationControllerBaseActionController.startAction();
    try {
      return super.reOrderAnnotations(oldIndex, newIndex);
    } finally {
      _$_AnnotationControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'think: ${think.toString()}';
    return '{$string}';
  }
}
