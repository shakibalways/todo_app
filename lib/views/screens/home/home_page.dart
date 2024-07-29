import 'package:flutter/material.dart';
import 'package:todo_app/model/todo_item.dart';
import 'package:todo_app/views/screens/home/widget/custom_container.dart';
import 'package:todo_app/views/screens/home/widget/dialog_box.dart';


class HomePage extends StatefulWidget {

  const HomePage({super.key,});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController dialogController =TextEditingController();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      todoList[index].isDone = value ?? false; // Update the completion status
    });
  }
  void task(){
    if(dialogController.text.isNotEmpty){
      setState(() {
        todoList.add(TodoItem(title: dialogController.text));
        dialogController.clear();
      });
    }
   Navigator.of(context).pop();
  }
  //delete task
  void deleteTask(int index){
    setState(() {
      todoList.removeAt(index);

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
                return
                  DialogBox(
                    controller: dialogController, onSave:task, onCancel: () {
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
            padding:  EdgeInsets.all(10),
            child: CustomContainer(
              title: todoList[index].title,
              discreption: todoList[index]
                  .isDone , // You might want to format this to be a string
              onChanged: (value) {
                checkBoxChanged(value, index);
              },
              onPressed:  (context){
                deleteTask(index);

              },
            ),
          );
        },
      ),
    );
  }
}


