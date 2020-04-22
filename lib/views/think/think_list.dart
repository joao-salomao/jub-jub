import 'package:flutter/material.dart';
import 'package:potato_notes/views/think/think_card.dart';
import 'package:potato_notes/views/think/think_form.dart';

class ThinkList extends StatefulWidget {
  @override
  _ThinkListState createState() => _ThinkListState();
}

class _ThinkListState extends State<ThinkList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pensamentos"),
        centerTitle: true,
      ),
      body: ReorderableListView(
        onReorder: (int oldIndex, int newIndex) => {},
        children: <Widget>[ThinkCard(Key("1")), ThinkCard(Key("2"))],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
        onPressed: () => showThinkForm(context: context, onSubmit: () => {}),
      ),
    );
  }
}

