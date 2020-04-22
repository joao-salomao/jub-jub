import 'package:think_and_write_new/views/widgets/app_text.dart';
import 'package:think_and_write_new/utils/navigation.dart';
import 'package:think_and_write_new/entities/think.dart';
import '../children/annotation/annotation_form.dart';
import 'package:flutter/material.dart';
import '../think_page.dart';

class ThinkCard extends StatefulWidget {
  final Think think;
  final Key key;

  ThinkCard(this.think, this.key);

  @override
  _ThinkCard createState() => _ThinkCard();
}

class _ThinkCard extends State<ThinkCard> {
  _onClickZoom() {
    push(context, ThinkPage(widget.think));
  }

  _onClickAddAnnotation() {
    push(context, AnnotationForm(widget.think));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      color: widget.think.color,
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
                widget.think.title,
                fontSize: 20,
                bold: true,
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    AppText("Data de Criação: ${widget.think.createdAt}"),
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
                    onPressed:  _onClickZoom,
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
