import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sckan_app/app/app.dart';
import 'package:sckan_app/app/domain/entities/task.dart';
import 'package:sckan_app/app/domain/services/task_service.dart';

part 'task_list_back.g.dart';

class TaskListBack = _TaskListBack with _$TaskListBack;

abstract class _TaskListBack with Store {
  var _service = GetIt.I.get<TaskService>();

  @observable
  late Future<List<Task>> list;

  @action
  refreshList([dynamic value]) {
    list = _service.find();
  }

  _TaskListBack() {
    refreshList();
  }

  goToForm(BuildContext context, [Task? task]) {
    Navigator.of(context)
        .pushNamed(App.TASK_FORM, arguments: task)
        .then(refreshList);
  }

  remove(int id) {
    _service.remove(id);
    refreshList();
  }
}
