import 'package:flutter/material.dart';
import 'package:potato_notes/utils/navigation.dart';
import 'package:potato_notes/views/think/think_form.dart';

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
