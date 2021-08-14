// @dart=2.9

import 'package:sckan_app/app/domain/entities/project.dart';

abstract class ProjectDAO {
  save(Project project);
  remove(dynamic id);
  inactivate(dynamic id);
  Future<List<Project>> find();
}
