import 'video_widget.dart';
import 'audio_widget.dart';
import 'image_widget.dart';
import 'file_not_found_widget.dart';
import 'package:flutter/material.dart';
import 'package:jubjub/models/annotation_file_model.dart';

class AnnotationFileWidget extends StatelessWidget {
  final AnnotationFileModel annotationFile;
  AnnotationFileWidget(this.annotationFile);

  @override
  Widget build(BuildContext context) {
    if (annotationFile.file == null) {
      return FileNotFoundWidget(annotationFile.type);
    }

    if (annotationFile.type == 'image') {
      return ImageWidget(annotationFile.file, annotationFile.title);
    }

    if (annotationFile.type == 'video') {
      return VideoWidget(annotationFile.file);
    }

    if (annotationFile.type == 'audio') {
      return AudioWidget(annotationFile.fileName, annotationFile.file.path);
    }

    return Container(
      color: Colors.black,
    );
  }
}
