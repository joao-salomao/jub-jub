import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:jubjub/utils/navigation.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:jubjub/views/widgets/app_alert.dart';
import 'package:jubjub/models/backup_file_model.dart';
import 'package:jubjub/controllers/backup_controller.dart';
import 'package:jubjub/views/widgets/app_flat_button.dart';
import 'package:progress_indicators/progress_indicators.dart';

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
    return Observer(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Backup"),
            backgroundColor: backupController.backupAppBarColor,
            centerTitle: true,
            actions: [
              Builder(
                builder: (_) {
                  return AppFlatButton(
                    child: Icon(Icons.cloud_upload),
                    onPressed: () => _onClickNewBackup(_),
                    isLoading: backupController.isLoadingNewBackup,
                  );
                },
              ),
            ],
          ),
          body: _body(),
        );
      },
    );
  }

  _onClickNewBackup(BuildContext context) {
    alert(
      context,
      "Novo backup",
      "Você tem certeza que deseja armazenar um novo backup ?",
      callback: () {
        backupController.storeNewBackup().then((result) {
          _showSnackBar(
            snackContext: context,
            content: Text(result == false
                ? 'Algo deu errado, tente novamente.'
                : 'Backup realizado com sucesso !'),
            snackBarAction: SnackBarAction(
              label: result == false ? "" : "Voltar",
              onPressed: () => result == false ? null : _pop(),
            ),
          );
        });
      },
    );
  }

  _body() {
    if (backupController.isLoadingBackups) {
      return Center(
        child: JumpingDotsProgressIndicator(
          color: backupController.iconColor,
          fontSize: 50,
        ),
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
                          AppFlatButton(
                            child: Icon(
                              Icons.delete,
                              color: backupController.iconColor,
                            ),
                            isLoading: file.isDeleting,
                            onPressed: () =>
                                _onClickDeleteBackup(context, file),
                          ),
                          AppFlatButton(
                            child: Icon(
                              Icons.file_download,
                              color: backupController.iconColor,
                            ),
                            isLoading: file.isDownloading,
                            onPressed: () => _onClickBackup(context, file),
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

  _onClickBackup(BuildContext context, BackupFile file) {
    alert(
      context,
      "Restaurando dados",
      "Você tem certeza que deseja restaurar as anotações desse backup ?",
      callback: () {
        file.downloadFile().then((result) {
          _showSnackBar(
            snackContext: context,
            content: Text(result == false
                ? 'Algo deu errado, tente novamente.'
                : 'Anotações restauradas com sucesso !'),
            snackBarAction: SnackBarAction(
              label: result == false ? "" : "Voltar",
              onPressed: () => result == false ? null : _pop(),
            ),
          );
        });
      },
    );
  }

  _onClickDeleteBackup(BuildContext context, BackupFile file) {
    alert(
      context,
      "Deletando backup",
      "Você tem certeza ? As anotações desse backup serão permanentemente deletadas.",
      callback: () {
        backupController.deleteFile(file).then((result) {
          _showSnackBar(
            snackContext: context,
            content: Text(result == false
                ? 'Algo deu errado, tente novamente.'
                : 'Backup deletado com sucesso !'),
            snackBarAction: SnackBarAction(
              label: result == false ? "" : "Voltar",
              onPressed: () => result == false ? null : _pop(),
            ),
          );
        });
      },
    );
  }

  _pop() {
    pop(context);
    pop(context);
  }

  _showSnackBar({
    BuildContext snackContext,
    Widget content,
    SnackBarAction snackBarAction,
  }) {
    final snackBar = SnackBar(
      content: content,
      action: snackBarAction,
      duration: Duration(
        seconds: 5,
      ),
    );
    Scaffold.of(snackContext).showSnackBar(snackBar);
  }
}
