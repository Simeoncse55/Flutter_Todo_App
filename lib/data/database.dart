

   import 'package:hive_flutter/adapters.dart';

class TodoDatabase{

  List toDoList=[];

  // reference the box
     final _mybox =Hive.box('mybox');

     // run this method, if this app 1st time opening
   void createInitialData(){
     toDoList=[

     ];
   }
     // load the data from db
        void loadData(){
          toDoList = _mybox.get('TODOLIST');
        }

        // update the database
      void updateDb(){

         _mybox.put('TODOLIST', toDoList);

      }

   }