import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Shared {

  static const primaryColor = Color(0xFF00512D);
  static const color2 = Color(0xFF382E1E);
  static const color3 = Color(0xFFCF9F69);
  static const color4 = Color(0xFFFCFCFC);
  static const color5 = Color(0xFFF6F7F9);

  static final fontStyle1 = GoogleFonts.poppins().copyWith(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.5,
  );

  static final fontStyle2 = GoogleFonts.poppins(
    color: Colors.white,
    fontSize: 11,
    fontWeight: FontWeight.w400,
    letterSpacing: 2.5
  );

  


}