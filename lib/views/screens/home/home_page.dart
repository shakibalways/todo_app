import 'package:flutter/material.dart';
import 'package:todo_app/views/screens/home/widget/custom_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List todoList =[
    'Yes It is work',false,
    'No It is Not Work',false,
  ];
  void checkBoxChanged(bool value, int index){
    

  }

  @override
  Widget build(BuildContext context) {
    bool value =true;
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
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (c,i){
          return CustomContainer(
            title: todoList[i],
            value: todoList[i],
            onChanged: (v){
            },
          );
        },

      ),
    );
  }
}
