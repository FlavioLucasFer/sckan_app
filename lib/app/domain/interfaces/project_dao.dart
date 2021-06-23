import 'package:sckan_app/app/domain/entities/project.dart';

abstract class ProjectDAO {
  save(Project project);
  remove(int id);
  inactivate(int id);
  Future<List<Project>> find();
}
