import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/utils/dialogbox.dart';
import 'package:todo/utils/todotile.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  final _controller = TextEditingController();
  final _taskDatabase = Hive.box('mybox');
  List taskList = [];

  @override
  void initState() {
    super.initState();
    if (_taskDatabase.get("dbTaskList") == null) {
      taskList = [
        ['Your Task Goes Here', false],
        ['Slide to left to delete', false],
        ['Get set go', false]
      ];
    } else {
      fetchData();
    }
  }

  void fetchData() {
    taskList = _taskDatabase.get("dbTaskList");
  }

  void updateData() {
    _taskDatabase.put("dbTaskList", taskList);
  }

  void checkBoxTapped(bool? value, int index) {
    setState(() {
      taskList[index][1] = !taskList[index][1];
      taskList.add(taskList[index]);
      taskList.removeAt(index);
    });
    updateData();
  }

  void createNew() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            onSave: saveTask,
            onCancel: cancelTask,
            controller: _controller,
          );
        });
  }

  void saveTask() {
    setState(() {
      taskList.add([_controller.text, false]);
      _controller.clear();
    });
    updateData();
    Navigator.of(context).pop();
  }

  void cancelTask() {
    Navigator.of(context).pop();
  }

  void deleteTask(int index) {
    setState(() {
      taskList.removeAt(index);
    });
    updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        title: const Center(child: Text("Dodo")),
        backgroundColor: Colors.amber[200],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber[300],
        onPressed: createNew,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: taskList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: taskList[index][0],
              taskStatus: taskList[index][1],
              onChanged: (value) => checkBoxTapped(value, index),
              deleteTask: (context) => deleteTask(index),
            );
          }),
    );
  }
}
