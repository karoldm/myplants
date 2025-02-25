import 'package:myplants/models/Plant.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DB_plants {
  static final String _databaseName = 'myplants';
  static final int _version = 1;
  static final String _tableName = 'plant';

  static Database? _database;

  DB_plants._privateConstructor();
  static final DB_plants instance = DB_plants._privateConstructor();

  static Future<void> openDB() async {
    if (_database == null) _database = await _initDatabase();
    print('database on');
  }

  static Future<Database> _initDatabase() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, _databaseName);
    return await openDatabase(path, version: _version,
        onCreate: (Database db, int version) async {
      await db.execute('''CREATE TABLE IF NOT EXISTS $_tableName (
          id INTEGER PRIMARY KEY, 
          especie VARCHAR(50), 
          category VARCHAR(50), 
          humidity INT, 
          sun INT, 
          photoPath VARCHAR(100), 
          rememberWater BOOLEAN,
          daysWater BLOB,
          watered BOOLEAN)''');
    });
  }

  static void close() async {
    await _database!.close();
  }

  static Future<int> insert(Plant plant) async {
    int id = await _database!.insert(_tableName, plant.toMap());
    return id;
  }

  static Future<List<Plant>> getAll() async {
    List result = await _database!.query(_tableName);
    List<Plant> plants = [];

    for (var p in result) {
      plants.add(Plant.fromMap(p));
    }
    return plants;
  }

  static Future<Plant?> getOne(int id) async {
    List result =
        await _database!.rawQuery("SELECT * FROM $_tableName WHERE id = $id");

    if (result.isNotEmpty) return Plant.fromMap(result[0]);
    return null;
  }

  static Future<int> edit(Plant plant) async {
    return await _database!.update(_tableName, plant.toMap(),
        where: "id = ?", whereArgs: [plant.id]);
  }

  static Future<int> delete(int id) async {
    return await _database!.rawDelete("DELETE FROM $_tableName WHERE id = $id");
  }
}
