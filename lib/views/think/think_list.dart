import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:potato_notes/entities/think.dart';
import 'package:potato_notes/views/think/think_card.dart';
import 'package:potato_notes/views/think/think_form.dart';
import 'package:potato_notes/views/user/drawer_list.dart';
import 'package:potato_notes/views/app_state/app_state.dart';
import 'package:potato_notes/views/widgets/app_bottom_audio_player.dart';

class ThinkList extends StatefulWidget {
  @override
  _ThinkListState createState() => _ThinkListState();
}

class _ThinkListState extends State<ThinkList> {
  final state = GetIt.I<AppState>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: state.primaryColor,
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            title: Observer(
              builder: (_) {
                return Text(
                  state.mainTitle,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                );
              },
            ),
            centerTitle: true,
          ),
          drawer: DrawerList(),
          body: Observer(
            builder: (_) {
              return ReorderableListView(
                onReorder: state.reOrderThinks,
                children: List.generate(
                  state.thinks.length,
                  (i) => ThinkCard(
                    Key("${state.thinks[i].id}"),
                    state.thinks[i],
                  ),
                ),
              );
            },
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          floatingActionButton: Container(
            margin: EdgeInsets.only(bottom: 30),
            child: FloatingActionButton(
              backgroundColor: state.primaryColor,
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () =>
                  showThinkForm(context: context, onSubmit: _addThink),
            ),
          ),
          bottomNavigationBar: AppBottomAudioPlayer(),
        );
      },
    );
  }

  _addThink(String title, Color color) {
    final think = Think(
      title: title,
      color: color,
      listIndex: state.thinks.length,
      createdAt: DateTime.now(),
    );
    state.saveThink(think);
    state.getData();
  }
}
