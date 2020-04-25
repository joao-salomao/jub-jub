import 'package:flutter/material.dart';
import 'package:potato_notes/entities/annotation.dart';
import 'package:potato_notes/entities/annotation_file.dart';
import 'package:potato_notes/entities/think.dart';
import 'package:potato_notes/views/widgets/app_text.dart';

class AnnotationFileList extends StatefulWidget {
  final Think think;
  final Annotation annotation;
  AnnotationFileList(this.think, this.annotation);

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
              margin: EdgeInsets.only(
                top: 16,
              ),
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    child: AppText(
                      file.title,
                      fontSize: 16,
                      bold: true,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  // GestureDetector(
                  //   child: Image.network(
                  //     file.url,
                  //     height: 300,
                  //     width: double.infinity,
                  //     fit: BoxFit.fitWidth,
                  //   ),
                  //   onTap: () {
                  //     push(
                  //       context,
                  //       AppImageViewer(file.url),
                  //     );
                  //   },
                  // ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
