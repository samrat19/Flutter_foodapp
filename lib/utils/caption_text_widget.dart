import 'package:flutter/material.dart';
import 'package:food/src/food_theme_data.dart';

class CaptionTextWidget extends StatelessWidget {

  final String text;

  const CaptionTextWidget({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,style: FoodThemeData().foodCaptionTextStyle.copyWith(
      fontSize: 55.0,
    ),);
  }
}
