import 'package:flutter/material.dart';
import 'package:jubjub/utils/navigation.dart';
import 'package:jubjub/models/think_model.dart';
import 'package:jubjub/models/annotation_model.dart';
import 'package:jubjub/views/widgets/app_text.dart';
import 'package:jubjub/controllers/annotation_controller.dart';
import 'package:jubjub/views/widgets/app_text_form_field.dart';
import 'package:jubjub/views/annotation/page/annotation_page.dart';

class AnnotationCard extends StatefulWidget {
  final Key key;
  final AnnotationModel annotation;
  final ThinkModel think;
  final AnnotationController annotationController;

  AnnotationCard(
    this.key,
    this.annotation,
    this.think,
    this.annotationController,
  );

  @override
  _AnnotationCardState createState() => _AnnotationCardState();
}

class _AnnotationCardState extends State<AnnotationCard> {
  final obscuredText =
      "**************************************************************************************************************";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      padding: EdgeInsets.all(5),
      child: InkWell(
        onTap: _onTapCard,
        child: Card(
          color: widget.annotation.color,
          elevation: 10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 5,
                      ),
                      child: _getHeader(),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text(
                        widget.annotation.password == null
                            ? widget.annotation.text
                            : obscuredText,
                        softWrap: true,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 3),
                                child: Icon(
                                  Icons.local_parking,
                                  color: Colors.white,
                                ),
                              ),
                              AppText(
                                  "${widget.annotation.getAnnotationTotalWords()}"),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 3),
                                child: Icon(
                                  Icons.filter,
                                  color: Colors.white,
                                ),
                              ),
                              AppText(
                                  "${widget.annotation.getAnnotationFilesCountByType("image")}"),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 3),
                                child: Icon(
                                  Icons.video_library,
                                  color: Colors.white,
                                ),
                              ),
                              AppText(
                                  "${widget.annotation.getAnnotationFilesCountByType("video")}"),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 3),
                                child: Icon(
                                  Icons.audiotrack,
                                  color: Colors.white,
                                ),
                              ),
                              AppText(
                                  "${widget.annotation.getAnnotationFilesCountByType("audio")}"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onEnterPassword() {
    return showDialog(
      context: context,
      builder: (_) {
        return Container(
          child: SimpleDialog(
            title: Text('Acessando anotação protegida'),
            children: [
              Container(
                padding: EdgeInsets.only(
                  right: 20,
                  left: 20,
                  bottom: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    AppTextFormField(
                      "Digite a senha da anotação",
                      "",
                      obscureText: true,
                      cursorColor: widget.annotation.color,
                      onChange: (value) {
                        if (value == widget.annotation.password) {
                          pop(context);
                          _pushAnnotationPage();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  _pushAnnotationPage() {
    push(
      context,
      AnnotationPage(
        widget.annotation,
        widget.think,
        widget.annotationController,
      ),
    );
  }

  _onTapCard() {
    if (widget.annotation.password == null) {
      _pushAnnotationPage();
      return;
    }
    _onEnterPassword();
  }

  _getHeader() {
    final title = AppText(
      widget.annotation.title,
      bold: true,
      fontSize: 16,
    );

    if (widget.annotation.password == null) return title;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        title,
        Icon(
          Icons.lock_outline,
          color: Colors.white,
        )
      ],
    );
  }
}
