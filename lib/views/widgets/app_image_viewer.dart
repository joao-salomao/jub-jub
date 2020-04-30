import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:potato_notes/models/annotation_file_model.dart';

class AppImageViewer extends StatelessWidget {
  final AnnotationFileModel annotationFile;
  AppImageViewer(this.annotationFile);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(annotationFile.title),
      ),
      body: Container(
        child: PhotoView(
          imageProvider: FileImage(annotationFile.file),
        ),
      ),
    );
  }
}
