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
              subtitle: Text("Alterar Título Principal"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () => {},
            ),
            ListTile(
              leading: Icon(Icons.brush),
              title: Text("Cor Principal"),
              subtitle: Text("Alterar Cor Principal"),
              trailing: Icon(Icons.arrow_forward),
              onTap: _changeColorDialog,
            ),
            ListTile(
              leading: Icon(Icons.brightness_6),
              title: Text("Tema"),
              subtitle: Text("Alterar Tema"),
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
          title: const Text('Selecione o Tema'),
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
    Color _color = Theme.of(context).primaryColor;
    return showDialog(
      context: context,
      builder: (_) {
        return SimpleDialog(
          title: const Text('Selecione o Tema'),
          children: [
            Container(
              height: 250,
              child: MaterialColorPicker(
                onColorChange: (Color newColor) {
                  _color = newColor;
                  _changeColor(newColor);
                }, 
                selectedColor: _color,
              ),
            ),
          ],
        );
      },
    );
  }

  _changeBrightness(Brightness value) {
    DynamicTheme.of(context)
        .setBrightness(value)
        .then((_) => setState(() => pop(context)));
  }

  _changeColor(Color color) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("primaryColor", color.value);
    setState(() {
      DynamicTheme.of(context).setThemeData(
        ThemeData(
          primaryColor: color,
        ),
      );
    });
  }
}
