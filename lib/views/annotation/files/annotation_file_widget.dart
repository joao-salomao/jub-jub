import 'file_not_found_widget.dart';
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
    if (annotationFile.file == null) {
      return FileNotFoundWidget(annotationFile.type);
    }

    if (annotationFile.type == 'image') {
      return ImageWidget(annotationFile.file);
    }

    if (annotationFile.type == 'video') {
      return VideoWidget(annotationFile);
    }

    if (annotationFile.type == 'audio') {
      return AudioWidget(annotationFile);
    }

    return Container(
      color: Colors.black,
    );
  }
}
