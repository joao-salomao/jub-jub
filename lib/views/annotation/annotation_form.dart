import 'dart:io';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:potato_notes/utils/date.dart';
import 'package:potato_notes/views/widgets/app_alert_dialog.dart';
import 'package:potato_notes/views/widgets/app_text.dart';
import 'package:video_player/video_player.dart';
import 'package:potato_notes/entities/think.dart';
import 'package:potato_notes/utils/navigation.dart';
import 'package:potato_notes/utils/file_picker.dart';
import 'package:potato_notes/entities/annotation.dart';
import 'package:potato_notes/views/state/app_state.dart';
import 'package:potato_notes/entities/annotation_file.dart';
import 'package:potato_notes/views/widgets/app_text_form_field.dart';
import 'package:potato_notes/views/annotation/files/annotation_file_widget.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

class AnnotationForm extends StatefulWidget {
  final Think think;
  final Annotation annotation;

  AnnotationForm(this.think, {this.annotation});

  @override
  _AnnotationFormState createState() => _AnnotationFormState();
}

class _AnnotationFormState extends State<AnnotationForm> {
  final state = GetIt.I<AppState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _textController = TextEditingController();

  Color _color;
  List<AnnotationFile> _files = [];
  List<AnnotationFile> _deletedFiles = [];
  List<VideoPlayerController> videoPlayerControllers = [];

  Think get think => widget.think;
  Annotation get annotation => widget.annotation;

  @override
  void initState() {
    super.initState();
    if (annotation != null) {
      _titleController.text = annotation.title;
      _textController.text = annotation.text;
      _color = annotation.color;
      _files = annotation.files;
    } else {
      _color = Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          think.title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        backgroundColor: _color,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _onClickSave,
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'color') _showColorPickerDialog();
              if (value == 'image') _addFile('image');
              if (value == 'video') _addFile('video');
              if (value == 'audio') _addFile('audio');
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: "color",
                  child: Center(
                    child: Icon(
                      Icons.brush,
                      color: Colors.black87,
                    ),
                  ),
                ),
                PopupMenuItem(
                  value: "image",
                  child: Center(
                    child: Icon(
                      Icons.filter,
                      color: Colors.black87,
                    ),
                  ),
                ),
                PopupMenuItem(
                  value: "video",
                  child: Center(
                    child: Icon(
                      Icons.video_library,
                      color: Colors.black87,
                    ),
                  ),
                ),
                PopupMenuItem(
                  value: "audio",
                  child: Center(
                    child: Icon(
                      Icons.audiotrack,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                bottom: 10,
              ),
              child: AppTextFormField(
                "Título da Anotação",
                "Digite o título da anotação",
                controller: _titleController,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Dê um título para a sua anotação";
                  }
                  return null;
                },
                cursorColor: _color,
              ),
            ),
            Container(
              child: Column(
                children: List.generate(_files.length, (index) {
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
                                      _files[index].title,
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
                                  height: _files[index].type == 'audio' ||
                                          _files[index].type == 'pdf'
                                      ? 80
                                      : 300,
                                  child: AnnotationFileWidget(
                                    _files[index],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Container(
                                      height: _files[index].type == 'audio' ||
                                              _files[index].type == 'pdf'
                                          ? 40
                                          : 150,
                                      color: Colors.black12,
                                      child: FlatButton(
                                        child: Icon(
                                          Icons.edit,
                                        ),
                                        onPressed: () =>
                                            _updateFile(_files[index]),
                                      ),
                                    ),
                                    Container(
                                      height: _files[index].type == 'audio' ||
                                              _files[index].type == 'pdf'
                                          ? 40
                                          : 150,
                                      color: Colors.redAccent,
                                      child: FlatButton(
                                        child: Icon(
                                          Icons.delete,
                                        ),
                                        onPressed: () =>
                                            _removeFile(_files[index]),
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
                              child: _files[index].description.length > 0
                                  ? Text(
                                      _files[index].description,
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
                controller: _textController,
                validator: (value) {
                  return value.isEmpty
                      ? "Dê corpo ao seu pensamento e escreva algo na sua anotação"
                      : null;
                },
                minLines: 4,
                maxLines: 1000000000000000000,
                cursorColor: _color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _updateFile(AnnotationFile annotationFile) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController fileTitle =
        TextEditingController(text: annotationFile.title);

    final TextEditingController fileDescription =
        TextEditingController(text: annotationFile.description);
    return showDialog(
      context: context,
      builder: (_) {
        return AppAlertDialog(
          title: "Atualizando arquivo",
          onSave: () {
            if (formKey.currentState.validate()) {
              setState(() {
                annotationFile.title = fileTitle.text;
                annotationFile.description = fileDescription.text;
                pop(context);
              });
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
                            Text("Alterar arquivo")
                          ],
                        ),
                        onPressed: () async {
                          final file = await getFile(annotationFile.type);
                          if (file == null) return;
                          setState(() {
                            annotationFile.file = file;
                            annotationFile.path = file.path;
                          });
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
  }

  _removeFile(AnnotationFile annotationFile) async {
    setState(() {
      _files.remove(annotationFile);
      _deletedFiles.add(annotationFile);
    });
  }

  _addFile(String fileType) async {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController fileTitle = TextEditingController(text: "");
    final TextEditingController fileDescription =
        TextEditingController(text: "");

    File file = await getFile(fileType);
    if (file == null) return;

    return showDialog(
      context: context,
      builder: (_) {
        return AppAlertDialog(
          title: "Adicionando arquivo",
          onClose: () => pop(context),
          onSave: () {
            if (formKey.currentState.validate()) {
              setState(() {
                _files.add(
                  AnnotationFile(
                    file: file,
                    type: fileType,
                    path: file.path,
                    title: fileTitle.text,
                    description: fileDescription.text,
                    annotationId: annotation != null ? annotation.id : null,
                  ),
                );
                pop(context);
              });
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
    return showDialog(
      context: context,
      builder: (_) {
        return AppAlertDialog(
          title: "Escolha a cor da sua anotação",
          content: Container(
            height: 205,
            child: MaterialColorPicker(
              onColorChange: (Color newColor) {
                setState(() {
                  _color = newColor;
                });
              },
              selectedColor: _color,
            ),
          ),
          onClose: () => pop(_),
          onSave: () => pop(_),
        );
      },
    );
  }

  _onClickSave() {
    if (_formKey.currentState.validate()) {
      if (annotation == null) {
        final newAnnotation = Annotation(
          thinkId: think.id,
          title: _titleController.text,
          text: _textController.text,
          color: _color,
          files: _files,
          createdAt: formatDate(DateTime.now()),
        );
        setState(() {
          think.annotations.add(newAnnotation);
        });
        state.saveAnnotation(newAnnotation);
      } else {
        setState(() {
          annotation.title = _titleController.text;
          annotation.text = _textController.text;
          annotation.color = _color;
          annotation.files = _files;
        });
        state.saveAnnotation(annotation, deletedFiles: _deletedFiles);
      }
      pop(context);
    }
  }
}
