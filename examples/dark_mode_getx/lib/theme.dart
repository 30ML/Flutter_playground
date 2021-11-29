import 'package:flutter/material.dart';

class Themes {
  static final darkTheme = ThemeData(
    fontFamily: 'NotoSansKR',
    colorScheme: ColorScheme.dark(),
    primaryColorBrightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    backgroundColor: Colors.grey,
  );

  static final lightTheme = ThemeData(
    fontFamily: 'NotoSansKR',
    colorScheme: ColorScheme.light(),
    primaryColorBrightness: Brightness.light,
    scaffoldBackgroundColor: Colors.grey,
    backgroundColor: Colors.white,
  );
}
