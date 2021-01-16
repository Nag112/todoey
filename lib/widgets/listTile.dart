import 'package:ToDoey/models/customProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskTile extends StatelessWidget {
  final String name;
  final bool ischecked;
  TaskTile(this.name, this.ischecked);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        name,
        style: TextStyle(decoration: ischecked?TextDecoration.lineThrough:null),
      ),
      trailing: Checkbox(
        value: ischecked,
        onChanged: (bool value) {
          Provider.of<CustomProvider>(context,listen:false).toggleTask(name, value);
        },
        checkColor: Colors.lightBlueAccent,
      ),
    );
  }
}
