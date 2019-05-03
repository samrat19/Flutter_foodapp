import 'package:food/credenTials/signIn.dart';
import 'package:splashscreen/splashscreen.dart'; 
import 'package:flutter/material.dart'; 

class Splash_Screen extends StatefulWidget {
  @override
  _Splash_ScreenState createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      loaderColor: Colors.white,
      title: Text("\n\nWelcome to Foodie", 
        style: TextStyle(
          color: Colors.white,
          fontSize: 45.0,
        ),
      ), 
      navigateAfterSeconds: LoginPage(), 
      imageBackground: AssetImage("asset/splash.jpg"),
    );
  }
} 