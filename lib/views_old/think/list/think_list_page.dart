import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:think_and_write_new/entities/think.dart';
import 'package:think_and_write_new/entities/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:think_and_write_new/views/controllers/think_list_controller.dart';
import 'package:think_and_write_new/views/think/think_form.dart';
import 'package:think_and_write_new/views/user/drawer_list.dart';
import '../../../services/database_service.dart';
import 'think_card.dart';

class ThinkListPage extends StatefulWidget {
  final DatabaseService databaseService = DatabaseService();
  final User user;

  ThinkListPage(this.user);

  @override
  _ThinkListPageState createState() => _ThinkListPageState();
}

class _ThinkListPageState extends State<ThinkListPage> {
  ThinkListController controller;
  DatabaseService get databaseService => widget.databaseService;
  User get user => widget.user;

  @override
  initState() {
    super.initState();
    controller = ThinkListController(user.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thinks"),
        centerTitle: true,
      ),
      body: _body(),
      drawer: DrawerList(user),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
        onPressed: () =>
            showThinkForm(context: context, onSubmit: _onClickCreateThink),
      ),
    );
  }

  _body() {
    return Observer(builder: (_) {
      if (controller.stream.hasError) {
        return _error();
      }

      if (controller.stream.data == null) {
        return _loading();
      }

      if (controller.stream.value.documents.length == 0) {
        return _empty();
      }

      return _list();
    });
  }

  _loading() {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.black,
      ),
    );
  }

  _error() {
    return Center(
      child: Text(
        "Algo deu errado",
        style: TextStyle(
          decorationColor: Colors.red,
        ),
      ),
    );
  }

  _empty() {
    return Center(
      child: Text(
        "Você não possui nenhum think cadastrado",
        style: TextStyle(
          decorationColor: Colors.black,
        ),
      ),
    );
  }

  _list() {
    final list = _getThinkList();
    return ReorderableListView(
      onReorder: (int old, int n) {
        if (n > old) {
          n -= 1;
        }
        controller.reOrderItems(list[old], list[n]);
      },
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      children: List.generate(
        list.length,
        (i) {
          return ThinkCard(
            list[i],
            Key("$i"),
          );
        },
      ),
    );
  }

  _getThinkList() {
    return controller.stream.value.documents
        .map((document) => Think.fromDocumentSnapshot(document))
        .toList();
  }

  _onClickCreateThink(String title, Color color) {
    databaseService.addThink(title, color.value, Timestamp.now());
  }
}
