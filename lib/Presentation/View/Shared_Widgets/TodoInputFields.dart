import 'package:flutter/material.dart';

class TodoInputFields extends StatefulWidget {
  const TodoInputFields({Key? key}) : super(key: key);

  @override
  _TodoInputFieldsState createState() => _TodoInputFieldsState();
}

class _TodoInputFieldsState extends State<TodoInputFields> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _priorityController = TextEditingController();

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
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
          SizedBox(height: 30.0),
          TextField(
            controller: _dateController,
            decoration: InputDecoration(
              labelText: 'Date',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black),
              ),
              suffixIcon: IconButton(
                icon: Icon(Icons.calendar_today),
                onPressed: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2022),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      _dateController.text =
                      '${pickedDate.year}-${pickedDate.month}-${pickedDate.day}';
                    });
                  }
                },
              ),
            ),
            keyboardType: TextInputType.datetime,
            onTap: () async {
              // Show date picker
            },
          ),
          SizedBox(height: 30.0),
          TextField(
            controller: _priorityController,
            decoration: InputDecoration(
              labelText: 'Priority',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black),
              ),
              suffixIcon: PopupMenuButton(
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem(
                    child: Text('High'),
                    value: 'High',
                  ),
                  PopupMenuItem(
                    child: Text('Medium'),
                    value: 'Medium',
                  ),
                  PopupMenuItem(
                    child: Text('Low'),
                    value: 'Low',
                  ),
                ],
                onSelected: (value) {
                  setState(() {
                    _priorityController.text = value.toString();
                  });
                },
              ),
            ),
            keyboardType: TextInputType.text,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _dateController.dispose();
    _priorityController.dispose();
    super.dispose();
  }
}
