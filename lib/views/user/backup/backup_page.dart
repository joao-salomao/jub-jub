import 'package:flutter/material.dart';
import 'package:jubjub/utils/navigation.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:jubjub/views/widgets/app_alert.dart';
import 'package:jubjub/models/backup_file_model.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:jubjub/views/widgets/app_flat_button.dart';
import 'package:jubjub/controllers/backup_controller.dart';
import 'package:progress_indicators/progress_indicators.dart';

class BackupPage extends StatefulWidget {
  @override
  _BackupPageState createState() => _BackupPageState();
}

class _BackupPageState extends State<BackupPage> {
  final backupController = BackupController();

  @override
  void initState() {
    backupController.getBackupsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Backup e restauração",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: backupController.primaryColor,
            centerTitle: true,
            actions: [
              Builder(
                builder: (builderContext) {
                  return Observer(
                    builder: (_) {
                      return AppFlatButton(
                        child: Icon(Icons.cloud_upload),
                        onPressed: () => _onClickNewBackup(builderContext),
                        isLoading: backupController.isLoadingNewBackup,
                      );
                    },
                  );
                },
              ),
            ],
          ),
          body: _body(),
          bottomNavigationBar: _bottomNavigationBar(),
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

  _bottomNavigationBar() {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          LinearPercentIndicator(
            width: MediaQuery.of(context).size.width * 0.5,
            lineHeight: 14,
            animation: true,
            center: Text(
              backupController.driveUsage + ' GB',
              style: TextStyle(
                fontSize: 11,
              ),
            ),
            leading: Text(
              "Espaço usado: ",
            ),
            trailing: Text(
              backupController.driveLimit + ' GB',
            ),
            percent: backupController.usagePercent,
            progressColor: backupController.primaryColor,
          ),
        ],
      ),
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
              onPressed: () {
                backupController.appController.getCurrentUser().then((_) {
                  backupController.getBackupsData();
                });
              },
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
                            loaderColor: backupController.iconColor,
                            isLoading: file.isDeleting,
                            onPressed: () =>
                                _onClickDeleteBackup(context, file),
                          ),
                          AppFlatButton(
                            child: Icon(
                              Icons.file_download,
                              color: backupController.iconColor,
                            ),
                            loaderColor: backupController.iconColor,
                            isLoading: file.isBackingUp,
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
      callback: () async {
        final result = await backupController.restoreBackup(file);

        String content;
        String label;

        if (result) {
          content = 'Anotações restauradas com sucesso !';
          label = 'Voltar';
        } else {
          content = 'Algo deu errado, tente novamente.';
          label = '';
        }

        _showSnackBar(
          snackContext: context,
          content: Text(content),
          snackBarAction: SnackBarAction(
            label: label,
            onPressed: () => result == false ? null : _pop(),
          ),
        );
      },
    );
  }

  _onClickDeleteBackup(BuildContext context, BackupFile file) {
    alert(
      context,
      "Deletando backup",
      "Você tem certeza ? As anotações desse backup serão permanentemente deletadas.",
      callback: () {
        backupController.deleteBackup(file).then((result) {
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
