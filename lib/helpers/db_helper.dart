import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {
  static Future<sql.Database> database() async {
    final dbpath = await sql.getDatabasesPath();

    return sql.openDatabase(path.join(dbpath, 'notes.db'),
        onCreate: (db, version) {
      return db.execute(
          'Create Table notes(title TEXT PRIMARY KEY,desc TEXT,day INT, month TEXT, year INT)');
    }, version: 1);
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DBHelper.database();
    await db.insert(table, data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DBHelper.database();
    return db.query(table);
  }
}
