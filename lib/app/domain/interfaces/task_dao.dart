// @dart=2.9

import 'package:sckan_app/app/domain/entities/task.dart';

abstract class TaskDAO {
  save(Task task);
  remove(dynamic id);
  inactivate(dynamic id);
  Future<List<Task>> find();
}
