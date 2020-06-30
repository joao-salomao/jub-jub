// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppController on _AppControllerBase, Store {
  Computed<bool> _$hasUserComputed;

  @override
  bool get hasUser =>
      (_$hasUserComputed ??= Computed<bool>(() => super.hasUser)).value;
  Computed<bool> _$brightnessIsDarkComputed;

  @override
  bool get brightnessIsDark => (_$brightnessIsDarkComputed ??=
          Computed<bool>(() => super.brightnessIsDark))
      .value;

  final _$currentUserAtom = Atom(name: '_AppControllerBase.currentUser');

  @override
  UserModel get currentUser {
    _$currentUserAtom.context.enforceReadPolicy(_$currentUserAtom);
    _$currentUserAtom.reportObserved();
    return super.currentUser;
  }

  @override
  set currentUser(UserModel value) {
    _$currentUserAtom.context.conditionallyRunInAction(() {
      super.currentUser = value;
      _$currentUserAtom.reportChanged();
    }, _$currentUserAtom, name: '${_$currentUserAtom.name}_set');
  }

  final _$thinksAtom = Atom(name: '_AppControllerBase.thinks');

  @override
  ObservableList<ThinkModel> get thinks {
    _$thinksAtom.context.enforceReadPolicy(_$thinksAtom);
    _$thinksAtom.reportObserved();
    return super.thinks;
  }

  @override
  set thinks(ObservableList<ThinkModel> value) {
    _$thinksAtom.context.conditionallyRunInAction(() {
      super.thinks = value;
      _$thinksAtom.reportChanged();
    }, _$thinksAtom, name: '${_$thinksAtom.name}_set');
  }

  final _$mainTitleAtom = Atom(name: '_AppControllerBase.mainTitle');

  @override
  String get mainTitle {
    _$mainTitleAtom.context.enforceReadPolicy(_$mainTitleAtom);
    _$mainTitleAtom.reportObserved();
    return super.mainTitle;
  }

  @override
  set mainTitle(String value) {
    _$mainTitleAtom.context.conditionallyRunInAction(() {
      super.mainTitle = value;
      _$mainTitleAtom.reportChanged();
    }, _$mainTitleAtom, name: '${_$mainTitleAtom.name}_set');
  }

  final _$brightnessAtom = Atom(name: '_AppControllerBase.brightness');

  @override
  Brightness get brightness {
    _$brightnessAtom.context.enforceReadPolicy(_$brightnessAtom);
    _$brightnessAtom.reportObserved();
    return super.brightness;
  }

  @override
  set brightness(Brightness value) {
    _$brightnessAtom.context.conditionallyRunInAction(() {
      super.brightness = value;
      _$brightnessAtom.reportChanged();
    }, _$brightnessAtom, name: '${_$brightnessAtom.name}_set');
  }

  final _$primaryColorAtom = Atom(name: '_AppControllerBase.primaryColor');

  @override
  Color get primaryColor {
    _$primaryColorAtom.context.enforceReadPolicy(_$primaryColorAtom);
    _$primaryColorAtom.reportObserved();
    return super.primaryColor;
  }

  @override
  set primaryColor(Color value) {
    _$primaryColorAtom.context.conditionallyRunInAction(() {
      super.primaryColor = value;
      _$primaryColorAtom.reportChanged();
    }, _$primaryColorAtom, name: '${_$primaryColorAtom.name}_set');
  }

  final _$isLoadingAtom = Atom(name: '_AppControllerBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.context.enforceReadPolicy(_$isLoadingAtom);
    _$isLoadingAtom.reportObserved();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.context.conditionallyRunInAction(() {
      super.isLoading = value;
      _$isLoadingAtom.reportChanged();
    }, _$isLoadingAtom, name: '${_$isLoadingAtom.name}_set');
  }

  final _$getDataAsyncAction = AsyncAction('getData');

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  final _$updateAnnotationThinkAsyncAction =
      AsyncAction('updateAnnotationThink');

  @override
  Future<void> updateAnnotationThink(
      AnnotationModel annotation, ThinkModel think) {
    return _$updateAnnotationThinkAsyncAction
        .run(() => super.updateAnnotationThink(annotation, think));
  }

  final _$saveThinkAsyncAction = AsyncAction('saveThink');

  @override
  Future saveThink(ThinkModel think) {
    return _$saveThinkAsyncAction.run(() => super.saveThink(think));
  }

  final _$deleteThinkAsyncAction = AsyncAction('deleteThink');

  @override
  Future deleteThink(ThinkModel think) {
    return _$deleteThinkAsyncAction.run(() => super.deleteThink(think));
  }

  final _$getThinkAnnotationsAsyncAction = AsyncAction('getThinkAnnotations');

  @override
  Future getThinkAnnotations(int thinkId) {
    return _$getThinkAnnotationsAsyncAction
        .run(() => super.getThinkAnnotations(thinkId));
  }

  final _$getAnnotationFilesAsyncAction = AsyncAction('getAnnotationFiles');

  @override
  Future getAnnotationFiles(int annotationId) {
    return _$getAnnotationFilesAsyncAction
        .run(() => super.getAnnotationFiles(annotationId));
  }

  final _$saveAnnotationAsyncAction = AsyncAction('saveAnnotation');

  @override
  Future saveAnnotation(AnnotationModel annotation,
      {List<AnnotationFileModel> deletedFiles}) {
    return _$saveAnnotationAsyncAction.run(
        () => super.saveAnnotation(annotation, deletedFiles: deletedFiles));
  }

  final _$deleteAnnotationAsyncAction = AsyncAction('deleteAnnotation');

  @override
  Future deleteAnnotation(AnnotationModel annotation) {
    return _$deleteAnnotationAsyncAction
        .run(() => super.deleteAnnotation(annotation));
  }

  final _$getCurrentUserAsyncAction = AsyncAction('getCurrentUser');

  @override
  Future getCurrentUser() {
    return _$getCurrentUserAsyncAction.run(() => super.getCurrentUser());
  }

  final _$_AppControllerBaseActionController =
      ActionController(name: '_AppControllerBase');

  @override
  dynamic setBrightness(Brightness value, BuildContext context) {
    final _$actionInfo = _$_AppControllerBaseActionController.startAction();
    try {
      return super.setBrightness(value, context);
    } finally {
      _$_AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getBrightness(BuildContext context) {
    final _$actionInfo = _$_AppControllerBaseActionController.startAction();
    try {
      return super.getBrightness(context);
    } finally {
      _$_AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic reOrderThinks(int oldIndex, int newIndex) {
    final _$actionInfo = _$_AppControllerBaseActionController.startAction();
    try {
      return super.reOrderThinks(oldIndex, newIndex);
    } finally {
      _$_AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getMainTitle() {
    final _$actionInfo = _$_AppControllerBaseActionController.startAction();
    try {
      return super.getMainTitle();
    } finally {
      _$_AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getPrimaryColor() {
    final _$actionInfo = _$_AppControllerBaseActionController.startAction();
    try {
      return super.getPrimaryColor();
    } finally {
      _$_AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updatePrimaryColor(Color color) {
    final _$actionInfo = _$_AppControllerBaseActionController.startAction();
    try {
      return super.updatePrimaryColor(color);
    } finally {
      _$_AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateMainTitle(String text) {
    final _$actionInfo = _$_AppControllerBaseActionController.startAction();
    try {
      return super.updateMainTitle(text);
    } finally {
      _$_AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic login() {
    final _$actionInfo = _$_AppControllerBaseActionController.startAction();
    try {
      return super.login();
    } finally {
      _$_AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic logout() {
    final _$actionInfo = _$_AppControllerBaseActionController.startAction();
    try {
      return super.logout();
    } finally {
      _$_AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'currentUser: ${currentUser.toString()},thinks: ${thinks.toString()},mainTitle: ${mainTitle.toString()},brightness: ${brightness.toString()},primaryColor: ${primaryColor.toString()},isLoading: ${isLoading.toString()},hasUser: ${hasUser.toString()},brightnessIsDark: ${brightnessIsDark.toString()}';
    return '{$string}';
  }
}
