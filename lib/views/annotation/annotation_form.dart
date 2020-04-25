import 'dart:io';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:potato_notes/utils/date.dart';
import 'package:video_player/video_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:potato_notes/entities/think.dart';
import 'package:potato_notes/utils/navigation.dart';
import 'package:potato_notes/utils/file_picker.dart';
import 'package:potato_notes/entities/annotation.dart';
import 'package:potato_notes/views/state/app_state.dart';
import 'package:potato_notes/views/widgets/app_text.dart';
import 'package:potato_notes/entities/annotation_file.dart';
import 'package:potato_notes/views/widgets/app_raised_button.dart';
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
        title: AppText(
          think.title,
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: _color,
        actions: <Widget>[
          FlatButton(
            child: Icon(
              Icons.palette,
              size: 30,
              color: Colors.white,
            ),
            onPressed: _showColorPickerDialog,
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
                                        fontSize: 20,
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
                                      ? 100
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
                                          ? 50
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
                                          ? 50
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
                                        fontSize: 20,
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
                maxLines: 100000000000000,
                cursorColor: _color,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                bottom: 10,
                top: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlatButton(
                    child: Icon(
                      Icons.filter,
                      size: 35,
                    ),
                    onPressed: () => _addFile('image'),
                  ),
                  FlatButton(
                    child: Icon(
                      Icons.video_library,
                      size: 35,
                    ),
                    onPressed: () => _addFile('video'),
                  ),
                  FlatButton(
                    child: Icon(
                      Icons.audiotrack,
                      size: 35,
                    ),
                    onPressed: () => _addFile('audio'),
                  ),
                  // FlatButton(
                  //   child: Icon(
                  //     Icons.folder,
                  //     size: 35,
                  //   ),
                  //   onPressed: () => _addFile('pdf'),
                  // ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                AppRaisedButton(
                  "Salvar",
                  onPressed: _onClickSave,
                  color: _color,
                ),
              ],
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
          return Dialog(
            child: Container(
                height: 450,
                padding: EdgeInsets.all(10),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        child: AppTextFormField(
                          "Título da Imagem",
                          "Digite um título para a imagem",
                          controller: fileTitle,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "É obrigatório dar um título para a imagem";
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
                          maxLines: annotationFile.type == 'audio' ? 7 : 2,
                          controller: fileDescription,
                        ),
                      ),
                      Container(
                        height: annotationFile.type == 'audio' ? 50 : 150,
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: 5),
                        child: AnnotationFileWidget(
                          annotationFile,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          FlatButton(
                            child: Text("Sair"),
                            onPressed: () => pop(context),
                          ),
                          FlatButton(
                            child: Text("Salvar"),
                            onPressed: () {
                              if (formKey.currentState.validate()) {
                                setState(() {
                                  annotationFile.title = fileTitle.text;
                                  annotationFile.description =
                                      fileDescription.text;
                                  pop(context);
                                });
                              }
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                )),
          );
        });
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

    final tempAnnotationFile = AnnotationFile(
      title: "temp",
      file: file,
      type: fileType,
    );

    return showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            child: Container(
                height: 450,
                padding: EdgeInsets.all(10),
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
                          maxLines: fileType == 'audio' ? 7 : 2,
                          controller: fileDescription,
                        ),
                      ),
                      Container(
                        height: fileType == 'audio' ? 50 : 150,
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: 5),
                        child: AnnotationFileWidget(
                          tempAnnotationFile,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          FlatButton(
                            child: Text("Sair"),
                            onPressed: () {
                              pop(context);
                            },
                          ),
                          FlatButton(
                            child: Text("Salvar"),
                            onPressed: () {
                              if (formKey.currentState.validate()) {
                                setState(() {
                                  _files.add(
                                    AnnotationFile(
                                      file: file,
                                      type: fileType,
                                      path: file.path,
                                      title: fileTitle.text,
                                      description: fileDescription.text,
                                      annotationId: annotation != null
                                          ? annotation.id
                                          : null,
                                    ),
                                  );
                                  pop(context);
                                });
                              }
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                )),
          );
        });
  }

  Future _showColorPickerDialog() {
    return showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text("Escolha a cor do seu Pensamento"),
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
          actions: <Widget>[
            FlatButton(
              child: Text("Fechar"),
              onPressed: () => pop(_),
            ),
            FlatButton(
              child: Text("Salvar"),
              onPressed: () => pop(_),
            ),
          ],
        );
      },
    );
  }

  _onClickClean() {
    _textController.clear();
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
