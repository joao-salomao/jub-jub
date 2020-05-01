import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:potato_notes/utils/navigation.dart';
import 'package:potato_notes/models/think_model.dart';
import 'package:potato_notes/views/widgets/app_alert.dart';
import 'package:potato_notes/models/annotation_model.dart';
import 'package:potato_notes/views/annotation/annotation_form.dart';
import 'package:potato_notes/controllers/annotation_controller.dart';
import 'package:potato_notes/views/annotation/annotation_file_list.dart';
import 'package:potato_notes/views/widgets/app_bottom_audio_player.dart';

class AnnotationPage extends StatefulWidget {
  final ThinkModel think;
  final AnnotationModel annotation;
  final AnnotationController annotationController;
  AnnotationPage(
    this.annotation,
    this.think,
    this.annotationController,
  );

  @override
  _AnnotationPageState createState() => _AnnotationPageState();
}

class _AnnotationPageState extends State<AnnotationPage> {
  _onClickEdit() {
    push(
      context,
      AnnotationForm(
        widget.think,
        annotation: widget.annotation,
      ),
    );
  }

  _onClickDelete() {
    alert(
      context,
      "Você tem certeza ?",
      "Essa anotação será deletada permanentemente.",
      callback: () {
        widget.annotationController.deleteAnnotation(widget.annotation);
        pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.annotation.title),
            centerTitle: true,
            backgroundColor: widget.annotation.color,
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
          bottomNavigationBar: AppBottomAudioPlayer(),
          body: Container(
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        child: AnnotationFileList(
                          widget.annotation,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          bottom: 10,
                        ),
                        child: Text(
                          widget.annotation.text,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        child: Text(
                          "~ ${widget.annotation.createdAt}",
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
