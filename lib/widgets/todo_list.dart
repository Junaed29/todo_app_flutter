import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_flutter/model/task.dart';
import 'package:todo_app_flutter/provider/task_data.dart';
import 'package:todo_app_flutter/widgets/todo_list_item.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Widget build");
    return Consumer<TaskData>(
      builder: (context, taskData, _) {
        return ListView.builder(
          padding: EdgeInsets.zero,
          itemBuilder: (BuildContext context, int index) {
            Task task = taskData.taskList[index];
            return TodoListItem(
              taskName: task.taskName,
              isChacked: task.isDone,
              taskDoneCallback: (isDone) {
                taskData.updateTask(task);
              },
              onLongPress: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  action: SnackBarAction(
                    onPressed: () {
                      taskData.restoreTask(index, task);
                    },
                    label: 'Undo',
                  ),
                  content: Text("${task.taskName} is removed."),
                ));
                taskData.deleteTask(task);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
