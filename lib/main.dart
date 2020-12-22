import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/screen/all_items_screen.dart';
import 'package:food/test_elements.dart';
import 'package:provider/provider.dart';
import 'screen/today_special_screen.dart';

void main() {
  runApp(FoodApp(),);
}


class FoodApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx)=>AppController(),
      child: MaterialApp(
        home: TodaySpecialScreen(),
      ),
    );
  }
}

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AllItemsScreen(isVeg: true,height: MediaQuery.of(context).size.height,);
  }
}
