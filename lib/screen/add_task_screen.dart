import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  String taskName = "";
  final void Function(String taskName) taskCreatedCallback;

  AddTaskScreen({required this.taskCreatedCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "Add Task",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.lightBlueAccent, fontSize: 30),
          ),
          TextField(
            onChanged: (value) {
              taskName = value;
            },
            autofocus: true,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              isDense: true,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          MaterialButton(
            onPressed: () {
              taskCreatedCallback(taskName);
            },
            color: Colors.lightBlueAccent,
            child: const Text(
              "Add",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          )
        ],
      ),
    );
  }
}
