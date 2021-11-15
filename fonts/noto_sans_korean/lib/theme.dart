import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme localTextTheme() {
  return const TextTheme(
    headline1: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      height: 1.6,
    ),
    headline2: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      height: 1.6,
    ),
    headline3: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      height: 1.6,
    ),
    headline4: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      height: 1.6,
    ),
    headline5: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      height: 3.2,
    ),
    headline6: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      height: 1.6,
    ),
    subtitle1: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      height: 1.6,
    ),
    subtitle2: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      height: 1.6,
    ),
  );
}

TextTheme googleTextTheme() {
  return TextTheme(
    headline1: GoogleFonts.notoSans(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      height: 1.6,
    ),
    headline2: GoogleFonts.notoSans(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      height: 1.6,
    ),
    headline3: GoogleFonts.notoSans(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      height: 1.6,
    ),
    headline4: GoogleFonts.notoSans(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      height: 1.6,
    ),
    headline5: GoogleFonts.notoSans(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      height: 3.2,
    ),
    headline6: GoogleFonts.notoSans(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      height: 1.6,
    ),
    subtitle1: GoogleFonts.notoSans(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      height: 1.6,
    ),
    subtitle2: GoogleFonts.notoSans(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      height: 1.6,
    ),
  );
}
