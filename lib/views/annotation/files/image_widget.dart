import 'dart:io';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final File file;
  ImageWidget(this.file);

  @override
  Widget build(BuildContext context) {
    return Image.file(
      file,
      fit: BoxFit.fitWidth,
    );
  }
}
