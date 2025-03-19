import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final path = join(await getDatabasesPath(), 'app_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE usuarios (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre TEXT,
        usuario TEXT UNIQUE,
        password TEXT,
        rol TEXT
      )
    ''');

    // Insertar el usuario administrador predeterminado
    await db.insert('usuarios', {
      'nombre': 'Administrador',
      'usuario': 'admin',
      'password': 'admin123', // Cambia esto por una contraseña segura
      'rol': 'admin',
    });
  }
}