import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  static Database? _database;

  DBHelper._internal();

  factory DBHelper() => _instance;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'todo.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE todos (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT NOT NULL,
            subtitle TEXT NOT NULL,   -- New
            date TEXT NOT NULL,       -- New
            isCompleted INTEGER NOT NULL
          )
        ''');
      },
    );
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database? db = await database;
    return await db!.insert('todos', row);
  }

  Future<List<Map<String, dynamic>>> queryAll() async {
    Database? db = await database;
    return await db!.query('todos');
  }

  Future<int> update(Map<String, dynamic> row) async {
    Database? db = await database;
    int id = row['id'];
    return await db!.update('todos', row, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database? db = await database;
    return await db!.delete('todos', where: 'id = ?', whereArgs: [id]);
  }
}
