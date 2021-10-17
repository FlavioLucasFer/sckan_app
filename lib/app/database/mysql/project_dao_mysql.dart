import 'dart:convert';

import 'package:sckan_app/app/domain/entities/project.dart';
import 'package:sckan_app/app/domain/interfaces/project_dao.dart';
import 'package:http/http.dart' as http;

class ProjectDAOMySQL implements ProjectDAO {
  final uriREST = Uri.parse('http://192.168.1.104:8080/project');

  @override
  Future<List<Project>> find() async {
    var response = await http.get(uriREST);

    if (response.statusCode != 200) throw Exception('REST API error!');

    Iterable listDart = json.decode(response.body);

    var projects = List<Project>.from(listDart.map((project) => Project(
          id: project['id'],
          name: project['name'],
          description: project['description'],
          cloneLink: project['clone_link'],
        )));

    return projects;
  }

  @override
  inactivate(id) {
    //
  }

  @override
  remove(id) async {
    print('here');
    var uri = Uri.parse('http://192.168.1.104:8080/project/$id');
    var response = await http.delete(uri);

    if (response.statusCode != 200) throw Exception('REST API error!');
  }

  @override
  save(Project project) async {
    var headers = {
      'Content-Type': 'application/json',
    };

    var body = jsonEncode({
      'id': project.id,
      'name': project.name,
      'description': project.description,
      'cloneLink': project.cloneLink,
      'active': project.active,
    });

    int statusCode = 0;

    if (project.id == null) {
      var response = await http.post(uriREST, headers: headers, body: body);
      statusCode = response.statusCode;
    } else {
      var response = await http.put(uriREST, headers: headers, body: body);
      statusCode = response.statusCode;
    }

    if (statusCode != 200) throw Exception("REST API error!");
  }
}
