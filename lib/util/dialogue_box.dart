import 'package:flutter/material.dart';
import 'package:todolist/util/my_button.dart';

// ignore: must_be_immutable
class DialogueBox extends StatelessWidget {

  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogueBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
    });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)
      ),
      backgroundColor: Colors.yellow[100],
      content: Container(height: 170,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        //get user input
        TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Add a new Task",
          ),
        ),

        //buttons -> save + cancel
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          //save button
          MyButton(text: "Save", onPressed: onSave),

          const SizedBox(width: 20),
          //cancel button
          MyButton(text: "Cancel", onPressed: onCancel)
        ],) 
      ],
      ),
      ),
    );
  }
}