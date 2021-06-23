import 'package:sckan_app/app/domain/entities/task.dart';

abstract class TaskDAO {
  save(Task task);
  remove(int id);
  inactivate(int id);
  Future<List<Task>> find();
}
