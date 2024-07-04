import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase{

  List toDoList = [];


  //reference our box
  final _mybox = Hive.box('mybox');


  //reun this method if this is the 1st time ever opening this app
  void createInitialData(){

    toDoList=[
       ["Make Tutorial",false],
       ["Do Exercise",false],

    ];
  }

  //load data from database
  void loadData(){

    toDoList = _mybox.get("TODOLIST");

  }


  //update the database
  void updateDatebase(){

    _mybox.put("TODOLIST", toDoList);

  }

}