import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:jubjub/utils/navigation.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:jubjub/controllers/app_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:jubjub/views/components/app_text_form_field.dart';
import 'package:jubjub/views/components/app_alert.dart';
import 'package:jubjub/views/components/app_alert_dialog.dart';

import 'children/backup_page.dart';
import 'drawer_list_controller.dart';

class DrawerList extends StatefulWidget {
  @override
  _DrawerListState createState() => _DrawerListState();
}

class _DrawerListState extends State<DrawerList> {
  final appController = GetIt.I<AppController>();
  final _controller = DrawerListController();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return SafeArea(
          child: Drawer(
            child: ListView(
              children: _getActionsItems(),
            ),
          ),
        );
      },
    );
  }

  _getActionsItems() {
    Widget accountName;
    Widget accountEmail;
    ImageProvider accountPictureProvider;
    final headerTextStyle = TextStyle(color: Colors.white);
    final List<Widget> dynamicItems = [];

    if (_controller.hasUser) {
      accountName = Text(
        _controller.currentUser.name,
        style: headerTextStyle,
      );
      accountEmail = Text(
        _controller.currentUser.email,
        style: headerTextStyle,
      );
      accountPictureProvider =
          CachedNetworkImageProvider(_controller.currentUser.photoUrl);

      dynamicItems.add(
        ListTile(
          leading: Icon(Icons.list),
          title: Text("Backup e restauração"),
          subtitle: Text("Backup e restauração no Google Drive"),
          trailing: Icon(Icons.arrow_forward),
          onTap: () => push(context, BackupPage()),
        ),
      );

      dynamicItems.add(
        ListTile(
          leading: Icon(Icons.exit_to_app),
          title: Text("Logout"),
          subtitle: Text("Sair da Conta Google"),
          trailing: Icon(Icons.arrow_forward),
          onTap: _onClickLogout,
        ),
      );
    } else {
      accountName = Text(
        'Jubarte',
        style: headerTextStyle,
      );

      accountEmail = Text(
        '',
        style: headerTextStyle,
      );

      accountPictureProvider = AssetImage("assets/images/jubarte.jpg");

      dynamicItems.add(
        ListTile(
          leading: Icon(Icons.fingerprint),
          title: Text("Login"),
          subtitle: Text("Logar com a conta google"),
          trailing: Icon(Icons.arrow_forward),
          onTap: _controller.login,
        ),
      );
    }

    final List<Widget> defaultWidgets = [
      UserAccountsDrawerHeader(
        decoration: BoxDecoration(
          color: _controller.primaryColor,
        ),
        accountName: accountName,
        accountEmail: accountEmail,
        currentAccountPicture: CircleAvatar(
          backgroundImage: accountPictureProvider,
        ),
      ),
      ListTile(
        leading: Icon(Icons.text_fields),
        title: Text("Título Principal"),
        subtitle: Text("Alterar título principal"),
        trailing: Icon(Icons.arrow_forward),
        onTap: _changeMainTitleDialog,
      ),
      ListTile(
        leading: Icon(Icons.brush),
        title: Text("Cor Principal"),
        subtitle: Text("Alterar cor principal"),
        trailing: Icon(Icons.arrow_forward),
        onTap: _changeColorDialog,
      ),
      ListTile(
        leading: Icon(Icons.brightness_6),
        title: Text("Tema"),
        subtitle: Text("Alterar tema"),
        trailing: Icon(Icons.arrow_forward),
        onTap: _changeBrightnessDialog,
      ),
    ];

    return [...defaultWidgets, ...dynamicItems];
  }

  _onClickLogout() {
    alert(
      context,
      "Saindo da conta Google",
      "Você tem certeza ? Não será possível realizar backup das suas anotações",
      callback: _controller.logout,
    );
  }

  _changeMainTitleDialog() {
    final _titleController = TextEditingController(text: _controller.mainTitle);

    return showDialog(
      context: context,
      builder: (_) {
        return Observer(
          builder: (_) {
            return AppAlertDialog(
              title: "Atualizando título",
              content: Container(
                height: 60,
                child: Column(
                  children: [
                    AppTextFormField(
                      "Título",
                      "Digite o principal desejado",
                      controller: _titleController,
                      cursorColor: _controller.primaryColor,
                    ),
                  ],
                ),
              ),
              onClose: _pop,
              onSave: () => _changeMainTitle(_titleController.text),
            );
          },
        );
      },
    );
  }

  _changeBrightnessDialog() {
    return showDialog(
      context: context,
      builder: (_) {
        return Observer(
          builder: (_) {
            return SimpleDialog(
              title: Text('Selecione o tema'),
              children: [
                RadioListTile<Brightness>(
                  value: Brightness.light,
                  groupValue: appController.brightness,
                  onChanged: _changeBrightness,
                  title: Text('Claro'),
                ),
                RadioListTile<Brightness>(
                  value: Brightness.dark,
                  groupValue: appController.brightness,
                  onChanged: _changeBrightness,
                  title: Text('Escuro'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  _changeColorDialog() {
    final originalColor = _controller.primaryColor;
    var color = _controller.primaryColor;
    final changeColor = (Color newColor) {
      _changeColor(newColor);
      _pop();
    };

    return showDialog(
      context: context,
      builder: (_) {
        return AppAlertDialog(
          title: "Alterando cor principal",
          onClose: () => changeColor(originalColor),
          onSave: () => changeColor(color),
          content: Container(
            padding: EdgeInsets.all(10),
            height: 205,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: MaterialColorPicker(
                    onColorChange: (newColor) {
                      color = newColor;
                      _changeColor(newColor);
                    },
                    selectedColor: color,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _changeMainTitle(String text) {
    _controller.updateMainTitle(text);
    _pop();
  }

  _changeBrightness(Brightness value) {
    _controller.updateBrightness(value, context);
  }

  _changeColor(Color color) async {
    _controller.updatePrimaryColor(color);
  }

  _pop() {
    pop(context);
  }
}
