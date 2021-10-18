// 앱 테마 관리
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    textTheme: textTheme(),
    appBarTheme: appBarTheme(),
    primaryColor: Colors.orange,
  );
}

TextTheme textTheme() {
  return TextTheme(
    headline1: GoogleFonts.openSans(fontSize: 18.0, color: Colors.black),
    headline2: GoogleFonts.openSans(
        fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold),
    bodyText1: GoogleFonts.openSans(fontSize: 16.0, color: Colors.black),
    bodyText2: GoogleFonts.openSans(fontSize: 14.0, color: Colors.grey),
    subtitle1: GoogleFonts.openSans(fontSize: 15.0, color: Colors.black),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    centerTitle: false,
    color: Colors.white,
    elevation: 0.0,
    titleTextStyle: GoogleFonts.nanumGothic(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    actionsIconTheme: const IconThemeData(
      color: Colors.black,
    ),
  );
}
