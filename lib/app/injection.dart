// @dart=2.9

import 'package:get_it/get_it.dart';
import 'package:sckan_app/app/database/mysql/project_dao_mysql.dart';
import 'package:sckan_app/app/database/sqlite/dao/task_dao_impl.dart';
import 'package:sckan_app/app/domain/interfaces/project_dao.dart';
import 'package:sckan_app/app/domain/interfaces/task_dao.dart';
import 'package:sckan_app/app/domain/services/project_service.dart';
import 'package:sckan_app/app/domain/services/task_service.dart';

setupInjection() {
  GetIt getit = GetIt.I;

  getit.registerSingleton<ProjectDAO>(ProjectDAOMySQL());
  getit.registerSingleton<TaskDAO>(TaskDAOImpl());
  getit.registerSingleton<ProjectService>(ProjectService());
  getit.registerSingleton<TaskService>(TaskService());
}
