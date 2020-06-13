import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper; // Singleton DatabaseHelper
  static Database _database; // Singleton Database

  DatabaseHelper._createInstance(); // Named constructor to create instance of DatabaseHelper

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper
          ._createInstance(); // This is executed only once, singleton object
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }
// Инициализируем БД
  Future<Database> initializeDatabase() async {
    print('initialize DB');
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'app.db';
    var appsDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return appsDatabase;
  }
// Создаем таблицу в БД
  void _createDb(Database db, int newVersion) async {
    await db.execute("""
    CREATE TABLE IF NOT EXISTS fruits (
        id	INTEGER PRIMARY KEY AUTOINCREMENT,
        name	TEXT,
        grams	INTEGER,
        calories	INTEGER,
        weight	INTEGER,
        price	INTEGER
    ); """);
  }
}
