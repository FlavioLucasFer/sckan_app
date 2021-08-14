// @dart=2.9

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sckan_app/app/domain/entities/project.dart';
import 'package:sckan_app/app/domain/interfaces/project_dao.dart';

class ProjectDAOFirestore implements ProjectDAO {
  CollectionReference projectCollection;

  ProjectDAOFirestore() {
    projectCollection = FirebaseFirestore.instance.collection('project');
  }

  @override
  Future<List<Project>> find() async {
    var result = await this.projectCollection.get();
    return result.docs
        .map((e) => Project(
              id: e.reference.id.toString(),
              name: e['name'],
              description: e['description'],
              cloneLink: e['clone_link'],
            ))
        .toList();
  }

  @override
  inactivate(id) {
    return 0;
  }

  @override
  remove(id) {
    this.projectCollection.doc(id).delete();
  }

  @override
  save(Project project) {
    this.projectCollection.doc(project.id).set({
      'name': project.name,
      'description': project.description,
      'clone_link': project.cloneLink,
    });
  }
}
