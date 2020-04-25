import 'video_widget.dart';
import 'audio_widget.dart';
import 'image_widget.dart';
import 'package:flutter/material.dart';
import 'package:potato_notes/entities/annotation_file.dart';

class AnnotationFileWidget extends StatelessWidget {
  final AnnotationFile annotationFile;
  AnnotationFileWidget(this.annotationFile);

  @override
  Widget build(BuildContext context) {
    if (annotationFile.type == 'image') {
      return ImageWidget(annotationFile.file);
    }

    if (annotationFile.type == 'video') {
      return VideoWidget(annotationFile.file);
    }

    if (annotationFile.type == 'audio') {
      return AudioWidget(annotationFile.file);
    }

    return Container(
      color: Colors.black,
    );
  }
}
