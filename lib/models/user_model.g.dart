// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserModel on _UserModelBase, Store {
  final _$clientAtom = Atom(name: '_UserModelBase.client');

  @override
  dynamic get client {
    _$clientAtom.context.enforceReadPolicy(_$clientAtom);
    _$clientAtom.reportObserved();
    return super.client;
  }

  @override
  set client(dynamic value) {
    _$clientAtom.context.conditionallyRunInAction(() {
      super.client = value;
      _$clientAtom.reportChanged();
    }, _$clientAtom, name: '${_$clientAtom.name}_set');
  }

  final _$nameAtom = Atom(name: '_UserModelBase.name');

  @override
  String get name {
    _$nameAtom.context.enforceReadPolicy(_$nameAtom);
    _$nameAtom.reportObserved();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.context.conditionallyRunInAction(() {
      super.name = value;
      _$nameAtom.reportChanged();
    }, _$nameAtom, name: '${_$nameAtom.name}_set');
  }

  final _$emailAtom = Atom(name: '_UserModelBase.email');

  @override
  String get email {
    _$emailAtom.context.enforceReadPolicy(_$emailAtom);
    _$emailAtom.reportObserved();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.context.conditionallyRunInAction(() {
      super.email = value;
      _$emailAtom.reportChanged();
    }, _$emailAtom, name: '${_$emailAtom.name}_set');
  }

  final _$photoUrlAtom = Atom(name: '_UserModelBase.photoUrl');

  @override
  String get photoUrl {
    _$photoUrlAtom.context.enforceReadPolicy(_$photoUrlAtom);
    _$photoUrlAtom.reportObserved();
    return super.photoUrl;
  }

  @override
  set photoUrl(String value) {
    _$photoUrlAtom.context.conditionallyRunInAction(() {
      super.photoUrl = value;
      _$photoUrlAtom.reportChanged();
    }, _$photoUrlAtom, name: '${_$photoUrlAtom.name}_set');
  }

  @override
  String toString() {
    final string =
        'client: ${client.toString()},name: ${name.toString()},email: ${email.toString()},photoUrl: ${photoUrl.toString()}';
    return '{$string}';
  }
}
