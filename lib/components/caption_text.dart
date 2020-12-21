import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CaptionText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('give your tongue a \nlittle twist',style: GoogleFonts.sacramento(
      fontSize: 55.0,
      fontWeight: FontWeight.w500,
      color: Colors.black,
      height: 1.0,
      wordSpacing: 7,
      letterSpacing: 3.0,
    ),);
  }
}
