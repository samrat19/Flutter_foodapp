import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screen/today_special_screen.dart';

void main() {
  runApp(FoodApp());
}


class FoodApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodaySpecialScreen(),
    );
  }
}