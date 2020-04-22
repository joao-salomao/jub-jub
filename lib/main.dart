import 'views/app.dart';
import 'package:get_it/get_it.dart';
import 'views/state/app_state.dart';
import 'package:flutter/material.dart';

void setup() {
  GetIt.I.registerSingleton<AppState>(AppState());
}

void main() {
  setup();
  runApp(App());
}
