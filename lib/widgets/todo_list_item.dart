import 'package:flutter/material.dart';

class TodoListItem extends StatefulWidget {
  @override
  State<TodoListItem> createState() => _TodoListItemState();
}

class _TodoListItemState extends State<TodoListItem> {
  bool isChacked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        "Buy milk",
        style: TextStyle(
          decoration:
              isChacked ? TextDecoration.lineThrough : TextDecoration.none,
          color: Colors.black,
          fontSize: 20,
        ),
      ),
      trailing: TodoCheckBox(
        isChanged: isChacked,
        isChangedCallback: (isChanged) {
          setState(() {
            isChacked = isChanged!;
          });
        },
      ),
    );
  }
}

class TodoCheckBox extends StatelessWidget {
  bool isChanged = false;
  Function(bool?)? isChangedCallback;

  TodoCheckBox({required this.isChanged, required this.isChangedCallback});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChanged,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      side: const BorderSide(color: Colors.black, width: 2.5),
      onChanged: isChangedCallback,
    );
  }
}
