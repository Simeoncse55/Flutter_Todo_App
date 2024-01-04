import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'todolist.dart';
import 'dialog.dart';
import 'button.dart';
import 'data/database.dart';
 class ToDo extends StatefulWidget {
   const ToDo({super.key});

   @override
   State<ToDo> createState() => _ToDoState();
 }

 class _ToDoState extends State<ToDo> {

   // reference the hive box
   final _mybox =Hive.box('mybox');
   TodoDatabase db = TodoDatabase();


   @override
  void initState() {

     // first time ever opening app , then create a default data
    // TODO: implement initState
     if(_mybox.get('TODOLIST') == null){
       db.createInitialData();

     } else {
       // there already exits the data
       db.loadData();
     }

    super.initState();
  }


   // text controller
   final _controller =TextEditingController();



   // check box was changed
   void checkBoxChanged(bool? value, int index){
     setState(() {

       db.toDoList[index][1] = !db.toDoList[index][1];

     });
     db.updateDb();
   }

   // save a new task

   saveNewTask(){
     setState(() {
            db.toDoList.add([_controller.text, false]);
            _controller.clear();
     });
     Navigator.of(context).pop();
     db.updateDb();
   }


   // create a new task
    void createNewTask(){
     showDialog(
         context: context,
         builder: (context){
           return
             DialogBox(
               controller:_controller ,
               onSave: saveNewTask,
               onCancel: ()=>Navigator.of(context).pop(),
             );

         });
    }

      // deete the task
    void deleteTask(int index){

     setState(() {
       db.toDoList.removeAt(index);
     });
     db.updateDb();

    }



   @override
   Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Colors.yellow.shade200,
       appBar:

       AppBar(

         shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25)
          )
         ),
         elevation: 0,
         backgroundColor: Colors.amber.shade300,
         title: const Center(

             child: Text('TO DO' , style: TextStyle(
           color: Colors.black, fontSize: 26,fontWeight: FontWeight.bold
         ),)),
       ),

     floatingActionButton: Padding(
       padding: const EdgeInsets.only(bottom: 25.0),
       child: FloatingActionButton.extended(
         label: const Text('New Task' ,style: TextStyle(color: Colors.black87)),

         elevation: 6,
         backgroundColor: Colors.amber.shade300,

         onPressed: createNewTask,

       icon: const Icon(Icons.add_rounded,color: Colors.black87,),

       ),
     ),


       body: ListView.builder(
         itemCount: db.toDoList.length,
           itemBuilder: (context , index){

           return ToDoList(
               taskName: db.toDoList[index][0],
               taskCompleted: db.toDoList[index][1],
               onChanged: (value)=> checkBoxChanged(value,index),
             deleteFunction: (context)=> deleteTask(index),
           );


           }
       ),

     );
   }
 }
