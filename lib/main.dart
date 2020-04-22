import 'package:flutter/material.dart';
import 'package:potato_notes/views/think/think_list.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ThinkList(),
    );
  }
}

void main() => runApp(MyApp());