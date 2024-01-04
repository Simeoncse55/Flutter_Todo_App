import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

  class ToDoList extends StatelessWidget {

    final String taskName;
    final bool taskCompleted;
    Function(bool?)? onChanged;
    Function(BuildContext)? deleteFunction;

     ToDoList({super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
       required this.deleteFunction
    });

    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.only(left: 15.0 , right: 15.0, top: 20.0, bottom: 8.0),
        child: Slidable(
          endActionPane: ActionPane(
            motion: StretchMotion(),
            children: [
              SlidableAction(onPressed:deleteFunction,
              icon: Icons.delete_rounded, backgroundColor: Colors.red, borderRadius: BorderRadius.circular(18),)
            ],
          ),
          child: Container(

            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  // check box
                 Checkbox(value: taskCompleted, onChanged: onChanged,
                   checkColor: Colors.amber.shade300,
                   activeColor: Colors.green,
                 ),

                  //  task name
                  Flexible(
                    child: Text(taskName,style: TextStyle(

                      decoration: taskCompleted? TextDecoration.lineThrough : TextDecoration.none,
                      fontWeight: FontWeight.bold,fontSize: 12,
                    ),),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(color: Colors.amber.shade300, borderRadius: BorderRadius.circular(12)),

          ),
        ),
      );
    }


  }
