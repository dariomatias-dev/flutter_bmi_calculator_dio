import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  DB._();

  static final DB instance = DB._();

  static final Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    return await _initDatabase();
  }

  Future<Database> _initDatabase() async {
    return await openDatabase(
      join(
        await getDatabasesPath(),
        'databse.db',
      ),
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(_imc);
  }

  String get _imc => '''
    CREATE TABLE bmi_data (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      height INTEGER,
      weight INTEGER,
      bmi REAL,
      interpretation TEXT,
    )
  ''';
}
