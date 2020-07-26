import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:jubjub/models/think_model.dart';
import 'package:jubjub/controllers/app_controller.dart';
import 'package:jubjub/views/components/app_bottom_audio_player.dart';
import 'package:progress_indicators/progress_indicators.dart';

import 'children/drawer_list/drawer_list.dart';
import 'components/think_card.dart';
import 'components/think_form.dart';

class ThinkList extends StatefulWidget {
  @override
  _ThinkListState createState() => _ThinkListState();
}

class _ThinkListState extends State<ThinkList> {
  final appController = GetIt.I<AppController>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: appController.primaryColor,
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            title: Observer(
              builder: (_) {
                return Text(
                  appController.mainTitle,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                );
              },
            ),
            centerTitle: true,
            // actions: <Widget>[
            //   IconButton(
            //     icon: Icon(Icons.ac_unit),
            //     onPressed: () => appController.truncate(),
            //   )
            // ],
          ),
          drawer: DrawerList(),
          body: Observer(
            builder: (_) {
              if (appController.isLoading) {
                return Center(
                  child: JumpingDotsProgressIndicator(
                    color: appController.brightnessIsDark
                        ? Colors.white
                        : Colors.black,
                    fontSize: 50,
                  ),
                );
              }

              if (appController.thinks.isEmpty) {
                return Center(
                  child: Text("Você não possui nenhuma pasta cadastrada"),
                );
              }

              return ReorderableListView(
                onReorder: appController.reOrderThinks,
                children: List.generate(
                  appController.thinks.length,
                  (i) => ThinkCard(
                    Key("${appController.thinks[i].id}"),
                    appController.thinks[i],
                  ),
                ),
              );
            },
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          floatingActionButton: Container(
            margin: EdgeInsets.only(bottom: 30),
            child: FloatingActionButton(
              backgroundColor: appController.primaryColor,
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
    final think = ThinkModel(
      title: title,
      color: color,
      listIndex: appController.thinks.length,
      createdAt: DateTime.now(),
    );
    appController.saveThink(think);
    appController.getData();
  }
}
