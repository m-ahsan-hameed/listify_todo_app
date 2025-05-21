import 'package:todo_app/models/sub_task.dart';

class TaskModel {
  String id;
  String taskName;
  List<SubTask> subTasks;
  DateTime createdAt;
  String? details;
  String? taskCategory;

  TaskModel({
    required this.id,
    required this.taskName,
    required this.createdAt,
    this.details,
    this.taskCategory,
    required this.subTasks,
  });

  TaskModel.empty()
    : id = '',
      taskName = '',
      details = '',
      taskCategory = '',
      subTasks = [],
      createdAt = DateTime.now();
}
