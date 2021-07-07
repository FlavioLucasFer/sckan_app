import 'package:get_it/get_it.dart';
import 'package:sckan_app/app/domain/entities/task.dart';
import 'package:sckan_app/app/domain/exception/domain_layer_exception.dart';
import 'package:sckan_app/app/domain/interfaces/task_dao.dart';

class TaskService {
  var _dao = GetIt.I.get<TaskDAO>();

  save(Task task) {
    this._dao.save(task);
  }

  remove(int id) {
    this._dao.remove(id);
  }

  find() {
    this._dao.find();
  }

  validadeName(String name) {
    var max = 255;

    if (name == null) {
      throw DomainLayerException('Name is mandatory');
    } else if (name.length > max) {
      throw DomainLayerException('Maximum characters exceeded');
    }
  }

  validateDescription(String description) {
    var max = 500;

    if (description.length > max) {
      throw DomainLayerException('Maximum characters exceeded');
    }
  }

  validateCloneLink(String cloneLink) {
    var max = 255;

    if (cloneLink.length > max) {
      throw DomainLayerException('Maximum characters exceeded');
    }
  }
}
