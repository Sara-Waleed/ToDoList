import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
      DevicePreview(
    enabled: true,
    tools: [
      ...DevicePreview.defaultTools,
    ], builder: (BuildContext context) {return const MyApp();  },
      ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: Splash(),
      
    );
  }
}
class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Delay the navigation by 2 seconds (adjust the duration as needed)
    Future.delayed(Duration(seconds: 8), () {
      // Navigate to the next screen using pushReplacement
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    });

    // Return the scaffold with the splash image
    return Scaffold(
      body: Image.asset("assets/Splash F.gif",height:double.infinity,fit:BoxFit.cover),
    );
  }
}
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
        icon: Icon(Icons.refresh_outlined)),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SearchBar(),
            ),

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


class AddTask extends StatelessWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Column(
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
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search...',
          border: InputBorder.none,
        ),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.search,
        onSubmitted: (value) {
          // Handle search action here
          print('Search: $value');
        },
      ),
    );
  }
}

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

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              SearchBar(),

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
