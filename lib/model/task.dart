class Task {
  String taskName;
  bool isDone;

  Task({required this.taskName, required this.isDone});

  void toggleIsDone() {
    isDone = !isDone;
  }
}
