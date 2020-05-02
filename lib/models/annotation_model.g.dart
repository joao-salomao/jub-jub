// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annotation_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AnnotationModel on _AnnotationModelBase, Store {
  final _$idAtom = Atom(name: '_AnnotationModelBase.id');

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

  final _$thinkIdAtom = Atom(name: '_AnnotationModelBase.thinkId');

  @override
  int get thinkId {
    _$thinkIdAtom.context.enforceReadPolicy(_$thinkIdAtom);
    _$thinkIdAtom.reportObserved();
    return super.thinkId;
  }

  @override
  set thinkId(int value) {
    _$thinkIdAtom.context.conditionallyRunInAction(() {
      super.thinkId = value;
      _$thinkIdAtom.reportChanged();
    }, _$thinkIdAtom, name: '${_$thinkIdAtom.name}_set');
  }

  final _$titleAtom = Atom(name: '_AnnotationModelBase.title');

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

  final _$textAtom = Atom(name: '_AnnotationModelBase.text');

  @override
  String get text {
    _$textAtom.context.enforceReadPolicy(_$textAtom);
    _$textAtom.reportObserved();
    return super.text;
  }

  @override
  set text(String value) {
    _$textAtom.context.conditionallyRunInAction(() {
      super.text = value;
      _$textAtom.reportChanged();
    }, _$textAtom, name: '${_$textAtom.name}_set');
  }

  final _$colorAtom = Atom(name: '_AnnotationModelBase.color');

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

  final _$listIndexAtom = Atom(name: '_AnnotationModelBase.listIndex');

  @override
  int get listIndex {
    _$listIndexAtom.context.enforceReadPolicy(_$listIndexAtom);
    _$listIndexAtom.reportObserved();
    return super.listIndex;
  }

  @override
  set listIndex(int value) {
    _$listIndexAtom.context.conditionallyRunInAction(() {
      super.listIndex = value;
      _$listIndexAtom.reportChanged();
    }, _$listIndexAtom, name: '${_$listIndexAtom.name}_set');
  }

  final _$passwordAtom = Atom(name: '_AnnotationModelBase.password');

  @override
  String get password {
    _$passwordAtom.context.enforceReadPolicy(_$passwordAtom);
    _$passwordAtom.reportObserved();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.context.conditionallyRunInAction(() {
      super.password = value;
      _$passwordAtom.reportChanged();
    }, _$passwordAtom, name: '${_$passwordAtom.name}_set');
  }

  final _$createdAtAtom = Atom(name: '_AnnotationModelBase.createdAt');

  @override
  String get createdAt {
    _$createdAtAtom.context.enforceReadPolicy(_$createdAtAtom);
    _$createdAtAtom.reportObserved();
    return super.createdAt;
  }

  @override
  set createdAt(String value) {
    _$createdAtAtom.context.conditionallyRunInAction(() {
      super.createdAt = value;
      _$createdAtAtom.reportChanged();
    }, _$createdAtAtom, name: '${_$createdAtAtom.name}_set');
  }

  final _$filesAtom = Atom(name: '_AnnotationModelBase.files');

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

  @override
  String toString() {
    final string =
        'id: ${id.toString()},thinkId: ${thinkId.toString()},title: ${title.toString()},text: ${text.toString()},color: ${color.toString()},listIndex: ${listIndex.toString()},password: ${password.toString()},createdAt: ${createdAt.toString()},files: ${files.toString()}';
    return '{$string}';
  }
}
