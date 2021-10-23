import 'package:flutter/material.dart';

import 'package:navigator_test/first_page.dart';
import 'package:navigator_test/second_page.dart';
import 'package:navigator_test/third_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'Navigation Example';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      initialRoute: '/',
      routes: {
        '/': (context) => FirstPage(),
        '/second': (context) => SecondPage(),
        '/third': (context) => ThirdPage(),
      },
    );
  }
}
