import 'package:hive/hive.dart';
part 'task.g.dart';

@HiveType(typeId: 1)
class TaskAdapter {
  @HiveField(0)
  String name;
  @HiveField(1)
  int isChecked;
  TaskAdapter(this.name, this.isChecked);
}
