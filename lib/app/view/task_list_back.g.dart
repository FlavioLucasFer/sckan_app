// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.9

part of 'task_list_back.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TaskListBack on _TaskListBack, Store {
  final _$listAtom = Atom(name: '_TaskListBack.list');

  @override
  Future<List<Task>> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(Future<List<Task>> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$_TaskListBackActionController =
      ActionController(name: '_TaskListBack');

  @override
  dynamic refreshList([dynamic value]) {
    final _$actionInfo = _$_TaskListBackActionController.startAction(
        name: '_TaskListBack.refreshList');
    try {
      return super.refreshList(value);
    } finally {
      _$_TaskListBackActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}
