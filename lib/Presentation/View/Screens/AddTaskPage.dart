import 'package:flutter/material.dart';

import '../Shared_Widgets/TodoInputFields.dart';

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
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_outlined,color: Colors.black,)),
        title: Text("Add Task",style: TextStyle(
            color: Colors.blue
        ),),
        //centerTitle: true,

      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          //  mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TodoInputFields(),
            ),
            SizedBox(height: 20,),
            Container(
              height: 50,
              width: 300,
              child: Center(child: Text("Create",style: TextStyle(
                color: Colors.white,
                //   fontWeight: FontWeight.bold,
                fontSize: 25,
              ),)),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}