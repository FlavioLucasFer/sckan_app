import 'package:flutter/material.dart';
import 'package:sckan_app/app/view/project_details_back.dart';

class ProjectDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _projectDetailsBack = ProjectDetailsBack(context);
    var project = _projectDetailsBack.project;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // var width = constraints.biggest.width;
        // var height = constraints.biggest.height;

        return Scaffold(
          body: ListView(
            children: [
              Center(
                child: Text(
                  '${project.name}',
                  style: TextStyle(fontSize: 40, color: Colors.blueGrey),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Description'),
                  subtitle: Text('${project.description}'),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Clone link'),
                  subtitle: Text('${project.cloneLink}'),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.arrow_back),
            onPressed: () {
              _projectDetailsBack.goToBack();
            },
          ),
        );
      },
    );
  }
}
