import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:jubjub/views/components/app_bottom_audio_player.dart';
import 'package:jubjub/views/think_list/think_list_controller.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'children/drawer_list/drawer_list.dart';
import 'components/think_card.dart';
import 'components/think_form.dart';

class ThinkList extends StatefulWidget {
  @override
  _ThinkListState createState() => _ThinkListState();
}

class _ThinkListState extends State<ThinkList> {
  final controller = ThinkListController();

  @override
  void initState() {
    controller.getThinks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: controller.primaryColor,
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            title: Observer(
              builder: (_) {
                return Text(
                  controller.mainTitle,
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
              if (controller.isLoading) {
                return Center(
                  child: JumpingDotsProgressIndicator(
                    color: controller.brightnessIsDark
                        ? Colors.white
                        : Colors.black,
                    fontSize: 50,
                  ),
                );
              }

              if (controller.listIsEmpty) {
                return Center(
                  child: Text("Você não possui nenhuma pasta cadastrada"),
                );
              }

              return ReorderableListView(
                onReorder: controller.reOrderThinks,
                children: List.generate(
                  controller.thinks.length,
                  (i) => ThinkCard(
                    Key("${controller.thinks[i].id}"),
                    controller.thinks[i],
                  ),
                ),
              );
            },
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          floatingActionButton: Container(
            margin: EdgeInsets.only(bottom: 30),
            child: FloatingActionButton(
              backgroundColor: controller.primaryColor,
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () => showThinkForm(
                  context: context, onSubmit: controller.createThink),
            ),
          ),
          bottomNavigationBar: AppBottomAudioPlayer(),
        );
      },
    );
  }
}
