import 'package:flutter/material.dart';
import 'package:jubjub/utils/navigation.dart';
import 'package:jubjub/models/annotation_file_model.dart';
import 'package:jubjub/views-old/widgets/app_image_viewer.dart';

class ImageWidget extends StatelessWidget {
  final AnnotationFileModel annotationFile;
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
        height: 300,
        width: double.infinity,
        child: Image.file(
          annotationFile.file,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
