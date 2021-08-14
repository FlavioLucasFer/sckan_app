// @dart=2.9

import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:sckan_app/app/database/firestore/project_dao_firestore.dart';
import 'package:sckan_app/app/database/sqlite/dao/task_dao_impl.dart';
import 'package:sckan_app/app/domain/interfaces/project_dao.dart';
import 'package:sckan_app/app/domain/interfaces/task_dao.dart';
import 'package:sckan_app/app/domain/services/project_service.dart';
import 'package:sckan_app/app/domain/services/task_service.dart';

setupInjection() async {
  GetIt getit = GetIt.I;

  await Firebase.initializeApp();

  getit.registerSingleton<ProjectDAO>(ProjectDAOFirestore());
  getit.registerSingleton<TaskDAO>(TaskDAOImpl());
  getit.registerSingleton<ProjectService>(ProjectService());
  getit.registerSingleton<TaskService>(TaskService());
}
