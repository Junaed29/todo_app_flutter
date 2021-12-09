import 'package:flutter/material.dart';

class TodoListItem extends StatelessWidget {
  String taskName = "";
  bool isChacked = false;
  Function(bool?)? taskDoneCallback;

  TodoListItem(
      {required this.taskName,
      required this.isChacked,
      required this.taskDoneCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        taskName,
        style: TextStyle(
          decoration:
              isChacked ? TextDecoration.lineThrough : TextDecoration.none,
          color: Colors.black,
          fontSize: 20,
        ),
      ),
      trailing: Checkbox(
        value: isChacked,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        side: const BorderSide(color: Colors.black, width: 2.5),
        onChanged: (newValue) {
          taskDoneCallback!(newValue);
        },
      ),
    );
  }
}
