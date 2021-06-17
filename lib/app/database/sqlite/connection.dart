import 'package:path/path.dart';
import 'package:sckan_app/app/database/sqlite/script.dart';
import 'package:sqflite/sqflite.dart';

class Connection {
  static dynamic _db;

  static Future<Database> get() async {
    if (_db == null) {
      var path = join(await getDatabasesPath(), 'sckan-db');

      _db = await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) {
          db.execute(createProjectTable);
          db.execute(createTaskTable);
        },
      );
    }

    return _db;
  }
}
