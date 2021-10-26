import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontsize;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextOverflow overflow;
  final TextDecoration decoration;
  const CustomText({
    this.text,
    this.fontsize,
    this.color,
    this.fontWeight,
    this.overflow,
    this.textAlign,
    this.decoration,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        overflow: overflow,
        textAlign: textAlign,
        style: GoogleFonts.lato(
          textStyle: TextStyle(
              color: color,
              fontSize: fontsize,
              letterSpacing: 1,
              fontWeight: fontWeight,
              decoration: decoration),
        ));
  }
}
