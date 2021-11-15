import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:noto_sans_korean/screens/home_screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'NotoSansKR',
      ),
      home: HomeScreen(),
    );
  }
}
