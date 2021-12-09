import 'package:flutter/material.dart';
import 'package:todo_app_flutter/model/task.dart';
import 'package:todo_app_flutter/widgets/todo_list_item.dart';

class TodoList extends StatefulWidget {
  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<Task> taskList = [
    Task(taskName: "Task 1", isDone: false),
    Task(taskName: "Task 2", isDone: false),
    Task(taskName: "Task 3", isDone: false),
    Task(taskName: "Task 4", isDone: false),
    Task(taskName: "Task 5", isDone: false),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder: (BuildContext context, int index) {
        return TodoListItem(
          taskName: taskList[index].taskName,
          isChacked: taskList[index].isDone,
          taskDoneCallback: (isDone) {
            setState(() {
              taskList[index].toggleIsDone();
            });
          },
        );
      },
      itemCount: taskList.length,
    );
  }
}
