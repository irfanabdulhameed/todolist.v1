import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


// ignore: must_be_immutable
class ToDoTile extends StatelessWidget {
  final String taskname;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile({
    super.key,
    required this.taskname,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
    });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left:25, right: 25, top: 25),
//         child: Slidable(
//           endActionPane: ActionPane(
//             motion: StretchMotion(),
//             children: [
//               SlidableAction(
//                 onPressed: deleteFunction,
//                 icon: Icons.delete,
//                 backgroundColor: Colors.red,
//                 borderRadius: BorderRadius.circular(100),
//               )
//           ],
//         ),
//         child: Container(
//           padding: EdgeInsets.all(24.0),
//           decoration: BoxDecoration(
//             color: Colors.yellow[300],
//             borderRadius: BorderRadius.circular(12),
//             ),
//           child: Row(
//             children: [
//               //checkbox
//               Checkbox(
//                 value: taskCompleted,
//                 onChanged: onChanged,
//                 activeColor: Colors.red[500],
//               ),
        
//               //task name
//               Text(
//                 taskname,
//                 style: TextStyle(decoration: taskCompleted? TextDecoration.lineThrough: TextDecoration.none),
//                 ),
//             ],
//            )
//           ),
//       ),
//       );
//   }
// }
@override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              label: 'Delete',
              borderRadius: BorderRadius.circular(100),
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            color: Colors.yellow[300],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              // Checkbox
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.red[500],
              ),
              // Task name
              Text(
                taskname,
                style: TextStyle(
                  decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
        body: ListView(
          children: [
            ToDoTile(
              taskCompleted: false,
              taskname: 'Task 1',
              deleteFunction: (context) {
                // Add your delete function logic here
              },
              onChanged: (value) {
                // Handle checkbox state change
              },
            ),
          ],
        ),
      ),
    );
  }
}