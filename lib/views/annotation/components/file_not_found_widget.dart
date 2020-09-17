import 'package:flutter/material.dart';

class FileNotFoundWidget extends StatelessWidget {
  final fileType;
  FileNotFoundWidget(this.fileType);

  @override
  Widget build(BuildContext context) {
    if (fileType == 'audio') {
      return Image.asset(
        "assets/images/file_not_found_audio.png",
        fit: BoxFit.fitWidth,
      );
    }
    return Image.asset(
      "assets/images/file_not_found.png",
      fit: BoxFit.fitWidth,
    );
  }
}
