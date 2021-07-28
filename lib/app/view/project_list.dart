import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sckan_app/app/domain/entities/project.dart';
import 'package:sckan_app/app/view/project_list_back.dart';

class ProjectList extends StatelessWidget {
  final _projectListBack = ProjectListBack();

  Widget editButton(Function onPressed) {
    return IconButton(
      onPressed: onPressed(),
      icon: Icon(Icons.edit),
      color: Colors.lightBlue,
    );
  }

  Widget removeButton(BuildContext context, Function remove) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Delete project"),
            content: Text("Are you sure you want to delete this project?"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("No")),
              TextButton(
                  onPressed: () {
                    remove();
                  },
                  child: Text("Yes")),
            ],
          ),
        );
      },
      icon: Icon(Icons.delete),
      color: Colors.red,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your projects'),
        actions: [
          IconButton(
            onPressed: () {
              _projectListBack.goToForm(context);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Observer(builder: (context) {
        return FutureBuilder(
          future: _projectListBack.list,
          builder: (context, future) {
            if (!future.hasData)
              return CircularProgressIndicator();
            else {
              List<Project> projects = future.data as List<Project>;

              return ListView.builder(
                  itemCount: projects.length,
                  itemBuilder: (context, i) {
                    var project = projects[i];
                    return ListTile(
                      title: Text(project.name),
                      subtitle: Text(project.description),
                      onTap: () {
                        _projectListBack.goToDetails(context, project);
                      },
                      trailing: Container(
                        width: 100,
                        child: Row(
                          children: [
                            editButton(() {
                              _projectListBack.goToForm(context, project);
                            }),
                            removeButton(context, () {
                              _projectListBack.remove(project.id);
                              Navigator.of(context).pop();
                            })
                          ],
                        ),
                      ),
                    );
                  });
            }
          },
        );
      }),
    );
  }
}
