import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:potato_notes/views/state/app_state.dart';
import 'package:potato_notes/views/think/think_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/navigation.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final state = GetIt.I<AppState>();

  @override
  void initState() {
    super.initState();
    redirect();
  }

  void redirect() {
    final futureData = state.getData();
    final getItFuture = GetIt.I.isReady<SharedPreferences>();
    
    Future.wait([futureData, getItFuture]).then((_) {
      state.sharedPreferences = GetIt.I<SharedPreferences>();
      state.getMainTitle();
      state.getPrimaryColor();
      
      DynamicTheme.of(context).setThemeData(
        ThemeData(
          primaryColor: state.primaryColor,
          brightness: Theme.of(context).brightness,
        ),
      );

      push(context, ThinkList(), replace: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
