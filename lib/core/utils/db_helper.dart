import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class DBHelper {
  static Database? _db;
  static const String databaseName = 'notes.db';
  static const String tableName = 'notes';
  static const int version = 1;

  static Future<void> databaseInit() async {
    if (_db != null) {
      return;
    }
    // databaseSystemPath => the path of the database in the app folder
    String databaseSystemPath = await getDatabasesPath();
    // actualPath => path of the folder + i create file inside it called notes.db
    // then i use join method to concatenate the 2 pathes => folder path + database file name
    String actualPath = path.join(databaseSystemPath, databaseName);
    _db = await openDatabase(
      actualPath,
      version: version,
      onCreate: (db, version) async {
        return await db.execute(
            "CREATE TABLE $tableName (id INTEGER PRIMARY KEY AUTOINCREMENT, title STRING, note TEXT, date STRING, startTime STRING, endTime STRING, color INTEGER, isCompleted INTEGER)");
      },
    );
  }

  static Future<int> insertDB(Map<String, dynamic> data) async {
    log('Final insertion to my sqlite done');
    return _db!
        .insert(tableName, data, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  //this method used to get all entries in DB based on specific date and get daily notes as well
  static Future<List<Map<String, dynamic>>> queryByDate(String date) async {
    return await _db!.query(
      tableName,
      where: 'date = ?',
      whereArgs: [date],
    );
  }

  static Future<int> deleteNote({required int id}) async {
    return await _db!.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }

  static Future<int> updateNote(
      {required int id, required Map<String, dynamic> data}) async {
    return await _db!.update(tableName, data, where: 'id = ?', whereArgs: [id]);
  }

  /// *************profile***************

  //this method will return number of all notes in DB
  static Future<List<Map<String, dynamic>>> queryAll() async {
    return await _db!.query(tableName);
  }
}
