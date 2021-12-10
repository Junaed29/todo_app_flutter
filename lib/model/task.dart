import 'dart:convert';

class Task {
  String taskName;
  bool isDone;

  Task({required this.taskName, required this.isDone});

  void toggleIsDone() {
    isDone = !isDone;
  }

  //For Shared preference
  factory Task.fromJson(Map<String, dynamic> jsonData) {
    return Task(
      taskName: jsonData['taskName'],
      isDone: jsonData['isDone'],
    );
  }

  //For Shared preference
  static Map<String, dynamic> toMap(Task task) => {
        'taskName': task.taskName,
        'isDone': task.isDone,
      };

  //For Shared preference
  static String encode(List<Task> taskList) => json.encode(
        taskList.map<Map<String, dynamic>>((task) => Task.toMap(task)).toList(),
      );

  //For Shared preference
  static List<Task> decode(String taskList) =>
      (json.decode(taskList) as List<dynamic>)
          .map<Task>((task) => Task.fromJson(task))
          .toList();
}
