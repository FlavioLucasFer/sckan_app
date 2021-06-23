import 'package:sckan_app/app/database/sqlite/connection.dart';
import 'package:sckan_app/app/domain/entities/task.dart';
import 'package:sckan_app/app/domain/interfaces/task_dao.dart';
import 'package:sqflite/sqflite.dart';

class TaskDAOImpl implements TaskDAO {
  late Database _db;

  @override
  Future<List<Task>> find() async {
    this._db = await Connection.get();
    List<Map<String, dynamic>> result = await this._db.query('task');
    List<Task> tasks = List.generate(result.length, (i) {
      var line = result[i];

      return Task(
        id: line['id'],
        name: line['name'],
        customIdentifier: line['custom_identifier'],
        description: line['description'],
        active: line['active'],
        createdAt: line['created_at'],
        updatedAt: line['updated_at'],
        projectId: line['project_id'],
      );
    });

    return tasks;
  }

  @override
  remove(int id) async {
    this._db = await Connection.get();
    this._db.rawDelete('DELETE FROM task WHERE id = ?;', [id]);
  }

  @override
  save(Task task) async {
    var sql;
    this._db = await Connection.get();

    // ignore: unnecessary_null_comparison
    if (task.id == null) {
      sql = '''
        INSERT INTO task (name, custom_identifier, description, project_id)
        VALUES (?, ?, ?, ?);
      ''';

      this._db.rawInsert(sql,
          [task.name, task.customIdentifier, task.description, task.projectId]);
    } else {
      sql = '''
        UPDATE task SET
          name = ?
          ,custom_identifier = ?
          ,description = ?
          ,active = ?
          ,updated_at = CURRENT_TIMESTAMP
          ,project_id = ?
        WHERE id = ?;
      ''';

      this._db.rawUpdate(sql, [
        task.name,
        task.customIdentifier,
        task.description,
        task.projectId,
        task.id,
      ]);
    }
  }

  @override
  inactivate(int id) async {
    this._db = await Connection.get();
    this._db.rawUpdate("UPDATE task SET active = 'N' WHERE id = ?;", [id]);
  }
}
