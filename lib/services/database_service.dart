import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/services.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService.getInstance();
  DatabaseService.getInstance();

  factory DatabaseService() => _instance;

  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await _initDb();

    return _db;
  }

  Future _initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'jubjub_database.db');

    var db = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
    return db;
  }

  void _onCreate(
    Database db,
    int newVersion,
  ) async {
    String fileString = await rootBundle.loadString("assets/sql/create.sql");
    List<String> sqls = fileString.split(";");
    for (String sql in sqls) {
      await db.execute(sql);
    }
  }

  Future<FutureOr<void>> _onUpgrade(
    Database db,
    int oldVersion,
    int newVersion,
  ) async {}

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
