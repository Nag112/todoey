import 'dart:io';

import 'package:ToDoey/models/task.dart';
import 'package:flutter/material.dart';

import 'package:ToDoey/screens/tasks.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:ToDoey/models/customProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Directory docDir = await getApplicationDocumentsDirectory();
  Hive
    ..init(docDir.path)
    ..registerAdapter(TaskAdapterAdapter());
  await Hive.openBox('todo');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CustomProvider(),
        child: MaterialApp(home: Tasks()));
  }
}
