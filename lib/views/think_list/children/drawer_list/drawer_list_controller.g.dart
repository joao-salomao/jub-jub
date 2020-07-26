// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drawer_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DrawerListController on _DrawerListControllerBase, Store {
  Computed<bool> _$hasUserComputed;

  @override
  bool get hasUser => (_$hasUserComputed ??= Computed<bool>(() => super.hasUser,
          name: '_DrawerListControllerBase.hasUser'))
      .value;

  final _$loginAsyncAction = AsyncAction('_DrawerListControllerBase.login');

  @override
  Future login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  final _$_DrawerListControllerBaseActionController =
      ActionController(name: '_DrawerListControllerBase');

  @override
  dynamic updateMainTitle(String text) {
    final _$actionInfo = _$_DrawerListControllerBaseActionController
        .startAction(name: '_DrawerListControllerBase.updateMainTitle');
    try {
      return super.updateMainTitle(text);
    } finally {
      _$_DrawerListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateBrightness(Brightness value, BuildContext context) {
    final _$actionInfo = _$_DrawerListControllerBaseActionController
        .startAction(name: '_DrawerListControllerBase.updateBrightness');
    try {
      return super.updateBrightness(value, context);
    } finally {
      _$_DrawerListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic logout() {
    final _$actionInfo = _$_DrawerListControllerBaseActionController
        .startAction(name: '_DrawerListControllerBase.logout');
    try {
      return super.logout();
    } finally {
      _$_DrawerListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
hasUser: ${hasUser}
    ''';
  }
}
