import 'package:flutter/material.dart';

class TodoListItem extends StatelessWidget {
  final String taskName;
  final bool isChacked;
  final Function(bool?)? taskDoneCallback;
  void Function()? onLongPress;

  TodoListItem(
      {required this.taskName,
      required this.isChacked,
      required this.taskDoneCallback,
      required this.onLongPress});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onLongPress,
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
