import 'app_controller.dart';
import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'app_audio_player_controller.dart';
import 'package:potato_notes/utils/formatters.dart';
import 'package:potato_notes/models/think_model.dart';
import 'package:potato_notes/models/annotation_model.dart';
import 'package:potato_notes/models/annotation_file_model.dart';
part 'annotation_form_controller.g.dart';

class AnnotationFormController = _AnnotationFormControllerBase
    with _$AnnotationFormController;

abstract class _AnnotationFormControllerBase with Store {
  var isCreate;
  final formKey = GlobalKey<FormState>();
  final appController = GetIt.I<AppController>();
  final textController = TextEditingController();
  final titleController = TextEditingController();
  final appAudioPlayerController = GetIt.I<AppAudioPlayerController>();

  @observable
  ThinkModel think;

  @observable
  AnnotationModel annotation;

  @observable
  Color color;

  @observable
  ObservableList<AnnotationFileModel> files =
      ObservableList<AnnotationFileModel>();

  @observable
  ObservableList<AnnotationFileModel> deletedFiles =
      ObservableList<AnnotationFileModel>();

  @computed
  get popupMenuButtonColor => appController.brightness == Brightness.light
      ? Colors.black87
      : Colors.white;

  @computed
  bool get hasNoChanges =>
      (files.isEmpty &&
          textController.text.isEmpty &&
          titleController.text.isEmpty) ||
      (annotation != null &&
          deletedFiles.isEmpty &&
          annotation.text == textController.text &&
          annotation.files.length == files.length &&
          annotation.title == titleController.text);

  _AnnotationFormControllerBase(this.think, this.annotation) {
    if (annotation != null) {
      isCreate = false;
      color = annotation.color;
      textController.text = annotation.text;
      titleController.text = annotation.title;
      annotation.files.forEach(files.add);
    } else {
      isCreate = true;
      color = appController.primaryColor;
    }
  }

  @action
  validateForm() => formKey.currentState.validate();

  @action
  setColor(Color color) => this.color = color;

  @action
  _addAnnotationToThink(AnnotationModel ant) => think.annotations.add(ant);

  @action
  _persistAnnotation(AnnotationModel annotation) {
    appController.annotationDAO.save(annotation).then((annotationId) {
      annotation.id = annotationId;
      annotation.files.forEach((file) {
        file.annotationId = annotationId;
        appController.annotationFileDAO.save(file).then((annotationFileId) {
          file.id = annotationFileId;
        });
      });
    });

    if (deletedFiles.isNotEmpty) {
      deletedFiles
          .forEach((file) => appController.annotationFileDAO.delete(file.id));
    }
  }

  @action
  save() {
    if (isCreate) {
      final newAnnotation = AnnotationModel(
        thinkId: think.id,
        title: titleController.text,
        text: textController.text,
        color: color,
        files: files,
        listIndex: think.annotations.length,
        createdAt: formatDate(DateTime.now()),
      );
      _addAnnotationToThink(newAnnotation);
      _persistAnnotation(newAnnotation);
    } else {
      annotation.title = titleController.text;
      annotation.text = textController.text;
      annotation.color = color;
      annotation.files.clear();
      files.forEach(annotation.files.add);
      _persistAnnotation(annotation);
    }
  }
}
