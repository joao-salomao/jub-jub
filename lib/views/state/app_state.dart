import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:potato_notes/dao/think_dao.dart';
import 'package:potato_notes/entities/think.dart';
import 'package:potato_notes/dao/annotation_dao.dart';
import 'package:potato_notes/entities/annotation.dart';
import 'package:potato_notes/dao/annotation_file_dao.dart';
import 'package:potato_notes/entities/annotation_file.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'app_state.g.dart';

class AppState = _AppStateBase with _$AppState;

abstract class _AppStateBase with Store {
  final thinkDAO = ThinkDAO();
  final annotationDAO = AnnotationDAO();
  final annotationFileDAO = AnnotationFileDAO();
  SharedPreferences sharedPreferences;

  @observable
  var thinks = ObservableList<Think>();

  @observable
  var mainTitle = "";

  @observable
  Color primaryColor;

  @action
  getData() async {
    final thinksFuture = thinkDAO.findAll();
    final annotationsFuture = annotationDAO.findAll();
    final annotationFilesFuture = annotationFileDAO.findAll();
    final result = await Future.wait(
      [
        thinksFuture,
        annotationsFuture,
        annotationFilesFuture,
      ],
    );

    final List<Think> thinkList = result[0];
    final List<Annotation> annotations = result[1];
    final List<AnnotationFile> annotationFiles = result[2];

    thinks.clear();
    thinkList.forEach((think) {
      think.annotations = annotations
          .where((annotation) => annotation.thinkId == think.id)
          .toList();

      think.annotations.forEach((annotation) {
        annotation.files = annotationFiles
            .where((file) => file.annotationId == annotation.id)
            .toList();
      });
      thinks.add(think);
    });
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
  saveThink(Think think) async {
    await thinkDAO.save(think);
  }

  @action
  deleteThink(Think think) async {
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
    Annotation annotation, {
    List<AnnotationFile> deletedFiles,
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
  deleteAnnotation(Annotation annotation) async {
    await annotationDAO.delete(annotation.id);
  }

  @action
  updateAnnotation(Annotation annotation) {}
}
