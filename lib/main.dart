import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:jubjub/views/app.dart';
import 'package:jubjub/dao/think_dao.dart';
import 'package:jubjub/dao/annotation_dao.dart';
import 'package:jubjub/services/backup_service.dart';
import 'package:jubjub/dao/annotation_file_dao.dart';
import 'package:jubjub/controllers/app_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jubjub/controllers/app_audio_player_controller.dart';

void setup() async {
  // DAO's
  GetIt.I.registerSingleton<ThinkDAO>(ThinkDAO());
  GetIt.I.registerSingleton<AnnotationDAO>(AnnotationDAO());
  GetIt.I.registerSingleton<AnnotationFileDAO>(AnnotationFileDAO());

  GetIt.I.registerSingleton<AppController>(AppController());
  GetIt.I
      .registerSingleton<AppAudioPlayerController>(AppAudioPlayerController());

  GetIt.I.registerSingletonAsync<SharedPreferences>(
      () => SharedPreferences.getInstance());

  GetIt.I.registerSingleton<BackupService>(BackupService());
}

void main() {
  setup();
  runApp(App());
}
