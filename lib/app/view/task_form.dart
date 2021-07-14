import 'package:flutter/material.dart';
import 'package:sckan_app/app/view/task_form_back.dart';

class TaskForm extends StatelessWidget {
  Widget nameField(TaskFormBack back) {
    return TextFormField(
      initialValue: back.task.name,
      decoration: InputDecoration(
        labelText: 'Name',
      ),
    );
  }

  Widget customIdentifierField(TaskFormBack back) {
    return TextFormField(
      initialValue: back.task.customIdentifier,
      decoration: InputDecoration(
        labelText: 'Custom identifier',
      ),
    );
  }

  Widget descriptionField(TaskFormBack back) {
    return TextFormField(
      initialValue: back.task.description,
      decoration: InputDecoration(
        labelText: 'Description',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _back = TaskFormBack(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('New task'),
        actions: [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          child: Column(
            children: [
              nameField(_back),
              customIdentifierField(_back),
              descriptionField(_back),
            ],
          ),
        ),
      ),
    );
  }
}
