import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sckan_app/app/app.dart';
import 'package:sckan_app/app/domain/entities/project.dart';
import 'package:sckan_app/app/domain/services/project_service.dart';

part 'project_list_back.g.dart';

class ProjectListBack = _ProjectListBack with _$ProjectListBack;

abstract class _ProjectListBack with Store {
  var _service = GetIt.I.get<ProjectService>();

  @observable
  late Future<List<Project>> list;

  @action
  refreshList([dynamic value]) {
    list = _service.find();
  }

  _ProjectListBack() {
    refreshList();
  }

  goToForm(BuildContext context, [Project? project]) {
    Navigator.of(context)
        .pushNamed(App.PROJECT_FORM, arguments: project)
        .then(refreshList);
  }

  goToDetails(BuildContext context, Project project) {
    Navigator.of(context).pushNamed(App.PROJECT_DETAILS, arguments: project);
  }

  remove(int id) {
    _service.remove(id);
    refreshList();
  }
}
