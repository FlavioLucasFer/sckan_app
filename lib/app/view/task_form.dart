// @dart=2.9

import 'package:flutter/material.dart';
import 'package:sckan_app/app/view/task_form_back.dart';

class TaskForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  Widget nameField(TaskFormBack back) {
    return TextFormField(
      initialValue: back.task.name,
      onSaved: (newValue) => back.task.name = newValue,
      validator: (value) => back.validateName(value),
      decoration: InputDecoration(
        labelText: 'Name',
      ),
    );
  }

  Widget customIdentifierField(TaskFormBack back) {
    return TextFormField(
      initialValue: back.task.customIdentifier,
      onSaved: (newValue) => back.task.customIdentifier = newValue,
      validator: (value) => back.validateCustomIdentifier(value),
      decoration: InputDecoration(
        labelText: 'Custom identifier',
      ),
    );
  }

  Widget descriptionField(TaskFormBack back) {
    return TextFormField(
      initialValue: back.task.description,
      onSaved: (newValue) => back.task.description = newValue,
      validator: (value) => back.validateDescription(value),
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
            onPressed: () {
              _form.currentState.validate();
              _form.currentState.save();
              if (_back.isValid) {
                _back.save();
                Navigator.of(context).pop();
              }
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _form,
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
