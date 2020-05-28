import 'dart:io';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:jubjub/utils/navigation.dart';
import 'package:jubjub/utils/file_picker.dart';
import 'package:jubjub/models/think_model.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:jubjub/models/annotation_model.dart';
import 'package:jubjub/controllers/app_controller.dart';
import 'package:jubjub/models/annotation_file_model.dart';
import 'package:jubjub/views/widgets/app_alert_dialog.dart';
import 'package:jubjub/views/widgets/app_text_form_field.dart';
import 'package:jubjub/views/widgets/app_bottom_audio_player.dart';
import 'package:jubjub/controllers/annotation_form_controller.dart';
import 'package:jubjub/controllers/app_audio_player_controller.dart';
import 'package:jubjub/views/annotation/files/annotation_file_widget.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

class AnnotationForm extends StatefulWidget {
  final ThinkModel think;
  final AnnotationModel annotation;

  AnnotationForm(this.think, {this.annotation});

  @override
  _AnnotationFormState createState() => _AnnotationFormState();
}

class _AnnotationFormState extends State<AnnotationForm> {
  AnnotationFormController formController;

  Color get color => formController.color;
  ThinkModel get think => formController.think;
  GlobalKey<FormState> get formKey => formController.formKey;
  AnnotationModel get annotation => formController.annotation;
  AppController get appController => formController.appController;
  ObservableList<AnnotationFileModel> get files => formController.files;
  Color get popupMenuButtonColor => formController.popupMenuButtonColor;
  TextEditingController get textController => formController.textController;
  TextEditingController get titleController => formController.titleController;
  ObservableList<AnnotationFileModel> get deletedFiles =>
      formController.deletedFiles;
  AppAudioPlayerController get appAudioPlayerController =>
      formController.appAudioPlayerController;

