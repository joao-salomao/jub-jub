import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:jubjub/utils/navigation.dart';
import 'package:jubjub/models/think_model.dart';
import 'package:jubjub/controllers/think_page_controller.dart';
import 'package:jubjub/views/components/app_bottom_audio_player.dart';
import 'package:jubjub/views/think_list/components/think_form.dart';

import 'children/annotation/components/annotation_form.dart';
import 'components/annotation_list_page.dart';

class ThinkPage extends StatefulWidget {
  final ThinkModel think;
  ThinkPage(this.think);

  @override
  _ThinkPageState createState() => _ThinkPageState();
}

class _ThinkPageState extends State<ThinkPage> {
  ThinkPageController controller;

  ThinkModel get think => widget.think;

  @override
  void initState() {
    controller = ThinkPageController(think);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
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
            backgroundColor: think.color,
            actions: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: _onClickEdit,
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: _onClickDelete,
              ),
            ],
          ),
          body: AnnotationListPage(think),
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          floatingActionButton: Container(
            margin: EdgeInsets.only(bottom: 30),
            child: FloatingActionButton(
              backgroundColor: think.color,
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
                push(context, AnnotationForm(think));
              },
            ),
          ),
          bottomNavigationBar: AppBottomAudioPlayer(),
        );
      },
    );
  }

  _onClickEdit() {
    final originalTitle = think.title;
    final originalColor = think.color;
    showThinkForm(
      context: context,
      onSubmit: (
        String title,
        Color color,
      ) {
        controller.saveThink();
      },
      think: think,
      onChangeColor: (Color newColor) {
        controller.setColor(newColor);
      },
      onChangeTitle: (String newTitle) {
        controller.setTitle(newTitle);
      },
      onCancel: () {
        controller.setTitle(originalTitle);
        controller.setColor(originalColor);
      },
    );
  }

  _onClickDelete() {
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
                controller.deleteThink();
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
