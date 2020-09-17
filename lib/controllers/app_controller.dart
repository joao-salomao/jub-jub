import 'dart:io';

import 'package:mobx/mobx.dart';
import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:jubjub/dao/think_dao.dart';
import 'package:jubjub/models/user_model.dart';
import 'package:jubjub/dao/annotation_dao.dart';
import 'package:jubjub/models/think_model.dart';
import 'package:jubjub/services/auth_service.dart';
import 'package:jubjub/dao/annotation_file_dao.dart';
import 'package:jubjub/models/annotation_model.dart';
import 'package:jubjub/models/annotation_file_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  final thinkDAO = ThinkDAO();
  final annotationDAO = AnnotationDAO();
  final annotationFileDAO = AnnotationFileDAO();
  final authService = AuthService();
  SharedPreferences sharedPreferences;

  @observable
  UserModel currentUser;

  @observable
  ObservableList<ThinkModel> thinks = ObservableList<ThinkModel>();

  @observable
  var mainTitle = "";

  @observable
  Brightness brightness;

  @observable
  Color primaryColor;

  @observable
  bool isLoading;

  @computed
  bool get brightnessIsDark => brightness == Brightness.dark;

  @action
  getBrightness(BuildContext context) {
    brightness = Theme.of(context).brightness;
  }

  @action
  Future<void> getData() async {
    isLoading = true;

    final thinksFuture = thinkDAO.findAllOrderBy('listIndex', false);
    final annotationsFuture = annotationDAO.findAllOrderBy('listIndex', false);
    final annotationFilesFuture = annotationFileDAO.findAll();
    final result = await Future.wait([
      thinksFuture,
      annotationsFuture,
      annotationFilesFuture,
    ]);

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

    isLoading = false;
  }

  @action
  getMainTitle() {
    final title = sharedPreferences.getString("mainTitle");
    mainTitle = title == null ? "Jub Jub" : title;
  }

  @action
  getPrimaryColor() {
    final colorValue = sharedPreferences.getInt("primaryColor");
    primaryColor = Color(colorValue != null ? colorValue : 4280391411);
  }

  @action
  Future<void> updateAnnotationThink(
    AnnotationModel annotation,
    ThinkModel think,
  ) async {
    annotation.thinkId = think.id;
    annotation.listIndex = think.annotations.length;
    await annotationDAO.save(annotation);
    await getData();
  }

  @action
  saveThink(ThinkModel think) async {
    final id = await thinkDAO.save(think);
    think.id = id;
  }

  @action
  deleteThink(ThinkModel think) async {
    thinkDAO.delete(think.id);
  }

  truncate() async {
    await annotationFileDAO.deleteAll();
    await annotationDAO.deleteAll();
    await thinkDAO.deleteAll();
    Directory('/storage/emulated/0/JubJub').deleteSync(recursive: true);
    getData();
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
  }) async {
    final annotationId = await annotationDAO.save(annotation);
    annotation.id = annotationId;
    annotation.files.forEach((file) async {
      file.annotationId = annotationId;
      final fileId = await annotationFileDAO.save(file);
      file.id = fileId;
    });

    if (deletedFiles != null) {
      deletedFiles.forEach((file) async {
        await annotationFileDAO.delete(file.id);
      });
    }
  }

  @action
  deleteAnnotation(AnnotationModel annotation) async {
    await annotationDAO.delete(annotation.id);
  }

  @action
  getCurrentUser() async {
    final json = sharedPreferences.getString('user');
    if (json != null) {
      final map = convert.json.decode(json);
      final user = UserModel.fromMap(map);
      currentUser = user;

      final result = await authService.signIn();
      if (result != null) {
        currentUser.client = result.client;
        saveUserToPrefs(result);
      }
    }
  }

  saveUserToPrefs(UserModel user) async {
    final json = convert.json.encode(currentUser.toMap());
    await sharedPreferences.setString('user', json);
  }
}
