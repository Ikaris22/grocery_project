import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../base/app_strings.dart';
import '../model/address.dart';

class DBHelper {
  static final DBHelper instance = DBHelper._private();
  static Database? _database;

  DBHelper._private();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();

    return _database!;
  }

  Future<Database> initDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = join(
      databasesPath,
      DatabaseStrings.databaseName,
    );
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }
}

Future<void> _onCreate(Database db, int version) async {
  final createDB = db.execute(DatabaseStrings.createDB);
  return createDB;
}

Future<void> insertAddress(Address address) async {
  final db = await DBHelper.instance.database;
  await db.insert(
    DatabaseStrings.tableName,
    address.toMapConvert(),
  );
}

Future<int> deleteAddress(int id) async {
  final db = await DBHelper.instance.database;
  return await db.delete(
    DatabaseStrings.tableName,
    where: 'id = ?',
    whereArgs: [id],
  );
}

Future<void> updateAddress(Address address) async {
  final db = await DBHelper.instance.database;
  await db.update(
    DatabaseStrings.tableName,
    address.toMapConvert(),
    where: 'id = ?',
    whereArgs: [address.id],
  );
}
