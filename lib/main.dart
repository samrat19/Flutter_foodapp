import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screen/display_screen.dart';

void main() {
  runApp(FoodApp());
}


class FoodApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DisplayScreen(),
    );
  }
}