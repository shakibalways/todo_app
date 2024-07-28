import 'package:flutter/material.dart';

class Compete extends StatefulWidget {
  const Compete({super.key});

  @override
  State<Compete> createState() => _CompeteState();
}

class _CompeteState extends State<Compete> {
  bool isChecked = false;
  void message() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          title: Text(
            "User Accept Your Argument",
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                const Text(
                  "I Have Read The Agrement and i accept it",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
              ],
            ),
            // check box select than confirm button is work 
            Container(
                height: 50,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
                ),
                child: MaterialButton(
                  onPressed: isChecked ? message : null,//
                  child:  Text("Confirm",style: TextStyle(fontWeight: FontWeight.bold),),
                  textColor:Colors.black,
                  color: Colors.deepPurple,
                ))
          ],
        ),
      ),
    );
  }
}
