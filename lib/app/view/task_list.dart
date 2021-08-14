// @dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sckan_app/app/domain/entities/task.dart';
import 'package:sckan_app/app/view/task_list_back.dart';
import 'package:url_launcher/url_launcher.dart';

class TaskList extends StatelessWidget {
  final _taskListBack = TaskListBack();

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
            title: Text("Delete task"),
            content: Text("Are you sure you want to delete this task?"),
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
        title: Text('Your tasks'),
        actions: [
          IconButton(
            onPressed: () {
              _taskListBack.goToForm(context);
            },
            icon: Icon(Icons.add),
          ),
          IconButton(
            onPressed: () async {
              await canLaunch('tel:999999999')
                  ? await launch('tel:999999999')
                  : showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Alert!'),
                          content: Text('Compatible App not found.'),
                        );
                      });
            },
            icon: Icon(Icons.phone),
          ),
        ],
      ),
      body: Observer(builder: (context) {
        return FutureBuilder(
          future: _taskListBack.list,
          builder: (context, future) {
            if (!future.hasData)
              return CircularProgressIndicator();
            else {
              List<Task> tasks = future.data as List<Task>;

              return ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, i) {
                    var task = tasks[i];
                    return ListTile(
                      title: Text(task.name),
                      subtitle: Text(task.description),
                      onTap: () {
                        _taskListBack.goToDetails(context, task);
                      },
                      trailing: Container(
                        width: 100,
                        child: Row(
                          children: [
                            editButton(() {
                              _taskListBack.goToForm(context, task);
                            }),
                            removeButton(context, () {
                              _taskListBack.remove(task.id);
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
