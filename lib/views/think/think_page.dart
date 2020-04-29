import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:potato_notes/entities/think.dart';
import 'package:potato_notes/utils/navigation.dart';
import 'package:potato_notes/views/think/state/think_page_state.dart';
import 'package:potato_notes/views/think/think_form.dart';
import 'package:potato_notes/views/app_state/app_state.dart';
import 'package:potato_notes/views/annotation/annotation_form.dart';
import 'package:potato_notes/views/annotation/annotation_list_page.dart';
import 'package:potato_notes/views/widgets/app_bottom_audio_player.dart';

class ThinkPage extends StatefulWidget {
  final Think think;
  ThinkPage(this.think);

  @override
  _ThinkPageState createState() => _ThinkPageState();
}

class _ThinkPageState extends State<ThinkPage> {
  ThinkPageState pageState;

  Think get think => widget.think;

  @override
  void initState() {
    pageState = ThinkPageState(think);
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
              pageState.title,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: pageState.color,
            centerTitle: true,
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
              backgroundColor: pageState.color,
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
        pageState.saveThink();
      },
      think: think,
      onChangeColor: (Color newColor) {
        pageState.setColor(newColor);
      },
      onChangeTitle: (String newTitle) {
        pageState.setTitle(newTitle);
      },
      onCancel: () {
        pageState.setTitle(originalTitle);
        pageState.setColor(originalColor);
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
                pageState.deleteThink();
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
