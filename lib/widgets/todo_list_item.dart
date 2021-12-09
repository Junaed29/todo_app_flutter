import 'package:flutter/material.dart';

class TodoListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Text(
        "Buy milk",
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
      ),
      trailing: Checkbox(
        value: false,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        side: const BorderSide(color: Colors.black, width: 2.5),
        onChanged: (value) {},
      ),
    );
  }
}
