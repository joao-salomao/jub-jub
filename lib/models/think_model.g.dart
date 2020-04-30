// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'think_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ThinkModel on _ThinkModelBase, Store {
  final _$idAtom = Atom(name: '_ThinkModelBase.id');

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

  final _$listIndexAtom = Atom(name: '_ThinkModelBase.listIndex');

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

  final _$titleAtom = Atom(name: '_ThinkModelBase.title');

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

  final _$colorAtom = Atom(name: '_ThinkModelBase.color');

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

  final _$createdAtAtom = Atom(name: '_ThinkModelBase.createdAt');

  @override
  DateTime get createdAt {
    _$createdAtAtom.context.enforceReadPolicy(_$createdAtAtom);
    _$createdAtAtom.reportObserved();
    return super.createdAt;
  }

  @override
  set createdAt(DateTime value) {
    _$createdAtAtom.context.conditionallyRunInAction(() {
      super.createdAt = value;
      _$createdAtAtom.reportChanged();
    }, _$createdAtAtom, name: '${_$createdAtAtom.name}_set');
  }

  final _$annotationsAtom = Atom(name: '_ThinkModelBase.annotations');

  @override
  ObservableList<AnnotationModel> get annotations {
    _$annotationsAtom.context.enforceReadPolicy(_$annotationsAtom);
    _$annotationsAtom.reportObserved();
    return super.annotations;
  }

  @override
  set annotations(ObservableList<AnnotationModel> value) {
    _$annotationsAtom.context.conditionallyRunInAction(() {
      super.annotations = value;
      _$annotationsAtom.reportChanged();
    }, _$annotationsAtom, name: '${_$annotationsAtom.name}_set');
  }

  @override
  String toString() {
    final string =
        'id: ${id.toString()},listIndex: ${listIndex.toString()},title: ${title.toString()},color: ${color.toString()},createdAt: ${createdAt.toString()},annotations: ${annotations.toString()}';
    return '{$string}';
  }
}
