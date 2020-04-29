import 'package:flutter/material.dart';
import 'package:potato_notes/utils/navigation.dart';
import 'package:potato_notes/entities/annotation_file.dart';
import 'package:potato_notes/views/widgets/app_image_viewer.dart';

class ImageWidget extends StatelessWidget {
  final AnnotationFile annotationFile;
  ImageWidget(this.annotationFile);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        push(
          context,
          AppImageViewer(annotationFile),
        );
      },
      child: Container(
        child: Image.file(
          annotationFile.file,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
