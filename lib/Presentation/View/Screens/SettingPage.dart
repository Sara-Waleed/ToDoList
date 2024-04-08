import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        // elevation: 0.0,
        leading:

        IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_outlined,color: Colors.black,),
        ),
        title: Text("Setting",style: TextStyle(
            color: Colors.blue
        ),),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              height: 150,
              width: 150,
              child:Image.asset("assets/ICONApp.jpg"),


            ),
          ),

          Text("Task Manager",style: TextStyle(
            fontSize: 25,

          ),),
          Text("Version 1.2"),
          SizedBox(height: 30,),
          Divider(
              endIndent: 25,
              indent: 25,
              color: Colors.grey,thickness: 1),
          SizedBox(height: 20,),
          Container(
            height: 40,
            width: 250,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(child: Text("Clear All Data",style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),)),
          ),
          SizedBox(height: 20,),
          Divider(
              endIndent: 25,
              indent: 25,
              color: Colors.grey,thickness: 1),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Terms and Conditions ",style: TextStyle(
                  fontSize: 20,

                ),),
                SizedBox(height: 20,),
                Text("Privacy Policy ",style: TextStyle(
                  fontSize: 20,

                ),),
              ],
            ),
          ),
          Divider(
              endIndent: 25,
              indent: 25,
              color: Colors.grey,thickness: 1),



          Text("This is an app created 2024"),
        ],
      ),
    );
  }
}