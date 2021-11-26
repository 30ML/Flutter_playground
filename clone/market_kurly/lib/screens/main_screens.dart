import 'package:flutter/material.dart';

class MainScreens extends StatelessWidget {
  static String routeName = '/main_screens';

  const MainScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Main Screen'),
      ),
    );
  }
}
