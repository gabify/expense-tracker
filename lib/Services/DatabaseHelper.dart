import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{
  DatabaseHelper._internal();

  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  Database? _db;

  Future<Database> get database async{
    if(_db != null) return _db!;

    _db = await _initDB('expense_tracker_3.db');
    return _db!;
  }

  Future<Database> _initDB(String filePath) async{
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async{
    await db.execute('''
      CREATE TABLE expenses (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        description TEXT,
        cost REAL,
        category TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE budget (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        total REAL,
        created_at TEXT
      )
    ''');
  }

  Future<int> insertExpense(Map<String, dynamic> expense) async{
    final db = await database;
    return await db.insert('expenses', expense);
  }

  Future<int> insertBudget(Map<String, dynamic> budget) async{
    final db = await database;
    return await db.insert('budget', budget);
  }

  Future<List<Map<String, dynamic>>> getAllExpenses() async{
    final db = await database;
    return await  db.query('expenses');
  }

  Future<List<Map<String, dynamic>>> getCurrentBudget() async{
    final db = await database;
    return await  db.rawQuery('''SELECT * FROM budget ORDER BY id DESC LIMIT 1''');
  }

  Future <List<Map<String, dynamic>>> getAllBudget() async{
    final db = await database;
    return await db.query('budget');
  }
}