import 'package:flutter/material.dart';
import 'package:sckan_app/app/view/project_form_back.dart';

class ProjectForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  Widget nameField(ProjectFormBack back) {
    return TextFormField(
      initialValue: back.project.name,
      onSaved: (newValue) => back.project.name = newValue,
      validator: (value) => back.validateName(value!),
      decoration: InputDecoration(
        labelText: 'Name',
      ),
    );
  }

  Widget descriptionField(ProjectFormBack back) {
    return TextFormField(
      initialValue: back.project.description,
      onSaved: (newValue) => back.project.description = newValue,
      validator: (value) => back.validateDescription(value!),
      decoration: InputDecoration(
        labelText: 'Description',
      ),
    );
  }

  Widget cloneLinkField(ProjectFormBack back) {
    return TextFormField(
      initialValue: back.project.cloneLink,
      onSaved: (newValue) => back.project.cloneLink,
      validator: (value) => back.validateCloneLink(value!),
      decoration: InputDecoration(
        labelText: 'Clone link',
      ),
    );
  }

  Widget build(BuildContext context) {
    var _back = ProjectFormBack(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('New project'),
        actions: [
          IconButton(
            onPressed: () {
              _form.currentState!.validate();
              _form.currentState!.save();
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
              descriptionField(_back),
              cloneLinkField(_back),
            ],
          ),
        ),
      ),
    );
  }
}
