// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annotation_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AnnotationModel on _AnnotationModelBase, Store {
  final _$idAtom = Atom(name: '_AnnotationModelBase.id');

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

  final _$thinkIdAtom = Atom(name: '_AnnotationModelBase.thinkId');

  @override
  int get thinkId {
    _$thinkIdAtom.reportRead();
    return super.thinkId;
  }

  @override
  set thinkId(int value) {
    _$thinkIdAtom.reportWrite(value, super.thinkId, () {
      super.thinkId = value;
    });
  }

  final _$titleAtom = Atom(name: '_AnnotationModelBase.title');

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

  final _$textAtom = Atom(name: '_AnnotationModelBase.text');

  @override
  String get text {
    _$textAtom.reportRead();
    return super.text;
  }

  @override
  set text(String value) {
    _$textAtom.reportWrite(value, super.text, () {
      super.text = value;
    });
  }

  final _$colorAtom = Atom(name: '_AnnotationModelBase.color');

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

  final _$listIndexAtom = Atom(name: '_AnnotationModelBase.listIndex');

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

  final _$passwordAtom = Atom(name: '_AnnotationModelBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$createdAtAtom = Atom(name: '_AnnotationModelBase.createdAt');

  @override
  String get createdAt {
    _$createdAtAtom.reportRead();
    return super.createdAt;
  }

  @override
  set createdAt(String value) {
    _$createdAtAtom.reportWrite(value, super.createdAt, () {
      super.createdAt = value;
    });
  }

  final _$filesAtom = Atom(name: '_AnnotationModelBase.files');

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

  @override
  String toString() {
    return '''
id: ${id},
thinkId: ${thinkId},
title: ${title},
text: ${text},
color: ${color},
listIndex: ${listIndex},
password: ${password},
createdAt: ${createdAt},
files: ${files}
    ''';
  }
}
