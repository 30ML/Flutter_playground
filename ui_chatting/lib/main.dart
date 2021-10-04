import 'package:flutter/material.dart';
import 'package:ui_chatting/screens/main_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 0.0, // App Bar 하단 그림자 효과 제거
          backgroundColor: Colors.white,
          textTheme: TextTheme(
            headline6: TextStyle(color: Colors.black, fontSize: 24),
          ),
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      home: MainScreen(),
    );
  }
}
