import 'package:flutter/material.dart';
import 'package:sckan_app/app/view/task_form.dart';
import 'package:sckan_app/app/view/project_form.dart';
import 'package:sckan_app/app/view/project_list.dart';
import 'package:sckan_app/app/view/task_list.dart';

class App extends StatelessWidget {
  static const LOGIN = '/';
  static const USER_FORM = 'user-form';
  static const PROJECT_LIST = 'project-list';
  static const PROJECT_FORM = 'project-form';
  static const TASK_LIST = 'task-list';
  static const TASK_FORM = 'task_form';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        PROJECT_LIST: (context) => ProjectList(),
        PROJECT_FORM: (context) => ProjectForm(),
        TASK_LIST: (context) => TaskList(),
        TASK_FORM: (context) => TaskForm(),
      },
    );
  }
}
