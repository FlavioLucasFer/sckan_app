import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:sckan_app/app/domain/entities/project.dart';

part 'project_form_back.g.dart';

class ProjectFormBack = _ProjectFormBack with _$ProjectFormBack;

abstract class _ProjectFormBack with Store {
  var project;

  _ProjectFormBack(BuildContext context) {
    var parameter = ModalRoute.of(context)!.settings.arguments;
    project = (parameter == null) ? Project() : parameter;
  }
}
