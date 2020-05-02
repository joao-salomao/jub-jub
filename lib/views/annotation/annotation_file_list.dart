import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:jubjub/models/annotation_model.dart';
import 'package:jubjub/models/annotation_file_model.dart';
import 'package:jubjub/views/annotation/files/annotation_file_widget.dart';


class AnnotationFileList extends StatelessWidget {
  final AnnotationModel annotation;
  AnnotationFileList(this.annotation);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Container(
          child: Column(
            children: List.generate(
              annotation.files.length,
              (i) {
                AnnotationFileModel file = annotation.files[i];
                return Container(
                  margin: EdgeInsets.only(bottom: 16),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        width: double.infinity,
                        child: Text(
                          file.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        child: AnnotationFileWidget(file),
                      ),
                      Container(
                        width: double.infinity,
                        child: Text(
                          file.description,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
