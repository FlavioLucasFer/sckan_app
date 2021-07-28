import 'package:flutter/cupertino.dart';

class ProjectDetailsBack {
  BuildContext context;
  var project;

  ProjectDetailsBack(this.context) {
    project = ModalRoute.of(context)!.settings.arguments;
  }

  goToBack() {
    Navigator.of(context).pop();
  }
}
