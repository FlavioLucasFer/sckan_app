// @dart=2.9

import 'package:flutter/cupertino.dart';
import 'package:sckan_app/app/domain/entities/project.dart';

class ProjectDetailsBack {
  BuildContext context;
  Project project;

  ProjectDetailsBack(this.context) {
    project = ModalRoute.of(context).settings.arguments;
  }

  goToBack() {
    Navigator.of(this.context).pop();
  }
}
