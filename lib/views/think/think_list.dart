import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:potato_notes/entities/think.dart';
import 'package:potato_notes/views/state/app_state.dart';
import 'package:potato_notes/views/think/think_card.dart';
import 'package:potato_notes/views/think/think_form.dart';

class ThinkList extends StatefulWidget {
  @override
  _ThinkListState createState() => _ThinkListState();
}

class _ThinkListState extends State<ThinkList> {
  final state = AppState();

  @override
  void initState() {
    state.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pensamentos"),
        centerTitle: true,
      ),
      body: Observer(
        builder: (_) {
          return ReorderableListView(
            onReorder: (int oldIndex, int newIndex) => {},
            children: List.generate(
              state.thinks.length,
              (i) => ThinkCard(
                Key(state.thinks[i].id),
                state.thinks[i],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
        onPressed: () => showThinkForm(context: context, onSubmit: _addThink),
      ),
    );
  }

  _addThink(String title, Color color) async {
    final think = Think(
      title: title,
      color: color,
      createdAt: DateTime.now(),
    );
    state.addThink(think).then(
      (_) {
        state.getData();
      },
    );
  }
}
