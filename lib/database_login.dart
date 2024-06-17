import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'users.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY,
        incubator_id TEXT NOT NULL,
        password TEXT NOT NULL
      )
    ''');
    await _insertSampleData(db);
  }

  Future _insertSampleData(Database db) async {
    await db.insert('users', {'incubator_id': '1234', 'password': '23UI8'});
    await db.insert('users', {'incubator_id': '1235', 'password': '24Ut4'});
  }

  Future<Map<String, dynamic>?> getUser(String incubator_id) async {
    Database db = await database;
    List<Map<String, dynamic>> results = await db.query(
      'users',
      where: 'incubator_id = ?',
      whereArgs: [incubator_id],
    );
    return results.isNotEmpty ? results.first : null;
  }
}
