import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:potato_notes/models/annotation_file_model.dart';
import 'package:potato_notes/models/annotation_model.dart';
import 'package:potato_notes/models/think_model.dart';

import 'app_audio_player_controller.dart';
import 'app_controller.dart';
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
  get hasChanges => () {
        final formIsEmpty = (files.isEmpty &&
            textController.text.isEmpty &&
            titleController.text.isEmpty);

        final formIsEqual = (annotation != null &&
            deletedFiles.isEmpty &&
            annotation.text == textController.text &&
            annotation.files.length == files.length &&
            annotation.title == titleController.text);

        return !formIsEmpty || !formIsEqual;
      };

  _AnnotationFormControllerBase(this.think, this.annotation) {
    if (annotation != null) {
      isCreate = false;
      textController.text = annotation.text;
      titleController.text = annotation.title;
      annotation.files.forEach(files.add);
    } else {
      isCreate = true;
      color = Colors.black;
    }
  }

  @action
  validateForm() => formKey.currentState.validate();
}
