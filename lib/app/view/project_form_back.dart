import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sckan_app/app/domain/entities/project.dart';
import 'package:sckan_app/app/domain/services/project_service.dart';

part 'project_form_back.g.dart';

class ProjectFormBack = _ProjectFormBack with _$ProjectFormBack;

abstract class _ProjectFormBack with Store {
  var project;
  var _service = GetIt.I.get<ProjectService>();
  var _nameIsValid = false;
  var _descriptionIsValid = false;
  var _cloneLinkIsValid = false;

  bool get isValid => _nameIsValid && _descriptionIsValid && _cloneLinkIsValid;

  _ProjectFormBack(BuildContext context) {
    var parameter = ModalRoute.of(context)!.settings.arguments;
    project = (parameter == null) ? Project() : parameter;
  }

  save() async {
    await _service.save(project);
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

  String? validateCloneLink(String cloneLink) {
    try {
      _service.validateCloneLink(cloneLink);
      _cloneLinkIsValid = true;
      return null;
    } catch (e) {
      _cloneLinkIsValid = false;
      return e.toString();
    }
  }
}
