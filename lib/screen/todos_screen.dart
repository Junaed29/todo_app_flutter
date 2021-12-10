import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app_flutter/model/task.dart';
import 'package:todo_app_flutter/widgets/todo_list.dart';

import 'add_task_screen.dart';

class TodosScreen extends StatefulWidget {
  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  List<Task> taskList = [];
  late final SharedPreferences prefs;

  @override
  void initState() {
    asyncMethod();
    super.initState();
  }

  //To initialize the SharedPreferences
  void asyncMethod() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void dispose() {
    print("dispose");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: const Color(0x00FFFFFF),
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskScreen(taskCreatedCallback: (taskName) {
                  Navigator.of(context).pop(); // To Close the ModalBottomSheet

                  setState(() {
                    taskList.add(Task(taskName: taskName, isDone: false));
                  });
                }),
              ),
            ),
          );
        },
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(Icons.add),
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 70, left: 30, right: 30, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 30,
                  child: Icon(
                    Icons.list,
                    size: 40,
                    color: Colors.lightBlueAccent,
                  ),
                  backgroundColor: Colors.white,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Todoey",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w900),
                ),
                Text(
                  "${taskList.length} Tasks",
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: TodoList(
                taskList: taskList,
                taskIndex: (index) {
                  setState(() {
                    taskList[index].toggleIsDone();
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
