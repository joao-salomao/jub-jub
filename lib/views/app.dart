import 'package:flutter/material.dart';
import 'think/think_list.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Potato Notes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ThinkList(),
    );
  }
}
