// @dart=2.9

import 'package:flutter/material.dart';
import 'package:sckan_app/app/view/task_details_back.dart';

class TaskDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _taskDetailsBack = TaskDetailsBack(context);
    var task = _taskDetailsBack.task;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // var width = constraints.biggest.width;
        // var height = constraints.biggest.height;

        return Scaffold(
          body: ListView(
            children: [
              Center(
                child: Text(
                  '#${task.customIdentifier} - ${task.name}',
                  style: TextStyle(fontSize: 40, color: Colors.blueGrey),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Description'),
                  subtitle: Text('${task.description}'),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.arrow_back),
            onPressed: () {
              _taskDetailsBack.goToBack();
            },
          ),
        );
      },
    );
  }
}
