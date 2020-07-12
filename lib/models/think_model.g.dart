// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'think_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ThinkModel on _ThinkModelBase, Store {
  final _$idAtom = Atom(name: '_ThinkModelBase.id');

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

  final _$listIndexAtom = Atom(name: '_ThinkModelBase.listIndex');

  @override
  int get listIndex {
    _$listIndexAtom.reportRead();
    return super.listIndex;
  }

  @override
  set listIndex(int value) {
    _$listIndexAtom.reportWrite(value, super.listIndex, () {
      super.listIndex = value;
    });
  }

  final _$titleAtom = Atom(name: '_ThinkModelBase.title');

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

  final _$colorAtom = Atom(name: '_ThinkModelBase.color');

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

  final _$createdAtAtom = Atom(name: '_ThinkModelBase.createdAt');

  @override
  DateTime get createdAt {
    _$createdAtAtom.reportRead();
    return super.createdAt;
  }

  @override
  set createdAt(DateTime value) {
    _$createdAtAtom.reportWrite(value, super.createdAt, () {
      super.createdAt = value;
    });
  }

  final _$annotationsAtom = Atom(name: '_ThinkModelBase.annotations');

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

  @override
  String toString() {
    return '''
id: ${id},
listIndex: ${listIndex},
title: ${title},
color: ${color},
createdAt: ${createdAt},
annotations: ${annotations}
    ''';
  }
}
