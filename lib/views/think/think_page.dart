import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:potato_notes/entities/think.dart';
import 'package:potato_notes/utils/navigation.dart';
import 'package:potato_notes/views/state/app_state.dart';
import 'package:potato_notes/views/think/think_form.dart';
import 'package:potato_notes/views/annotation/annotation_form.dart';

class ThinkPage extends StatefulWidget {
  final Think think;
  ThinkPage(this.think);

  @override
  _ThinkPageState createState() => _ThinkPageState();
}

class _ThinkPageState extends State<ThinkPage> {
  final state = GetIt.I<AppState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.think.title),
        backgroundColor: widget.think.color,
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
        backgroundColor: widget.think.color,
        child: Icon(
          Icons.list,
          color: Colors.white,
        ),
        onPressed: () {
          push(context, AnnotationForm(widget.think));
        },
      ),
    );
  }

  _onClickPopupMenuItem(String value) async {
    switch (value) {
      case 'edit':
        final originalTitle = widget.think.title;
        final originalColor = widget.think.color;
        await showThinkForm(
          context: context,
          onSubmit: (
            String title,
            Color color,
          ) {
            state.saveThink(widget.think);
          },
          think: widget.think,
          onChangeColor: (Color newColor) {
            setState(() {
              widget.think.color = newColor;
            });
          },
          onChangeTitle: (String newTitle) {
            setState(() {
              widget.think.title = newTitle;
            });
          },
          onCancel: () {
            setState(() {
              widget.think.title = originalTitle;
              widget.think.color = originalColor;
            });
          },
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
              onPressed: () {
                state.deleteThink(widget.think);
                pop(_);
                pop(_);
              },
            ),
          ],
        );
      },
    );
  }
}
