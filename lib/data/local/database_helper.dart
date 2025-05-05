import 'dart:io';

import 'package:notes_keeper/data/database_constants/table_notes.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._();

  static final DatabaseHelper getInstance = DatabaseHelper._();

  Database? dataBase;

  Future<Database> getDatabase() async {
    dataBase ??= await openDb();
    return dataBase!;
  }

  Future<Database> openDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute(
          'CREATE TABLE $tableNameNote ('
          '$columnSerialNumber INTEGER PRIMARY KEY AUTOINCREMENT, '
          '$columnTitle TEXT, '
          '$columnDescription TEXT, '
          '$columnCreatedDate TEXT)',
        );
      },

    );
  }

  Future<bool> addNote({
    required String title,
    required String description,
  }) async {
    var db = await getDatabase();
    int rowsEffected = await db.insert(tableNameNote, {
      columnTitle: title,
      columnDescription: description,
      columnCreatedDate:
          '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
    });
    return rowsEffected > 0;
  }

  Future<bool> updateNote({
    required int id,
    required String title,
    required String description,
  }) async {
    var db = await getDatabase();
    int rowsEffected = await db.update(
      tableNameNote,
      {
        columnTitle: title,
        columnDescription: description,
        columnCreatedDate:
            '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
      },
      where: '$columnSerialNumber = ?',
      whereArgs: [id],
    );
    return rowsEffected > 0;
  }

  Future<bool> deleteNote({required int id}) async {
    var db = await getDatabase();
    int rowEffected = await db.delete(
      tableNameNote,
      where: '$columnSerialNumber = ?',
      whereArgs: [id],
    );
    return rowEffected > 0;
  }

  Future<List<Map<String, dynamic>>> get getNotes async {
    var db = await getDatabase();
    return db.query(tableNameNote);
  }
}
