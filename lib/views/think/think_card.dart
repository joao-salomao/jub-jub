import 'package:flutter/material.dart';
import 'package:potato_notes/entities/think.dart';
import 'package:potato_notes/utils/navigation.dart';
import 'package:potato_notes/views/annotation/annotation_form.dart';
import 'package:potato_notes/views/think/think_page.dart';
import 'package:potato_notes/views/widgets/app_text.dart';

class ThinkCard extends StatefulWidget {
  final Key key;
  final Think think;

  ThinkCard(this.key, this.think);

  @override
  _ThinkCard createState() => _ThinkCard();
}

class _ThinkCard extends State<ThinkCard> {
  _onClickZoom() {
    push(context, ThinkPage());
  }

  _onClickAddAnnotation() {
    push(
      context,
      AnnotationForm(
        Think(
          title: "teste",
          color: Colors.greenAccent,
          listIndex: 1,
        ),
      ),
    );
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
