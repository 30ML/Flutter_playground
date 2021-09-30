// 앱 메인 화면

import 'package:flutter/material.dart';

class MainScreens extends StatefulWidget {
  const MainScreens({Key? key}) : super(key: key);

  @override
  _MainScreensState createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: const Text('MainScreens'),
      ),
    );
  }
}
