import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioWidget extends StatefulWidget {
  final File file;
  AudioWidget(this.file);
  @override
  _AudioWidgetState createState() => _AudioWidgetState();
}

class _AudioWidgetState extends State<AudioWidget> {
  final audioPlayer = AudioPlayer();

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
                  .play(widget.file.path)
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
