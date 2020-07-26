// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppController on _AppControllerBase, Store {
  Computed<bool> _$hasUserComputed;

  @override
  bool get hasUser => (_$hasUserComputed ??= Computed<bool>(() => super.hasUser,
          name: '_AppControllerBase.hasUser'))
      .value;
  Computed<bool> _$brightnessIsDarkComputed;

  @override
  bool get brightnessIsDark => (_$brightnessIsDarkComputed ??= Computed<bool>(
          () => super.brightnessIsDark,
          name: '_AppControllerBase.brightnessIsDark'))
      .value;

  final _$currentUserAtom = Atom(name: '_AppControllerBase.currentUser');

  @override
  UserModel get currentUser {
    _$currentUserAtom.reportRead();
    return super.currentUser;
  }

  @override
  set currentUser(UserModel value) {
    _$currentUserAtom.reportWrite(value, super.currentUser, () {
      super.currentUser = value;
    });
  }

  final _$thinksAtom = Atom(name: '_AppControllerBase.thinks');

  @override
  ObservableList<ThinkModel> get thinks {
    _$thinksAtom.reportRead();
    return super.thinks;
  }

  @override
  set thinks(ObservableList<ThinkModel> value) {
    _$thinksAtom.reportWrite(value, super.thinks, () {
      super.thinks = value;
    });
  }

  final _$mainTitleAtom = Atom(name: '_AppControllerBase.mainTitle');

  @override
  String get mainTitle {
    _$mainTitleAtom.reportRead();
    return super.mainTitle;
  }

  @override
  set mainTitle(String value) {
    _$mainTitleAtom.reportWrite(value, super.mainTitle, () {
      super.mainTitle = value;
    });
  }

  final _$brightnessAtom = Atom(name: '_AppControllerBase.brightness');

  @override
  Brightness get brightness {
    _$brightnessAtom.reportRead();
    return super.brightness;
  }

  @override
  set brightness(Brightness value) {
    _$brightnessAtom.reportWrite(value, super.brightness, () {
      super.brightness = value;
    });
  }

  final _$primaryColorAtom = Atom(name: '_AppControllerBase.primaryColor');

  @override
  Color get primaryColor {
    _$primaryColorAtom.reportRead();
    return super.primaryColor;
  }

  @override
  set primaryColor(Color value) {
    _$primaryColorAtom.reportWrite(value, super.primaryColor, () {
      super.primaryColor = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_AppControllerBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$getDataAsyncAction = AsyncAction('_AppControllerBase.getData');

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  final _$updateAnnotationThinkAsyncAction =
      AsyncAction('_AppControllerBase.updateAnnotationThink');

  @override
  Future<void> updateAnnotationThink(
      AnnotationModel annotation, ThinkModel think) {
    return _$updateAnnotationThinkAsyncAction
        .run(() => super.updateAnnotationThink(annotation, think));
  }

  final _$saveThinkAsyncAction = AsyncAction('_AppControllerBase.saveThink');

  @override
  Future saveThink(ThinkModel think) {
    return _$saveThinkAsyncAction.run(() => super.saveThink(think));
  }

  final _$deleteThinkAsyncAction =
      AsyncAction('_AppControllerBase.deleteThink');

  @override
  Future deleteThink(ThinkModel think) {
    return _$deleteThinkAsyncAction.run(() => super.deleteThink(think));
  }

  final _$getThinkAnnotationsAsyncAction =
      AsyncAction('_AppControllerBase.getThinkAnnotations');

  @override
  Future getThinkAnnotations(int thinkId) {
    return _$getThinkAnnotationsAsyncAction
        .run(() => super.getThinkAnnotations(thinkId));
  }

  final _$getAnnotationFilesAsyncAction =
      AsyncAction('_AppControllerBase.getAnnotationFiles');

  @override
  Future getAnnotationFiles(int annotationId) {
    return _$getAnnotationFilesAsyncAction
        .run(() => super.getAnnotationFiles(annotationId));
  }

  final _$saveAnnotationAsyncAction =
      AsyncAction('_AppControllerBase.saveAnnotation');

  @override
  Future saveAnnotation(AnnotationModel annotation,
      {List<AnnotationFileModel> deletedFiles}) {
    return _$saveAnnotationAsyncAction.run(
        () => super.saveAnnotation(annotation, deletedFiles: deletedFiles));
  }

  final _$deleteAnnotationAsyncAction =
      AsyncAction('_AppControllerBase.deleteAnnotation');

  @override
  Future deleteAnnotation(AnnotationModel annotation) {
    return _$deleteAnnotationAsyncAction
        .run(() => super.deleteAnnotation(annotation));
  }

  final _$getCurrentUserAsyncAction =
      AsyncAction('_AppControllerBase.getCurrentUser');

  @override
  Future getCurrentUser() {
    return _$getCurrentUserAsyncAction.run(() => super.getCurrentUser());
  }

  final _$_AppControllerBaseActionController =
      ActionController(name: '_AppControllerBase');

  @override
  dynamic setBrightness(Brightness value, BuildContext context) {
    final _$actionInfo = _$_AppControllerBaseActionController.startAction(
        name: '_AppControllerBase.setBrightness');
    try {
      return super.setBrightness(value, context);
    } finally {
      _$_AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getBrightness(BuildContext context) {
    final _$actionInfo = _$_AppControllerBaseActionController.startAction(
        name: '_AppControllerBase.getBrightness');
    try {
      return super.getBrightness(context);
    } finally {
      _$_AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getMainTitle() {
    final _$actionInfo = _$_AppControllerBaseActionController.startAction(
        name: '_AppControllerBase.getMainTitle');
    try {
      return super.getMainTitle();
    } finally {
      _$_AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getPrimaryColor() {
    final _$actionInfo = _$_AppControllerBaseActionController.startAction(
        name: '_AppControllerBase.getPrimaryColor');
    try {
      return super.getPrimaryColor();
    } finally {
      _$_AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updatePrimaryColor(Color color) {
    final _$actionInfo = _$_AppControllerBaseActionController.startAction(
        name: '_AppControllerBase.updatePrimaryColor');
    try {
      return super.updatePrimaryColor(color);
    } finally {
      _$_AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateMainTitle(String text) {
    final _$actionInfo = _$_AppControllerBaseActionController.startAction(
        name: '_AppControllerBase.updateMainTitle');
    try {
      return super.updateMainTitle(text);
    } finally {
      _$_AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentUser: ${currentUser},
thinks: ${thinks},
mainTitle: ${mainTitle},
brightness: ${brightness},
primaryColor: ${primaryColor},
isLoading: ${isLoading},
hasUser: ${hasUser},
brightnessIsDark: ${brightnessIsDark}
    ''';
  }
}
