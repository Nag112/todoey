import 'package:flutter/material.dart';
import 'package:ToDoey/widgets/taskslist.dart';
import 'package:ToDoey/screens/addTask.dart';
import 'package:provider/provider.dart';
import 'package:ToDoey/models/customProvider.dart';

class Tasks extends StatefulWidget {
  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        children: [
          Container(
            alignment: Alignment(-1.0, 0.0),
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.only(top: 50.0, left: 25.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  child: Icon(Icons.list),
                  backgroundColor: Colors.white,
                ),
                Text(
                  'To-do',
                  style: TextStyle(
                      fontFamily: 'IndieFlower',
                      color: Colors.white,
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '${Provider.of<CustomProvider>(context).taskCount} tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: TasksList(),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context, builder: (context) => AddTask());
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.lightBlueAccent,
      ),
    );
  }
}
