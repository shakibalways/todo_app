import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/model/todo_item.dart';
import 'package:todo_app/views/screens/home/widget/custom_container.dart';
import 'package:todo_app/views/screens/home/widget/dialog_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  TextEditingController dialogController = TextEditingController();
  List<TodoItem> todoList = [];
  @override
  void initState() {
    super.initState();
    // Load the saved tasks when the app starts
    loadTodoList();
  }
  Future<void> loadTodoList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? todoListString = prefs.getString('todoList');

    if (todoListString != null) {
      List<dynamic> jsonData = json.decode(todoListString);
      todoList = jsonData.map((item) => TodoItem.fromJson(item)).toList();
    }
    setState(() {});
  }
  Future<void> saveTodoList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String todoListString = json.encode(todoList.map((item) => item.toJson()).toList());
    await prefs.setString('todoList', todoListString);
  }
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      todoList[index].isDone = value ?? false; // Update the completion status
    });
  }

  void task() {
    if (dialogController.text.isNotEmpty) {
      setState(() {
        todoList.add(TodoItem(title: dialogController.text));
        dialogController.clear();
        saveTodoList();
      });
    }
    Navigator.of(context).pop();
  }

  //delete task
  void deleteTask(int index) {
    setState(() {
      todoList.removeAt(index);
      saveTodoList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'TO DO',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
        ),
        centerTitle: true,
      ),
      // floating button press and show alert dialog box
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return DialogBox(
                  controller: dialogController,
                  onSave: task,
                  onCancel: () {
                    Navigator.of(context).pop();
                  },
                );
              });
        },
        child: const Icon(
          Icons.add,
          size: 40,
          color: Colors.deepPurple,
        ),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: CustomContainer(
              title: todoList[index].title,
              discreption: todoList[index]
                  .isDone, // You might want to format this to be a string
              onChanged: (value) {
                checkBoxChanged(value, index);
              },
              onPressed: (context) {
                deleteTask(index);
              },
            ),
          );
        },
      ),
    );
  }
}
