// @dart=2.9

import 'package:flutter/cupertino.dart';

class TaskDetailsBack {
  BuildContext context;
  var task;

  TaskDetailsBack(this.context) {
    task = ModalRoute.of(context).settings.arguments;
  }

  goToBack() {
    Navigator.of(context).pop();
  }
}
