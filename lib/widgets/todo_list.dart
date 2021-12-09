import 'package:flutter/material.dart';
import 'package:todo_app_flutter/widgets/todo_list_item.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        TodoListItem(),
        TodoListItem(),
        TodoListItem(),
        TodoListItem(),
        TodoListItem(),
        TodoListItem(),
        TodoListItem(),
        TodoListItem(),
        TodoListItem(),
        TodoListItem(),
        TodoListItem(),
        TodoListItem(),
        TodoListItem(),
        TodoListItem(),
        TodoListItem(),
      ],
    );
  }
}
