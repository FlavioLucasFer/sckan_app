// @dart=2.9

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:sckan_app/app/domain/entities/task.dart';
import 'package:sckan_app/app/domain/services/task_service.dart';

class TaskFormBack {
  var task;
  var _service = GetIt.I.get<TaskService>();
  var _nameIsValid = false;
  var _descriptionIsValid = false;
  var _customIdentifier = false;

  bool get isValid => _nameIsValid && _descriptionIsValid && _customIdentifier;

  TaskFormBack(BuildContext context) {
    var parameter = ModalRoute.of(context).settings.arguments;
    task = (parameter == null) ? Task() : parameter;
  }

  save(BuildContext context) async {
    await _service.save(task);
    Navigator.of(context).pop();
  }

  String validateName(String name) {
    try {
      _service.validadeName(name);
      _nameIsValid = true;
      return null;
    } catch (e) {
      _nameIsValid = false;
      return e.toString();
    }
  }

  String validateDescription(String description) {
    try {
      _service.validateDescription(description);
      _descriptionIsValid = true;
      return null;
    } catch (e) {
      _descriptionIsValid = false;
      return e.toString();
    }
  }

  String validateCustomIdentifier(String customIdentifier) {
    try {
      _service.validateCustomIdentifier(customIdentifier);
      _customIdentifier = true;
      return null;
    } catch (e) {
      _customIdentifier = false;
      return e.toString();
    }
  }
}
