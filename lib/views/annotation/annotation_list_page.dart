import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:potato_notes/models/think_model.dart';
import 'package:potato_notes/views/annotation/annotation_card.dart';
import 'package:potato_notes/controllers/annotation_controller.dart';

class AnnotationListPage extends StatefulWidget {
  final ThinkModel think;
  AnnotationListPage(this.think);

  @override
  _AnnotationListPageState createState() => _AnnotationListPageState();
}

class _AnnotationListPageState extends State<AnnotationListPage> {
  AnnotationController annotationController;
  ThinkModel get think => widget.think;

  @override
  void initState() {
    annotationController = AnnotationController(think);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Container(
          child: ReorderableListView(
            onReorder: annotationController.reOrderAnnotations,
            children: _getAnnotationsCardList(),
          ),
        );
      },
    );
  }

  _getAnnotationsCardList() {
    return List.generate(
      think.annotations.length,
      (i) {
        final annotation = think.annotations[i];
        return AnnotationCard(
          Key("${annotation.id}"),
          annotation,
          think,
          annotationController,
        );
      },
    );
  }
}
