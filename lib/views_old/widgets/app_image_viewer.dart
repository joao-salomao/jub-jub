import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class AppImageViewer extends StatelessWidget {
  final String url;
  AppImageViewer(this.url);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PhotoView(
        backgroundDecoration: BoxDecoration(
          color: Colors.white,
        ),
        imageProvider: NetworkImage(
          url,
        ),
      ),
    );
  }
}