  @override
  void initState() {
    formController = AnnotationFormController(widget.think, widget.annotation);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return WillPopScope(
          onWillPop: _onWillPop,
          child: Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
              title: Text(
                think.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              backgroundColor: color,
              actions: [
                IconButton(
                  icon: Icon(Icons.brush),
                  onPressed: _showColorPickerDialog,
                ),
                PopupMenuButton<String>(
                  icon: Icon(Icons.attach_file),
                  onSelected: (value) {
                    if (value == 'image') _addFile('image');
                    if (value == 'video') _addFile('video');
                    if (value == 'audio') _addFile('audio');
                  },
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        value: "image",
                        child: Center(
                          child: Icon(
                            Icons.filter,
                            color: popupMenuButtonColor,
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        value: "video",
                        child: Center(
                          child: Icon(
                            Icons.video_library,
                            color: popupMenuButtonColor,
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        value: "audio",
                        child: Center(
                          child: Icon(
                            Icons.audiotrack,
                            color: popupMenuButtonColor,
                          ),
                        ),
                      ),
                    ];
                  },
                ),
                IconButton(
                  icon: Icon(Icons.save),
                  onPressed: _onClickSave,
                ),
              ],
            ),
            body: _body(),
            bottomNavigationBar: AppBottomAudioPlayer(),
          ),
        );
      },
    );
  }

  Future<bool> _onWillPop() async {
    bool shouldPop = false;
    if (formController.hasNoChanges) {
      return Future(() {
        return true;
      });
    }

    return showDialog(
      context: context,
      builder: (_) {
        return SimpleDialog(
          title: Text('Deseja salvar as alterações ?'),
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.close,
                      size: 30,
                    ),
                    onPressed: () {
                      shouldPop = true;
                      pop(context);
                    },
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.save,
                      size: 30,
                    ),
                    onPressed: () {
                      if (formController.validateForm()) {
                        _onClickSave();
                        shouldPop = true;
                      } else {
                        pop(context);
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    ).then((_) {
      return shouldPop;
    });
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                bottom: 20,
              ),
              child: AppTextFormField(
                "Título da Anotação",
                "Digite o título da anotação",
                controller: titleController,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Dê um título para a sua anotação";
                  }
                  return null;
                },
                cursorColor: color,
              ),
            ),
            Container(
              child: Column(
                children: List.generate(files.length, (index) {
                  return Container(
                    margin: EdgeInsets.only(
                      bottom: 20,
                    ),
                    child: LimitedBox(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              bottom: 10,
                            ),
                            child: Column(
                              children: [
                                Container(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      files[index].title,
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 6,
                                child: Container(
                                  height: files[index].type == 'audio' ||
                                          files[index].type == 'pdf'
                                      ? 80
                                      : 220,
                                  child: AnnotationFileWidget(
                                    files[index],
                                    shouldPauseOnDispose: false,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Container(
                                      height: files[index].type == 'audio' ||
                                              files[index].type == 'pdf'
                                          ? 40
                                          : 110,
                                      color: Colors.black12,
                                      child: FlatButton(
                                        child: Icon(
                                          Icons.edit,
                                        ),
                                        onPressed: () =>
                                            _updateFile(files[index]),
                                      ),
                                    ),
                                    Container(
                                      height: files[index].type == 'audio' ||
                                              files[index].type == 'pdf'
                                          ? 40
                                          : 110,
                                      color: Colors.redAccent,
                                      child: FlatButton(
                                        child: Icon(
                                          Icons.delete,
                                        ),
                                        onPressed: () =>
                                            _removeFile(files[index]),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 5),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: files[index].description.length > 0
                                  ? Text(
                                      files[index].description,
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    )
                                  : Container(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
            Container(
              child: AppTextFormField(
                "Anotação",
                "Deixe as palavras fluirem através dos seus dedos",
                controller: textController,
                validator: (value) {
                  return value.isEmpty
                      ? "Dê corpo ao seu pensamento e escreva algo na sua anotação"
                      : null;
                },
                minLines: 4,
                maxLines: 1000000000000000000,
                cursorColor: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future _updateFile(AnnotationFileModel annotationFile) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController fileTitle =
        TextEditingController(text: annotationFile.title);

    final TextEditingController fileDescription =
        TextEditingController(text: annotationFile.description);

    return showDialog(
      context: context,
      builder: (_) {
        return Observer(
          builder: (_) {
            return AppAlertDialog(
              title: "Atualizando arquivo",
              onSave: () {
                if (formKey.currentState.validate()) {
                  annotationFile.title = fileTitle.text;
                  annotationFile.description = fileDescription.text;
                  pop(context);
                }
              },
              onClose: () => pop(context),
              content: Container(
                height: 240,
                child: Form(
                  key: formKey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        child: AppTextFormField(
                          "Título",
                          "",
                          controller: fileTitle,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "É obrigatório dar um título";
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          bottom: 5,
                        ),
                        child: AppTextFormField(
                          "Descrição",
                          "",
                          maxLines: 3,
                          controller: fileDescription,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FlatButton(
                            child: Row(
                              children: [
                                Icon(Icons.update),
                                Text(" Alterar arquivo")
                              ],
                            ),
                            onPressed: () async {
                              final file = await getFile(annotationFile.type);
                              if (file == null) return;
                              annotationFile.file = file;
                              annotationFile.path = file.path;

                              if (annotationFile.type == 'video') {
                                annotationFile.controller.pause();
                                annotationFile.controller =
                                    VideoPlayerController.file(
                                        annotationFile.file);
                                annotationFile.controller.initialize();
                              }

                              if (annotationFile.type == 'audio') {
                                if (file.path !=
                                    appAudioPlayerController.filePath) {
                                  appAudioPlayerController.pause();
                                }
                                getFileNameWithExtension(file).then((name) {
                                  annotationFile.fileName = name;
                                });
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  _removeFile(AnnotationFileModel annotationFile) {
    if (annotationFile.controller != null) {
      annotationFile.controller.pause();
    }
    files.remove(annotationFile);
    deletedFiles.add(annotationFile);
  }

  _addFile(String fileType) async {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController fileTitle = TextEditingController(text: "");
    final TextEditingController fileDescription =
        TextEditingController(text: "");

    File file = await getFile(fileType);
    if (file == null) return;

    final fileName = await getFileNameWithExtension(file);

    return showDialog(
      context: context,
      builder: (_) {
        return AppAlertDialog(
          title: "Adicionando arquivo",
          onClose: () => pop(context),
          onSave: () {
            if (formKey.currentState.validate()) {
              files.add(
                AnnotationFileModel(
                  file: file,
                  type: fileType,
                  path: file.path,
                  fileName: fileName,
                  title: fileTitle.text,
                  description: fileDescription.text,
                  annotationId: annotation != null ? annotation.id : null,
                ),
              );
              pop(context);
            }
          },
          content: Container(
            height: 230,
            child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                      bottom: 5,
                    ),
                    child: AppTextFormField(
                      "Título",
                      "",
                      controller: fileTitle,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "É obrigatório dar um título ";
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    child: AppTextFormField(
                      "Descrição",
                      "",
                      maxLines: 5,
                      controller: fileDescription,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future _showColorPickerDialog() {
    var color = formController.color;
    final originalColor = formController.color;
    return showDialog(
      context: context,
      builder: (_) {
        return AppAlertDialog(
          title: "Escolha a cor da sua anotação",
          content: Container(
            height: 205,
            child: MaterialColorPicker(
              onColorChange: (Color newColor) {
                color = newColor;
                formController.setColor(newColor);
              },
              selectedColor: color,
            ),
          ),
          onClose: () {
            formController.setColor(originalColor);
            pop(_);
          },
          onSave: () => pop(_),
        );
      },
    );
  }

  _onClickSave() {
    if (formController.validateForm()) {
      formController.save();
      pop(context);
    }
  }
}
