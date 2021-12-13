import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:todo_app_flutter/model/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _taskList = [
    Task(taskName: "taskName 1", isDone: false),
    Task(taskName: "taskName 2", isDone: true),
    Task(taskName: "taskName 3", isDone: false),
  ];

  int get taskCount => _taskList.length;

  UnmodifiableListView<Task> get taskList => UnmodifiableListView(_taskList);

  void addTask(String taskName) {
    _taskList.add(Task(taskName: taskName, isDone: false));
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleIsDone();
    notifyListeners();
  }

  void restoreTask(int index, Task task) {
    _taskList.insert(index, task);
    notifyListeners();
  }

  void deleteTask(Task task) {
    _taskList.remove(task);
    notifyListeners();
  }
}
