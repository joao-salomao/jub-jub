import 'package:flutter/material.dart';
import 'components/app_splash_page.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (brightness) => ThemeData(
        brightness: brightness,
        floatingActionButtonTheme: FloatingActionButtonThemeData(),
      ),
      themedWidgetBuilder: (context, theme) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Jub Jub',
          theme: theme,
          home: AppSplashPage(),
        );
      },
    );
  }
}
