import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:jubjub/utils/navigation.dart';
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Algo deu errado... Tente novamente."),
            SizedBox(
              height: 20,
            ),
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

    return ListView(
      children: _getCards(),
    );
  }

  _getCards() {
    return backupController.backups.map(
      (file) {
        return Observer(
          builder: (context) {
            final _pop = () {
              pop(context);
              pop(context);
            };
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
                            onPressed: () =>
                                backupController.deleteFile(file.metaData),
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
                            onPressed: () async {
                              final result = await file.downloadFile();

                              final snackBar = SnackBar(
                                content: Text(
                                    'Anotações restauradas com sucesso !!!'),
                                action: SnackBarAction(
                                  label: result == false ? null : "Voltar",
                                  onPressed: () =>
                                      result == false ? null : _pop(),
                                ),
                                duration: Duration(
                                  seconds: 5,
                                ),
                              );
                              Scaffold.of(context).showSnackBar(snackBar);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    ).toList();
  }
}
