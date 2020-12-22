import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CaptionTextWidget extends StatelessWidget {

  final String text;

  const CaptionTextWidget({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,style: GoogleFonts.sacramento(
      fontSize: 55.0,
      fontWeight: FontWeight.w500,
      color: Colors.black,
      height: 1.0,
      wordSpacing: 7,
      letterSpacing: 3.0,
    ),);
  }
}
