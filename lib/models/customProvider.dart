import 'package:ToDoey/models/task.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

class Task {
  Task(this.name, this.isChecked);
  String name;
  int isChecked;
}

class CustomProvider with ChangeNotifier {
  List<Task> _tasks = [];
  CustomProvider() {
    print('getting dtaa from device');
    Box box = Hive.box('todo');
    box.keys.forEach((key) {
      TaskAdapter tsk = box.get(key);
      print(tsk.name);
      if (!_tasks.contains(tsk.name)) {
        _tasks.add(new Task(tsk.name, tsk.isChecked));
      }
    });
  }

  List<Task> get getTasks {
    return _tasks;
  }

  int get taskCount {
    if (_tasks.length == null) {
      return 0;
    } else {
      return _tasks.length;
    }
  }

  void addTask(String name) async {
    if (!_tasks.contains(name)) {
      _tasks.add(Task(name, 0));
      notifyListeners();
      Box box = Hive.box('todo');
      box.put(name, TaskAdapter(name, 0));
    }
  }

  void toggleTask(String name, bool isChecked) {
    _tasks.forEach((task) {
      if (task.name == name) {
        if (isChecked) {
          task.isChecked = 1;
        } else {
          task.isChecked = 0;
        }
      }
    });
    notifyListeners();
  }
}
