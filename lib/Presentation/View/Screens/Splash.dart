import 'package:flutter/material.dart';

import 'HomePage.dart';

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