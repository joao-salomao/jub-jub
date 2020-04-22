import 'package:flutter/material.dart';
import 'package:think_and_write_new/entities/think.dart';
import 'package:think_and_write_new/services/database_service.dart';
import 'package:think_and_write_new/utils/navigation.dart';
import 'package:think_and_write_new/views/think/children/annotation/list/annotation_list_page.dart';
import 'package:think_and_write_new/views/think/think_form.dart';
import 'children/annotation/annotation_form.dart';

class ThinkPage extends StatefulWidget {
  final Think think;

  ThinkPage(this.think);

  @override
  _ThinkPageState createState() => _ThinkPageState();
}

class _ThinkPageState extends State<ThinkPage> {
  final DatabaseService databaseService = DatabaseService();

  Think get think => widget.think;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(think.title),
        backgroundColor: think.color,
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
      body: AnnotationListPage(think),
      floatingActionButton: FloatingActionButton(
        backgroundColor: think.color,
        child: Icon(
          Icons.list,
          color: Colors.white,
        ),
        onPressed: () {
          push(context, AnnotationForm(think));
        },
      ),
    );
  }

  _onClickPopupMenuItem(String value) async {
    switch (value) {
      case 'edit':
        final originalTitle = think.title;
        final originalColor = think.color;
        await showThinkForm(
            context: context,
            onSubmit: _onClickUpdateThink,
            think: think,
            onChangeColor: (Color newColor) {
              setState(() {
                think.color = newColor;
              });
            },
            onChangeTitle: (String newTitle) {
              setState(() {
                think.title = newTitle;
              });
            },
            onCancel: () {
              setState(() {
                think.title = originalTitle;
                think.color = originalColor;
              });
            });
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
    databaseService.updateThink(think.id, title, color.value);
    setState(() {
      think.title = title;
      think.color = color;
    });
  }

  _onClickDeleteThink() {
    databaseService.deleteThink(think.id);
  }
}
