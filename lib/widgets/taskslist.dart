import 'package:flutter/material.dart';
import 'package:ToDoey/widgets/listTile.dart';
import 'package:provider/provider.dart';
import 'package:ToDoey/models/customProvider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CustomProvider>(
      
      builder: (context, customProvider, child) {
        
        return ListView.builder(
          itemBuilder: (context, index) => TaskTile(
              customProvider.getTasks[index].name,
              customProvider.getTasks[index].isChecked == 1),
          itemCount: customProvider.taskCount,
        );
      },
    );
  }
}
