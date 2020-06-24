import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:jubjub/utils/navigation.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:jubjub/views/think/think_list.dart';
import 'package:jubjub/controllers/app_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:progress_indicators/progress_indicators.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final controller = GetIt.I<AppController>();

  @override
  void initState() {
    super.initState();
    redirect();
  }

  void redirect() {
    final futureData = controller.getData();
    final futureDelay = Future.delayed(Duration(seconds: 1));
    final futureGetIt = GetIt.I.isReady<SharedPreferences>();

    Future.wait([futureData, futureGetIt, futureDelay]).then((_) {
      controller.sharedPreferences = GetIt.I<SharedPreferences>();
      controller.getMainTitle();
      controller.getPrimaryColor();
      controller.getCurrentUser();

      DynamicTheme.of(context).setThemeData(
        ThemeData(
          primaryColor: controller.primaryColor,
          brightness: Theme.of(context).brightness,
        ),
      );

      controller.getBrightness(context);

      push(context, ThinkList(), replace: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: JumpingDotsProgressIndicator(
            fontSize: 50,
          ),
        ),
      ),
    );
  }
}
