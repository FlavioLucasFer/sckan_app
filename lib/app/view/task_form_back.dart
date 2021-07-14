import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:sckan_app/app/domain/entities/task.dart';

part 'task_form_back.g.dart';

class TaskFormBack = _TaskFormBack with _$TaskFormBack;

abstract class _TaskFormBack with Store {
  var task;

  _TaskFormBack(BuildContext context) {
    var parameter = ModalRoute.of(context)!.settings.arguments;
    task = (parameter == null) ? Task() : parameter;
  }
}
