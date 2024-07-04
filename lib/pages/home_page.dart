import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todolist/data/database.dart';
import 'package:todolist/util/dialogue_box.dart';
import '../util/todo_tile.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
    
  }

class _HomePageState extends State<HomePage>{

  //reference the hive box
  final _mybox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();


  @override
  void initState() {

    //if this is the first time ever opening the app, then create default app
    if(_mybox.get("TODOLIST")==null){

      db.createInitialData();
    }
    else{
      //user already opened
      db.loadData();
    }


    super.initState();
  }


  //text controller
  final _controller = TextEditingController();

 

//checkbox tappped
void checkBoxChanged(bool? value, int index){
  setState(() {
    db.toDoList[index][1]= !db.toDoList[index][1];
  });
  db.updateDatebase();
}

//save new task

void saveNewTask(){
  setState(() {
    db.toDoList.add([_controller.text,false]);
    _controller.clear();
  });
  Navigator.of(context).pop();
  db.updateDatebase();
}

//create a new task
void createNewTask(){
  showDialog(
    context: context,
    builder: (context){
      return DialogueBox(
        controller: _controller,
        onSave: saveNewTask,
        onCancel: ()=> Navigator.of(context).pop(),
      );
    },
  );
}

//delete task
void deleteTask(int index){
  setState(() {
    db.toDoList.removeAt(index);
  });
  db.updateDatebase();
}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[50],
      appBar: AppBar( 
        backgroundColor: Colors.yellow[300],
        title: Text(
          'To Do List',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
        backgroundColor: Colors.yellow[400],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
         return ToDoTile(
          taskname: db.toDoList [index][0],
          taskCompleted: db.toDoList [index] [1], 
          onChanged: (value) => checkBoxChanged(value,index),
          deleteFunction: (context)=> deleteTask(index), 
          );
        },
      ),
    );
  }
}
