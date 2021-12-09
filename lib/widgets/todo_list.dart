import 'package:flutter/material.dart';
import 'package:todo_app_flutter/model/task.dart';
import 'package:todo_app_flutter/widgets/todo_list_item.dart';

class TodoList extends StatelessWidget {
  final List<Task> taskList;
  final void Function(int) taskIndex;
  TodoList({required this.taskList, required this.taskIndex});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder: (BuildContext context, int index) {
        return TodoListItem(
          taskName: taskList[index].taskName,
          isChacked: taskList[index].isDone,
          taskDoneCallback: (isDone) {
            taskIndex(index);
          },
        );
      },
      itemCount: taskList.length,
    );
  }
}
