import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:potato_notes/entities/entity.dart';
import 'package:potato_notes/services/database_service.dart';

// Data Access Object
abstract class BaseDAO<T extends Entity> {
  Future<Database> get db => DatabaseService.getInstance().db;
  String get table;
  
  T fromMap(Map<String, dynamic> map);

  Future<int> save(T entity) async {
    var dbClient = await db;
    var id = await dbClient.insert(
      table,
      entity.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return id;
  }

  Future<List<T>> findAll() async {
    final dbClient = await db;

    final list = await dbClient.rawQuery('select * from $table');

    return list.map<T>((json) => fromMap(json)).toList();
  }

  Future<T> findById(int id) async {
    var dbClient = await db;
    final list =
        await dbClient.rawQuery('select * from $table where id = ?', [id]);

    if (list.length > 0) {
      return fromMap(list.first);
    }

    return null;
  }

  Future<bool> exists(int id) async {
    T c = await findById(id);
    var exists = c != null;
    return exists;
  }

  Future<int> count() async {
    final dbClient = await db;
    final list = await dbClient.rawQuery('select count(*) from $table');
    return Sqflite.firstIntValue(list);
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient.rawDelete('delete from $table where id = ?', [id]);
  }

  Future<int> deleteAll() async {
    var dbClient = await db;
    return await dbClient.rawDelete('delete from $table');
  }
}