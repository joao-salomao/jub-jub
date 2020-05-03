import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:jubjub/controllers/backup_controller.dart';

class BackupPage extends StatefulWidget {
  @override
  _BackupPageState createState() => _BackupPageState();
}

class _BackupPageState extends State<BackupPage> {
  final backupController = GetIt.I<BackupController>();

  @override
  void initState() {
    backupController.getBackups();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Backup"),
        centerTitle: true,
      ),
      body: Observer(
        builder: (_) {
          return _body();
        },
      ),
    );
  }

  _body() {
    if (backupController.isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    if (backupController.hasError) {
      return Center(
        child: Column(
          children: [
            Text("Algo deu errado... Tente novamente."),
            RaisedButton(
              child: Text("Carregar Novamente"),
              onPressed: backupController.getBackups,
            ),
          ],
        ),
      );
    }

    if (backupController.backups.isEmpty) {
      return Center(
        child: Text("Você não possui nenhum backup no seu Google Drive"),
      );
    }

    //  return Container();

    return ListView(
      children: _getBackupWidgetList(),
    );
  }

  _getBackupWidgetList() {
    return backupController.backups.map((file) {
      return Container(
        padding: EdgeInsets.all(6),
        child: Card(
          child: Container(
            padding: EdgeInsets.all(6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(file.createdAt),
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => {},
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    FlatButton(
                      child: file.isLoading
                          ? Container(
                              child: CircularProgressIndicator(
                              strokeWidth: .5,
                            ))
                          : Icon(Icons.file_download),
                      onPressed: file.downloadFile,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }).toList();
  }


  _onBackupDone() {

  }

  _onError() {
    
  }
}