import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:jubjub/services/auth_service.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:jubjub/dao/think_dao.dart';
import 'package:jubjub/dao/annotation_dao.dart';
import 'package:jubjub/models/think_model.dart';
import 'package:jubjub/dao/annotation_file_dao.dart';
import 'package:jubjub/models/annotation_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jubjub/models/annotation_file_model.dart';
part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  final thinkDAO = ThinkDAO();
  final annotationDAO = AnnotationDAO();
  final annotationFileDAO = AnnotationFileDAO();
  final authService = AuthService();
  SharedPreferences sharedPreferences;

  @observable
  var thinks = ObservableList<ThinkModel>();

  @observable
  var mainTitle = "";

  @observable
  Brightness brightness;

  @observable
  Color primaryColor;

  @computed
  bool get brightnessIsDark => brightness == Brightness.dark;

  @action
  setBrightness(Brightness value, BuildContext context) {
    brightness = value;
    DynamicTheme.of(context).setBrightness(value);
  }

  @action
  getBrightness(BuildContext context) {
    brightness = Theme.of(context).brightness;
  }

  @action
  getData() async {
    final thinksFuture = thinkDAO.findAllOrderBy('listIndex', false);
    final annotationsFuture = annotationDAO.findAllOrderBy('listIndex', false);
    final annotationFilesFuture = annotationFileDAO.findAll();
    final result = await Future.wait(
      [
        thinksFuture,
        annotationsFuture,
        annotationFilesFuture,
      ],
    );

    final List<ThinkModel> thinkList = result[0];
    final List<AnnotationModel> annotations = result[1];
    final List<AnnotationFileModel> annotationFiles = result[2];

    thinks.clear();
    thinkList.forEach((think) {
      think.annotations.clear();
      annotations
          .where((annotation) => annotation.thinkId == think.id)
          .toList()
          .forEach(think.annotations.add);

      think.annotations.forEach((annotation) {
        annotation.files.clear();
        annotationFiles
            .where((file) => file.annotationId == annotation.id)
            .toList()
            .forEach(annotation.files.add);
      });
      thinks.add(think);
    });
  }

  reOrderThinks(int oldIndex, int newIndex) {
    final isLast = newIndex == thinks.length;
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }

    final otherThink = thinks.elementAt(newIndex);
    final think = thinks.removeAt(oldIndex);

    think.listIndex = newIndex;
    otherThink.listIndex = oldIndex;

    saveThink(think);
    saveThink(otherThink);

    if (isLast) {
      thinks.add(think);
      return;
    }
    thinks.insert(newIndex, think);
  }

  @action
  getMainTitle() {
    final title = sharedPreferences.getString("mainTitle");
    mainTitle = title == null ? "Jub-Arte" : title;
  }

  @action
  getPrimaryColor() {
    final colorValue = sharedPreferences.getInt("primaryColor");
    primaryColor = Color(colorValue != null ? colorValue : 4280391411);
  }

  @action
  updatePrimaryColor(Color color) {
    primaryColor = color;
    sharedPreferences.setInt("primaryColor", color.value);
  }

  @action
  updateMainTitle(String text) {
    SharedPreferences.getInstance()
        .then((prefs) => prefs.setString("mainTitle", text));
    mainTitle = text;
  }

  @action
  saveThink(ThinkModel think) async {
    await thinkDAO.save(think);
  }

  @action
  deleteThink(ThinkModel think) async {
    thinkDAO.delete(think.id);
  }

  @action
  getThinkAnnotations(int thinkId) async {
    return await annotationDAO.getAnnotationsByThinkId(thinkId);
  }

  @action
  getAnnotationFiles(int annotationId) async {
    return await annotationFileDAO
        .getAnnotationsFileByAnnotationId(annotationId);
  }

  @action
  saveAnnotation(
    AnnotationModel annotation, {
    List<AnnotationFileModel> deletedFiles,
  }) {
    annotationDAO.save(annotation).then((annotationId) {
      annotation.id = annotationId;
      annotation.files.forEach((file) {
        file.annotationId = annotationId;
        annotationFileDAO.save(file).then((annotationFileId) {
          file.id = annotationFileId;
        });
      });
    });

    if (deletedFiles != null) {
      deletedFiles.forEach((file) => annotationFileDAO.delete(file.id));
    }
  }

  @action
  deleteAnnotation(AnnotationModel annotation) async {
    await annotationDAO.delete(annotation.id);
  }

  @action
  login() {
    authService.signInGoogle().then((result) {
      print(result);
    });
  }
}
