// ignore_for_file: recursive_getters, avoid_print

import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_project/Data/Model/db_model.dart';

import '../../Constns/db_const.dart';

class DataBaseHelper {
  static Database? dbHelp;

  Future<Database?> get getDb async {
    if (dbHelp != null) {
      return dbHelp;
    } else {
      return await initilDb();
    }
  }

  Future<Database> initilDb() async {
    //  ده بتعمل موقع افتراضي ل الداتا بيز
    String dataBasePath = await getDatabasesPath();
    //   ده علشان اقوم بحفظ المسار للداتا
    String path = join(dataBasePath, 'demo.db');
    //  ده بقي اللى بتعملى او بتفتحلى الداتا بيز علشان اعمل دانا بيز
    return await openDatabase(path,
        onCreate: _onCreate, version: 1, onUpgrade: onUpgrade);
  }

  FutureOr<void> onUpgrade(Database db, int oldVersion, int newVersion) async {
    // await db.execute("ALTER TABLE $columntable Add $columnPhone TEXT");
    // print('upgrade');
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
CREATE TABLE $columntable (
  $columnId INTEGER PRIMARY KEY,
  $columnName TEXT,
  $columnEmail TEXT
)
''');
  }

  // Create
  Future<void> insert(UserModel user) async {
    Database? myDb = await getDb;
    user.id = await myDb!.insert(
      columntable,
      user.tojson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Read All user
  Future<List<UserModel>> getData() async {
    Database? myDb = await getDb;
    List<Map> response = await myDb!.query(columntable);
    return response.isNotEmpty
        ? response.map((e) => UserModel.fromjson(e)).toList()
        : [];
  }

  // Update
  Future<int> updateData(UserModel user) async {
    Database? myDb = await getDb;
    int response = await myDb!.update(
      columntable,
      user.tojson(),
      where: ' $columnId = ?',
      whereArgs: [user.id],
    );
    return response;
  }

  // Delete User
  Future<int> deleteData(int id) async {
    Database? myDb = await getDb;
    int response = await myDb!.delete(
      columntable,
      where: " $columnId = ?",
      whereArgs: [id],
    );
    return response;
  }

  //  Read 1 User
  readOneUser(int id) async {
    Database? myDb = await getDb;
    return await myDb!.query(
      columntable,
      where: ' $columnId = ?',
      whereArgs: [id],
    );
  }

  // To Delete All DataBase
  mydeleteDataBase() async {
    //  ده بتعمل موقع افتراضي ل الداتا بيز
    String dataBasePath = await getDatabasesPath();
    //   ده علشان اقوم بحفظ المسار للداتا
    String path = join(dataBasePath, 'demo.db');
    await deleteDatabase(path);
  }
}
