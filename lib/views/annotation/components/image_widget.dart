import 'dart:io';
import 'package:flutter/material.dart';
import 'package:jubjub/utils/navigation.dart';
import 'package:jubjub/views/widgets/app_image_viewer.dart';

class ImageWidget extends StatelessWidget {
  final File file;
  final String title;
  ImageWidget(this.file, this.title);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        push(
          context,
          AppImageViewer(file, title),
        );
      },
      child: Container(
        height: 300,
        width: double.infinity,
        child: Image.file(
          file,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
