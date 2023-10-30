import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SearchHistoryDatabase {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'search_history.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE search_history(id INTEGER PRIMARY KEY, query TEXT)',
        );
      },
    );
  }

  Future<void> deleteAllSearchHistory() async {
    final db = await database;
    await db.delete('search_history');
  }

  Future<void> insertSearchQuery(String query) async {
    final db = await database;
    await db.insert(
      'search_history',
      {'query': query},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<String>> getSearchHistory() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('search_history');
    return List.generate(maps.length, (index) {
      return maps[index]['query'];
    });
  }
}
