import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:potato_notes/entities/think.dart';
import 'package:potato_notes/utils/navigation.dart';
import 'package:potato_notes/views/annotation/annotation_list_page.dart';
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

  Think get think => widget.think;

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
          ),
        ),
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
          Icons.add,
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
          onSubmit: (
            String title,
            Color color,
          ) {
            state.saveThink(think);
          },
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
                  "Essa pasta e todas as suas anotações serão permanentemente deletados.",
                  textAlign: TextAlign.justify,
                )
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
                state.deleteThink(think);
                state.getData();
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
