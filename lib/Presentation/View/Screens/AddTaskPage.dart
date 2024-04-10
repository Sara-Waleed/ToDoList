// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:todolist/Domain/models/Task_Model.dart';
// import '../../../Data/task_cubit.dart';
// import '../Shared_Widgets/TodoInputFields.dart';
//
// class AddTask extends StatelessWidget {
//   const AddTask({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//
//       appBar: AppBar(
//         backgroundColor: Colors.white70,
//         automaticallyImplyLeading: true,
//         elevation: 0.0,
//         leading: GestureDetector(
//             onTap: (){
//               Navigator.pop(context);
//             },
//             child: Icon(Icons.arrow_back_ios_outlined,color: Colors.black,)),
//         title: Text("Add Task",style: TextStyle(
//             color: Colors.blue
//         ),),
//         //centerTitle: true,
//
//       ),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           //  mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TodoInputFields(),
//             ),
//             SizedBox(height: 20,),
//             // Container(
//             //   height: 50,
//             //   width: 300,
//             //   child: Center(child: Text("Create",style: TextStyle(
//             //     color: Colors.white,
//             //     //   fontWeight: FontWeight.bold,
//             //     fontSize: 25,
//             //   ),)),
//             //   decoration: BoxDecoration(
//             //     color: Colors.blue,
//             //     borderRadius: BorderRadius.circular(20),
//             //   ),
//             // ),
//             ElevatedButton(
//               onPressed: () {
//                 // Create a new Task object with the provided data
//                 Task newTask = Task(
//                   content: 'Sample Task', // Retrieve title from TodoInputFields
//                   date: DateTime.now(), // Retrieve date from TodoInputFields
//                   priority: 'High', // Retrieve priority from TodoInputFields
//                 );
//
//                 // Save the Task locally
//                 saveTask(newTask);
//
//                 // Navigate back to the previous screen
//                 Navigator.pop(context);
//               },
//               child: Text("Create"),
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
//   Future<void> saveTask(Task task) async {
//     final prefs = await SharedPreferences.getInstance();
//     final taskList = prefs.getStringList('tasks') ?? [];
//     taskList.add(json.encode(task.toMap()));
//     prefs.setStringList('tasks', taskList);
//   }
//   // Future<void> saveTask(Task task) async {
//   //   // Implement your code to save the task locally (e.g., using SQLite, shared preferences, file system, etc.)
//   //   // Example: Save to shared preferences
//   //   // Example:
//   //   final prefs = await SharedPreferences.getInstance();
//   //   final taskJson = json.encode(task.toMap());
//   //   prefs.setString('task_${task.id}', taskJson);
//   // }
// }
//
//




// class AddTask extends StatelessWidget {
//   const AddTask({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final noteCubit = context.read<NoteCubit>();
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white70,
//         automaticallyImplyLeading: true,
//         elevation: 0.0,
//         leading: GestureDetector(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: Icon(Icons.arrow_back_ios_outlined, color: Colors.black),
//         ),
//         title: Text(
//           "Add Task",
//           style: TextStyle(color: Colors.blue),
//         ),
//       ),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TodoInputFields(),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Dispatch the addNote method from the Cubit
//                 noteCubit.addNote(
//                   content: "New Note",
//                   date: DateTime.now(),
//                   priority: "Medium",
//                 );
//                 Navigator.pop(context); // Navigate back after adding the note
//               },
//               child: Text("Create"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../../../Domain/models/Task_Model.dart';


import '../Shared_Widgets/TodoInputFields.dart'; // Import TodoInputFields widget

class AddTask extends StatelessWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white70,
        automaticallyImplyLeading: true,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_outlined, color: Colors.black),
        ),
        title: Text(
          "Add Task",
          style: TextStyle(color: Colors.blue),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TodoInputFields(), // Use TodoInputFields widget
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Retrieve data from TodoInputFields widget
                Task? newTask = await _createTaskFromInput();
                if (newTask != null) {
                  // Save the Task locally
                  await saveTask(newTask);
                  // Navigate back to the previous screen
                  Navigator.pop(context);
                } else {
                  // Handle invalid input
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Invalid Input'),
                      content: Text('Please fill all fields correctly.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: Text("Create"),
            ),
          ],
        ),
      ),
    );
  }

  Future<Task?> _createTaskFromInput() async {
    final TextEditingController contentController = TextEditingController();
    final TextEditingController dateController = TextEditingController();
    final TextEditingController priorityController = TextEditingController();

    String content = contentController.text;
    String dateString = dateController.text;
    String priority = priorityController.text;

    // Validate input
    if (content.isNotEmpty && dateString.isNotEmpty && priority.isNotEmpty) {
      DateTime? date = DateTime.tryParse(dateString);
      if (date != null) {
        return Task(
          content: content,
          date: date,
          priority: priority,
        );
      }
    }
    return null;
  }

  Future<void> saveTask(Task task) async {
    final prefs = await SharedPreferences.getInstance();
    final taskList = prefs.getStringList('tasks') ?? [];
    taskList.add(json.encode(task.toMap()));
    prefs.setStringList('tasks', taskList);
  }
}
