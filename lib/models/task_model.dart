class TaskModel {
  String taskName;
  List<String> subTasks = [];
  DateTime createdAt;
  String? details;
  String? taskCategory;

  TaskModel({
    required this.taskName,
    required this.createdAt,
    this.details,
    required this.taskCategory,
    required this.subTasks,
  });
}
