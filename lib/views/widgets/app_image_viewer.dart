import 'dart:io';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class AppImageViewer extends StatelessWidget {
  final File file;
  final String title;
  AppImageViewer(this.file, this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(title),
      ),
      body: Container(
        child: PhotoView(
          imageProvider: FileImage(file),
        ),
      ),
    );
  }
}
