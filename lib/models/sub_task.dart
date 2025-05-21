class SubTask {
  String id;
  String subTaskName;
  bool isCompleted;
  SubTask({
    required this.id,
    required this.subTaskName,
    this.isCompleted = false,
  });
}
