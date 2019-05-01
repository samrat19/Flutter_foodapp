import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:indian_heritage/homepage.dart';

void main()=>runApp(
  MaterialApp(
    home: SplashScreenApp(),
    debugShowCheckedModeBanner: false,
  )
);

class SplashScreenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: HomePage(),
    );
  }
}