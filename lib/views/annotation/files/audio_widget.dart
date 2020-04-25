import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:potato_notes/entities/annotation_file.dart';

class AudioWidget extends StatefulWidget {
  final AnnotationFile annotationFile;
  AudioWidget(this.annotationFile);
  @override
  _AudioWidgetState createState() => _AudioWidgetState();
}

class _AudioWidgetState extends State<AudioWidget> {
  AudioPlayer audioPlayer;

  @override
  void initState() {
    audioPlayer = AudioPlayer();
    widget.annotationFile.controller = audioPlayer;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black26,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlatButton(
            child: Icon(
              Icons.play_arrow,
              size: 50,
            ),
            onPressed: () {
              audioPlayer
                  .play(widget.annotationFile.file.path)
                  .then((_) => setState(() => {}));
            },
          ),
          FlatButton(
            child: Icon(
              Icons.pause,
              size: 50,
            ),
            onPressed: () {
              audioPlayer.pause().then((_) => setState(() => {}));
            },
          ),
          FlatButton(
            child: Icon(
              Icons.stop,
              size: 50,
            ),
            onPressed: () {
              audioPlayer.stop().then((_) => setState(() => {}));
            },
          ),
        ],
      ),
    );
  }
}
