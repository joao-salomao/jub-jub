import 'dart:io';
import 'package:video_player/video_player.dart';

class AnnotationFile {
  String id;
  File file;
  String path;
  String type;
  String title;
  String description;
  VideoPlayerController controller;

  AnnotationFile(
    this.title,
    this.file, {
    this.path,
    this.type,
    this.description,
  });
}
