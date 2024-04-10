

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Data/task_cubit.dart';
import '../../../Domain/models/Task_Model.dart';
import 'AddTaskPage.dart';
import 'HistoryPage.dart';
import 'SettingPage.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          //elevation: 0.0,
          // this for features as light and dark mode and localization ;
          // leading: IconButton(
          //     onPressed: (){
          //       print("showing");
          //     },
          //     icon: Icon(Icons.menu)),
          leading: PopupMenuButton(
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                child: Text('Option 1'),
                value: 'Option 1',
              ),
              PopupMenuItem(
                child: Text('Option 2'),
                value: 'Option 2',
              ),
              PopupMenuItem(
                child: Text('Option 3'),
                value: 'Option 3',
              ),
              PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.light_mode),
                  title: Text('Light Mode'),
                  onTap: () {
                    Navigator.pop(context);
                    _changeTheme(context, ThemeMode.light);
                  },
                ),
              ),
              PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.dark_mode),
                  title: Text('Dark Mode'),
                  onTap: () {
                    Navigator.pop(context);
                    _changeTheme(context, ThemeMode.dark);
                  },
                ),
              ),
            ],
            icon: Icon(Icons.menu),
          ),
          title: Text("TaskMangaer"),
          actions: [
            //this for History Page:
            IconButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => History(),));

                },
                icon: Icon(Icons.history)),
            //this for setting page
            IconButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Setting(),));
                },
                icon: Icon(Icons.settings)),
            SizedBox(width: 10,),
          ],
        ),
        body: Column(
          children: [
            SizedBox(height: 10,),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   //child: SearchBar(),
            // ),

            Image.asset("assets/homeImage.jpg"),

          ],
        ),

        floatingActionButton:FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddTask(),));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
  void _changeTheme(BuildContext context, ThemeMode themeMode) {
    final themeProvider = ThemeProvider();
    themeProvider.setTheme(themeMode);
  }
}

class ThemeProvider extends ChangeNotifier {
  ThemeMode? _themeMode;

  ThemeMode? get themeMode => _themeMode;

  void setTheme(ThemeMode themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }
}

// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Task Manager"),
//       ),
//       body: BlocBuilder<NoteCubit, List<Task>>(
//         builder: (context, notes) {
//           return ListView.builder(
//             itemCount: notes.length,
//             itemBuilder: (context, index) {
//               final note = notes[index];
//               return ListTile(
//                 title: Text(note.content),
//                 subtitle: Text(note.date.toString()),
//                 trailing: Text(note.priority),
//               );
//             },
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(context, MaterialPageRoute(builder: (context) => AddTask()));
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }