import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_kurly/constants.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      color: kPrimaryColor,
      elevation: 0,
    ),
    primaryColor: kPrimaryColor,
    textSelectionTheme: // 선택된 텍스트 모양을 정의
        const TextSelectionThemeData(cursorColor: kPrimaryColor),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

TextTheme textTheme() {
  return TextTheme(
    headline1:
        GoogleFonts.nanumGothic(fontSize: 18, fontWeight: FontWeight.bold),
    headline2:
        GoogleFonts.nanumGothic(fontSize: 16, fontWeight: FontWeight.bold),
    subtitle1: GoogleFonts.nanumGothic(fontSize: 16),
    bodyText1: GoogleFonts.nanumGothic(fontSize: 15),
    bodyText2: GoogleFonts.nanumGothic(fontSize: 14),
  );
}
