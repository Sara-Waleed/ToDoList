import 'package:flutter/material.dart';

class TodoInputFields extends StatelessWidget {
  const TodoInputFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 28.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(

                labelText: 'To-Do Content',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black)
                )


            ),
          ),
          SizedBox(height: 30.0),
          TextField(
            decoration: InputDecoration(labelText: 'Date',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black)
                )),

            keyboardType: TextInputType.datetime,
            onTap: () {
              // Show date picker
            },
          ),
          SizedBox(height: 30.0),
          TextField(
            decoration: InputDecoration(
                suffixIcon: IconButton(
                  style: ButtonStyle(
                    backgroundColor:MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  onPressed: (){},
                  icon: Icon(Icons.add),
                ),
                labelText: 'Priority',  border: OutlineInputBorder(

                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black)
            )),
            keyboardType: TextInputType.number,
          ),

        ],
      ),
    );
  }
}