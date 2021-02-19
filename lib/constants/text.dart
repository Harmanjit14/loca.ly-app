import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget normalText(String text, double size, Color color) {
  return Text(
    text,
    style: GoogleFonts.poppins(
      fontSize: size,
      color: color,
    ),
  );
}

Widget boldText(String text, double size, Color color) {
  return Text(
    text,
    style: GoogleFonts.poppins(
      fontSize: size,
      color: color,
      fontWeight: FontWeight.bold,
    ),
  );
}
