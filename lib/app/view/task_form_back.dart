import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sckan_app/app/domain/entities/task.dart';
import 'package:sckan_app/app/domain/services/task_service.dart';

part 'task_form_back.g.dart';

class TaskFormBack = _TaskFormBack with _$TaskFormBack;

abstract class _TaskFormBack with Store {
  var task;
  var _service = GetIt.I.get<TaskService>();
  var _nameIsValid = false;
  var _descriptionIsValid = false;
  var _customIdentifier = false;

  bool get isValid => _nameIsValid && _descriptionIsValid && _customIdentifier;

  _TaskFormBack(BuildContext context) {
    var parameter = ModalRoute.of(context)!.settings.arguments;
    task = (parameter == null) ? Task() : parameter;
  }

  save() async {
    await _service.save(task);
  }

  String? validateName(String name) {
    try {
      _service.validadeName(name);
      _nameIsValid = true;
      return null;
    } catch (e) {
      _nameIsValid = false;
      return e.toString();
    }
  }

  String? validateDescription(String description) {
    try {
      _service.validateDescription(description);
      _descriptionIsValid = true;
      return null;
    } catch (e) {
      _descriptionIsValid = false;
      return e.toString();
    }
  }

  String? validateCustomIdentifier(String customIdentifier) {
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
