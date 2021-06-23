import 'package:sckan_app/app/database/sqlite/connection.dart';
import 'package:sckan_app/app/domain/entities/project.dart';
import 'package:sckan_app/app/domain/interfaces/project_dao.dart';
import 'package:sqflite/sqflite.dart';

class ProjectDAOImpl implements ProjectDAO {
  late Database _db;

  @override
  Future<List<Project>> find() async {
    this._db = await Connection.get();
    List<Map<String, dynamic>> result = await this._db.query('project');
    List<Project> projects = List.generate(result.length, (i) {
      var line = result[i];

      return Project(
        id: line['id'],
        name: line['name'],
        description: line['description'],
        cloneLink: line['clone_link'],
        active: line['active'],
        createdAt: line['created_at'],
        updatedAt: line['updated_at'],
      );
    });

    return projects;
  }

  @override
  remove(int id) async {
    this._db = await Connection.get();
    this._db.rawDelete('DELETE FROM project WHERE id = ?;', [id]);
  }

  @override
  save(Project project) async {
    var sql;
    this._db = await Connection.get();

    // ignore: unnecessary_null_comparison
    if (project.id == null) {
      sql = '''
        INSERT INTO project (name, description, clone_link) 
        VALUES (?, ?, ?);
      ''';

      this._db.rawInsert(
          sql, [project.name, project.description, project.cloneLink]);
    } else {
      sql = '''
        UPDATE project SET
          name = ?
          ,description = ?
          ,clone_link = ?
          ,active = ?
          ,updated_at = CURRENT_TIMESTAMP
        WHERE id = ?;
      ''';

      this._db.rawUpdate(sql, [
        project.name,
        project.description,
        project.cloneLink,
        project.active,
        project.id,
      ]);
    }
  }

  @override
  inactivate(int id) async {
    this._db = await Connection.get();
    this._db.rawUpdate("UPDATE project SET active = 'N' WHERE id = ?;", [id]);
  }
}
