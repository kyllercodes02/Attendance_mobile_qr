import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/user_model.dart';

class DatabaseHelper {
  DatabaseHelper._();

  static final DatabaseHelper instance = DatabaseHelper._();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'attendance_auth.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            email TEXT NOT NULL UNIQUE,
            password TEXT NOT NULL,
            role TEXT NOT NULL
          )
        ''');

        await db.insert('users', {
          'email': 'admin@example.com',
          'password': 'admin123',
          'role': 'admin',
        });

        await db.insert('users', {
          'email': 'student@example.com',
          'password': 'student123',
          'role': 'student',
        });
      },
    );
  }

  Future<UserModel?> authenticateUser({
    required String email,
    required String password,
  }) async {
    final db = await database;

    final result = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email.trim(), password],
      limit: 1,
    );

    if (result.isEmpty) {
      return null;
    }

    return UserModel.fromMap(result.first);
  }
}
