import 'package:flutter/material.dart';
import 'package:potato_notes/entities/annotation.dart';
import 'package:potato_notes/entities/annotation_file.dart';
import 'package:potato_notes/views/annotation/files/annotation_file_widget.dart';
import 'package:potato_notes/views/widgets/app_text.dart';

class AnnotationFileList extends StatefulWidget {
  final Annotation annotation;
  AnnotationFileList(this.annotation);

  @override
  _AnnotationFileListState createState() => _AnnotationFileListState();
}

class _AnnotationFileListState extends State<AnnotationFileList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: List.generate(
          widget.annotation.files.length,
          (i) {
            AnnotationFile file = widget.annotation.files[i];
            return Container(
              margin: EdgeInsets.only(bottom: 16),
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    width: double.infinity,
                    child: AppText(
                      file.title,
                      fontSize: 16,
                      bold: true,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: AnnotationFileWidget(file),
                  ),
                  Container(
                    width: double.infinity,
                    child: AppText(
                      file.description,
                      fontSize: 16,
                      bold: true,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
