import 'package:flutter/material.dart';
import 'package:todoapp/button.dart';

  class DialogBox extends StatelessWidget {

    final controller;
    VoidCallback onSave;
    VoidCallback onCancel;

    DialogBox({super.key,
    required this.controller,
     required this.onSave, required this.onCancel,
    });

    @override
    Widget build(BuildContext context) {
      return AlertDialog(

        backgroundColor:  Colors.amber.shade300  ,
        content: Container(

          height: 200,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(

                cursorColor: Colors.black,
              style: TextStyle(color:(Colors.black87)),
                controller: controller,

                decoration: const InputDecoration(
                    enabledBorder:OutlineInputBorder(
                       borderSide: BorderSide( width: 2, color: Colors.black87)
                    ),

                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.black87),
                  ),


                  labelText: "Add a New Task",
                  labelStyle: (TextStyle(color: Colors.black87))

                ),
              ),

              Row(

                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // save button
                  MyButton(text: 'Cancel', onPressed:onCancel),

                 const  SizedBox(
                    width: 20,
                  ),
                  // cancel button

                  MyButton(text: 'Save', onPressed:onSave),
                ],
              )
            ],
          ),
        ),

      );
    }
  }
