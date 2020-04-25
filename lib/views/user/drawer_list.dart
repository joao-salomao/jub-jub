import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/navigation.dart';

class DrawerList extends StatefulWidget {
  @override
  _DrawerListState createState() => _DrawerListState();
}

class _DrawerListState extends State<DrawerList> {
  final defaultImageUrl =
      "https://freeiconshop.com/wp-content/uploads/edd/person-solid.png";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.text_fields),
              title: Text("Título Principal"),
              subtitle: Text("Alterar título principal"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () => {},
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
          ],
        ),
      ),
    );
  }

  _changeBrightnessDialog() {
    return showDialog(
      context: context,
      builder: (_) {
        return SimpleDialog(
          title: const Text('Selecione o tema'),
          children: [
            RadioListTile<Brightness>(
              value: Brightness.light,
              groupValue: Theme.of(context).brightness,
              onChanged: _changeBrightness,
              title: const Text('Claro'),
            ),
            RadioListTile<Brightness>(
              value: Brightness.dark,
              groupValue: Theme.of(context).brightness,
              onChanged: _changeBrightness,
              title: const Text('Escuro'),
            ),
          ],
        );
      },
    );
  }

  _changeColorDialog() {
    return showDialog(
      context: context,
      builder: (_) {
        return SimpleDialog(
          title: const Text('Selecione a cor'),
          children: [
            Container(
              height: 250,
              child: MaterialColorPicker(
                onColorChange: _changeColor,
                selectedColor: Theme.of(context).primaryColor,
              ),
            ),
          ],
        );
      },
    );
  }

  _changeBrightness(Brightness value) {
    DynamicTheme.of(context).setBrightness(value).then(
          (_) => setState(
            () => pop(context),
          ),
        );
  }

  _changeColor(Color color) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("primaryColor", color.value);
    setState(() {
      DynamicTheme.of(context).setThemeData(
        ThemeData(
            primaryColor: color, brightness: Theme.of(context).brightness),
      );
      pop(context);
      pop(context);
    });
  }
}
