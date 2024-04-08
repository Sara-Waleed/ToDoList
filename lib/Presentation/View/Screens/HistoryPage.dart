import 'package:flutter/material.dart';


class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,

        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_outlined,color: Colors.black,),
          ),
          title: Text("History",style: TextStyle(
              color: Colors.blue
          ),),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
             // SearchBar(),

              SizedBox(height: 20,),
              Container(
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(),
                ),
                child:  Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Movie Times",style: TextStyle(

                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),),
                          Text("Mar 14 2021 . High"),

                        ],
                      ),
                    ),
                    IconButton(onPressed: (){},
                        icon: Icon(Icons.delete)),
                  ],
                ),

              ),
            ],

          ),
        ),
      ),
    );
  }
}