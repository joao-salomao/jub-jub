import 'video_widget.dart';
import 'audio_widget.dart';
import 'image_widget.dart';
import 'file_not_found_widget.dart';
import 'package:flutter/material.dart';
import 'package:jubjub/models/annotation_file_model.dart';

class AnnotationFileWidget extends StatelessWidget {
  final AnnotationFileModel annotationFile;
  final bool shouldPauseOnDispose;
  AnnotationFileWidget(
    this.annotationFile, {
    this.shouldPauseOnDispose = true,
  });

  @override
  Widget build(BuildContext context) {
    if (annotationFile.file == null) {
      return FileNotFoundWidget(annotationFile.type);
    }

    if (annotationFile.type == 'image') {
      return ImageWidget(annotationFile);
    }

    if (annotationFile.type == 'video') {
      return VideoWidget(annotationFile, shouldPauseOnDispose);
    }

    if (annotationFile.type == 'audio') {
      return AudioWidget(annotationFile);
    }

    return Container(
      color: Colors.black,
    );
  }
}
