import 'dart:io' as io;

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quick_alarms/Config/Constants.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  //Create a static instance
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  //Factory
  factory DatabaseHelper() => _instance;
  static Database _db;

  DatabaseHelper.internal();

  initDb() async {
    //Get the directory where database is saved
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();

    String dir = join(documentsDirectory.path, APP_DATABASE);
    _db = await openDatabase(dir, version: 1, onCreate: _onCreate);
  }

  Database get db {
    return _db;
  }

  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        'CREATE TABLE $QUICK_ALARM_TABLE (id INTEGER PRIMARY KEY AUTOINCREMENT,'
        'name TEXT,'
        'time TEXT'
        ')');
  }
}
