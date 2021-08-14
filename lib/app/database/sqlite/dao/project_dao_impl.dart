// @dart=2.9

import 'package:sckan_app/app/database/sqlite/connection.dart';
import 'package:sckan_app/app/domain/entities/project.dart';
import 'package:sckan_app/app/domain/interfaces/project_dao.dart';
import 'package:sqflite/sqflite.dart';

class ProjectDAOImpl implements ProjectDAO {
  Database _db;

  @override
  Future<List<Project>> find() async {
    this._db = await Connection.get();
    List<Map<String, dynamic>> result = await this._db.query('project');
    List<Project> projects = List.generate(result.length, (i) {
      var line = result[i];

      print('list');

      return Project(
        id: line['id'],
        name: line['name'],
        description: line['description'],
        cloneLink: line['clone_link'],
      );
    });

    print(projects);

    return projects;
  }

  @override
  remove(dynamic id) async {
    this._db = await Connection.get();
    this._db.rawDelete('DELETE FROM project WHERE id = ?;', [id]);
  }

  @override
  save(Project project) async {
    var sql;
    this._db = await Connection.get();

    print('project name: ${project.name}');
    print('project desc: ${project.description}');
    print('project clone: ${project.cloneLink}');

    if (project.id == null) {
      sql = '''
        INSERT INTO project (name, description, clone_link) 
        VALUES (?, ?, ?);
      ''';

      print('came to here');

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
  inactivate(dynamic id) async {
    this._db = await Connection.get();
    this._db.rawUpdate("UPDATE project SET active = 'N' WHERE id = ?;", [id]);
  }
}
