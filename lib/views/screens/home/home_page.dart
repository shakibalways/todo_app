import 'package:flutter/material.dart';
import 'package:todo_app/model/todo_item.dart';
import 'package:todo_app/views/screens/home/widget/custom_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      todoList[index].isDone = value ?? false; // Update the completion status
    });
  }
  // floating button press and show alert dialog box
  void view(){
    showDialog(context: context, builder: (BuildContext context){
      return const AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        backgroundColor: Colors.yellow,
        content: SizedBox(

          height: 120,
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder()
                ),
              )
            ],
          ),
        ),
      );
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          view();
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
            ),
          );
        },
      ),
    );
  }
}
