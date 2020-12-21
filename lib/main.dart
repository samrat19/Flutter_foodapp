import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/screen/all_items_screen.dart';
import 'screen/today_special_screen.dart';

void main() {
  runApp(FoodApp());
}


class FoodApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Demo(),
    );
  }
}

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AllItemsScreen(isVeg: true,height: MediaQuery.of(context).size.height,);
  }
}
