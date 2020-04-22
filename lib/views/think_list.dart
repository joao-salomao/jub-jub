import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:potato_notes/entities/think.dart';
import 'package:potato_notes/utils/navigation.dart';

import 'annotation_form.dart';
import 'widgets/app_text.dart';
import 'widgets/app_text_form_field.dart';

class ThinkList extends StatefulWidget {
  @override
  _ThinkListState createState() => _ThinkListState();
}

class _ThinkListState extends State<ThinkList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pensamentos"),
        centerTitle: true,
      ),
      body: ReorderableListView(
        onReorder: (int oldIndex, int newIndex) => {},
        children: <Widget>[ThinkCard(Key("1")), ThinkCard(Key("2"))],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
        onPressed: () => showThinkForm(context: context, onSubmit: () => {}),
      ),
    );
  }
}

class ThinkCard extends StatefulWidget {
  final Key key;

  ThinkCard(this.key);

  @override
  _ThinkCard createState() => _ThinkCard();
}

class _ThinkCard extends State<ThinkCard> {
  _onClickZoom() {
    push(context, ThinkPage());
  }

  _onClickAddAnnotation() {
    push(context, AnnotationForm(Think("teste", "data", Colors.greenAccent, 1)));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(5),
      color: Colors.blueAccent,
      elevation: 30,
      child: InkWell(
        splashColor: Colors.white,
        onTap: _onClickZoom,
        child: Container(
          margin: EdgeInsets.only(bottom: 10),
          padding: EdgeInsets.all(5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AppText(
                "Think aaa",
                fontSize: 20,
                bold: true,
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    AppText("Data de Criação: 29/01/1999"),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    child: Icon(
                      Icons.zoom_in,
                      color: Colors.white,
                      size: 28,
                    ),
                    onPressed: _onClickZoom,
                  ),
                  FlatButton(
                    child: Icon(
                      Icons.add_circle_outline,
                      color: Colors.white,
                    ),
                    onPressed: _onClickAddAnnotation,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ThinkPage extends StatefulWidget {
  @override
  _ThinkPageState createState() => _ThinkPageState();
}

class _ThinkPageState extends State<ThinkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Think teste"),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: _onClickPopupMenuItem,
            itemBuilder: (context) {
              return [
                PopupMenuItem(value: "edit", child: Text("Editar")),
                PopupMenuItem(value: "delete", child: Text("Deletar")),
              ];
            },
          )
        ],
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        child: Icon(
          Icons.list,
          color: Colors.white,
        ),
        onPressed: () {
          // push(context, AnnotationForm(think));
        },
      ),
    );
  }

  _onClickPopupMenuItem(String value) async {
    switch (value) {
      case 'edit':
        // final originalTitle = "aaaa";
        // final originalColor = Colors.deepOrange;
        await showThinkForm(
          context: context,
          onSubmit: _onClickUpdateThink,
          think: null,
          // onChangeColor: (Color newColor) {
          //   setState(() {
          //     think.color = newColor;
          //   });
          // },
          // onChangeTitle: (String newTitle) {
          //   setState(() {
          //     think.title = newTitle;
          //   });
          // },
          // onCancel: () {
          //   setState(() {
          //     think.title = originalTitle;
          //     think.color = originalColor;
          //   });
          // },
        );
        break;
      case 'delete':
        await _alertDeleteThink();
        break;
    }
  }

  _alertDeleteThink() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (_) {
        return AlertDialog(
          title: Text('Você tem certeza ?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                    "Esse pensamento e todas as suas anotações serão permanentemente deletados.")
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("Não"),
              onPressed: () => pop(_),
            ),
            FlatButton(
              child: Text("Sim"),
              onPressed: () => {
                _onClickDeleteThink(),
                pop(_),
                // Pop ThinkPage
                pop(_),
              },
            ),
          ],
        );
      },
    );
  }

  _onClickUpdateThink(String title, Color color) {
    setState(() {
      // think.title = title;
      // think.color = color;
    });
  }

  _onClickDeleteThink() {}
}

showThinkForm({
  @required BuildContext context,
  Think think,
  Function onChangeColor,
  Function onChangeTitle,
  Function onCancel,
  @required Function onSubmit,
}) async {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController =
      TextEditingController(text: think != null ? think.title : "");
  Color _color = think != null ? think.color : Colors.black;

  if (onChangeTitle != null) {
    _titleController.addListener(() {
      onChangeTitle(_titleController.text);
    });
  }

  final formTitle = think == null ? "Criando Think" : "Editando Think";

  return showDialog(
    context: context,
    useRootNavigator: true,
    barrierDismissible: true,
    builder: (_) {
      return AlertDialog(
        title: Center(child: Text(formTitle)),
        content: Container(
          height: 280,
          child: Column(
            children: <Widget>[
              Form(
                key: _formKey,
                child: AppTextFormField(
                  "Título",
                  "Digite o título do seu pensamento",
                  controller: _titleController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "É obrigatório dar um título ao seu Pensamento";
                    }
                    return null;
                  },
                ),
              ),
              Expanded(
                child: MaterialColorPicker(
                  onColorChange: (Color newColor) {
                    _color = newColor;

                    if (onChangeColor != null) {
                      onChangeColor(newColor);
                    }

                    if (think != null) {
                      think.color = newColor;
                    }
                  },
                  selectedColor: think != null ? think.color : _color,
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text("Fechar"),
            onPressed: () {
              _titleController.dispose();
              if (onCancel != null) {
                onCancel();
              }
              pop(_);
            },
          ),
          FlatButton(
            child: Text("Salvar"),
            onPressed: () => {
              onSubmit(
                _titleController.text,
                _color,
              ),
              pop(context),
            },
          ),
        ],
      );
    },
  );
}
