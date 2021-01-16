import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ToDoey/models/customProvider.dart';

class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
      String newTaskText;
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xff755A1C),
        child: Container(
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Add Task',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.lightBlueAccent,
                        fontSize: 30,
                        fontFamily: 'IndieFlower'),
                  ),
                  TextField(
                    autofocus: false,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      newTaskText = value;
                    },
                  ),
                  RaisedButton.icon(
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Provider.of<CustomProvider>(context, listen: false)
                          .addTask(newTaskText);
                      Navigator.pop(context);
                    },
                    label: Text('Add Task',
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'IndieFlower')),
                    color: Colors.lightBlueAccent,
                  )
                ])));
  }
}
