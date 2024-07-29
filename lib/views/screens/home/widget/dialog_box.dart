
import 'package:flutter/material.dart';

import 'my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
 final VoidCallback onSave;
 final VoidCallback onCancel;
   DialogBox({
    super.key,this.controller, required this.onSave, required this.onCancel,
  });



  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      backgroundColor: Colors.yellow,
      content: Container(
        height: 120,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'Add a new task',
                  border: OutlineInputBorder()
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //save button
                MyButton(text: 'Save', onPressed: onSave),

                //cancel button
                MyButton(text: 'Cancel', onPressed: onCancel),

              ],
            )
          ],
        ),
      ),
    );
  }
}