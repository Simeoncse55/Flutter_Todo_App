import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'todo.dart';
  void main() async {

    //init the Hive
    await Hive.initFlutter();

    // open a box
     var box = await Hive.openBox('mybox');


    runApp(const MyApp());
  }
  class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
      return const MaterialApp(

        debugShowCheckedModeBanner: false,
        home: ToDo(),

      );
    }
  }
