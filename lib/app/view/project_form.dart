import 'package:flutter/material.dart';
import 'package:sckan_app/app/view/project_form_back.dart';

class ProjectForm extends StatelessWidget {
  Widget nameField(ProjectFormBack back) {
    return TextFormField(
      initialValue: back.project.name,
      decoration: InputDecoration(
        labelText: 'Name',
      ),
    );
  }

  Widget descriptionField(ProjectFormBack back) {
    return TextFormField(
      initialValue: back.project.description,
      decoration: InputDecoration(
        labelText: 'Description',
      ),
    );
  }

  Widget cloneLinkField(ProjectFormBack back) {
    return TextFormField(
      initialValue: back.project.cloneLink,
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
              descriptionField(_back),
              cloneLinkField(_back),
            ],
          ),
        ),
      ),
    );
  }
}
