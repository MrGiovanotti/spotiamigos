import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:spotiamigos/utils/constants_utils.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static DatabaseService _databaseService;
  static Database _database;

  DatabaseService._();

  factory DatabaseService() {
    if (_databaseService == null) {
      _databaseService = DatabaseService._();
    }
    return _databaseService;
  }

  Future<Database> get getDatabase async {
    if (_database == null) {
      _database = await createDatabase();
    }
    return _database;
  }

  createDatabase() async {
    Directory databaseDirectory = await getApplicationDocumentsDirectory();
    final String databasePath = join(databaseDirectory.path, "spotiamigos.db");
    _database = await openDatabase(databasePath, version: 1,
        onCreate: (db, version) async {
      await db.execute("CREATE TABLE $ConstantsUtils.PLAN_TABLE ("
          "id INTEGER PRIMARY KEY, "
          "price DOUBLE) "
          "CREATE TABLE $ConstantsUtils.PARTICIPANTS_TABLE ("
          "id INTEGER PRIMARY KEY, "
          "name TEXT, "
          "first_month_completed TEXT, "
          "last_payment_date TEXT, "
          "debt DOUBLE)");
    });
  }
}
