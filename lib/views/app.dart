import 'think/think_list.dart';
import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  Color primaryColor;
  @override
  void initState() {
    super.initState();
    _setPrimaryColor();
  }

  _setPrimaryColor() async {
    final prefs = await SharedPreferences.getInstance();
    int colorValue = prefs.getInt("primaryColor");
    primaryColor = Color(colorValue != null ? colorValue : 4280391411);
  }

  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (brightness) => ThemeData(
        brightness: brightness,
        primaryColor: primaryColor,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: primaryColor,
        ),
      ),
      themedWidgetBuilder: (context, theme) {
        return MaterialApp(
          title: 'Jub-Arte',
          theme: theme,
          home: ThinkList(),
        );
      },
    );
  }
}
