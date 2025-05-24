import 'package:flutter/material.dart';
import 'package:todo_app/models/task_model.dart';

class Tasks extends ChangeNotifier {
  List<TaskModel> _tasks = [];

  List<TaskModel> get getTasks => _tasks;

  void addTask(
    String taskName,
    List<String> subTasks,
    DateTime createdAt,
    String? taskCategory,
    String? detail,
  ) {
    final newTask = TaskModel(
      taskName: taskName,
      createdAt: createdAt,
      taskCategory: taskCategory,
      subTasks: subTasks,
      details: detail,
    );

    _tasks.add(newTask);

    notifyListeners();
  }
}
