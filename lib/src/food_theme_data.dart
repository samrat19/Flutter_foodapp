import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodThemeData{

  static TextStyle fontFamily = GoogleFonts.sacramento();

  TextStyle foodCaptionTextStyle =  fontFamily.copyWith(
    fontWeight: FontWeight.w500,
    color: Colors.black,
    height: 1.0,
    wordSpacing: 7,
    letterSpacing: 3.0,
  );

  TextStyle foodItemTextStyle =  fontFamily.copyWith(
    color: Colors.black,
    height: 1.0,
  );
}