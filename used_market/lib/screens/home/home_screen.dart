import 'package:flutter/material.dart';

import 'package:used_market/theme.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeScreen AppBar Area(index: 0)',
            style: textTheme().headline1),
      ),
      body: Container(
        color: Colors.orange[100],
        child: Center(
          child: Text('Home Screen Body Area(index: 0)',
              style: textTheme().headline2),
        ),
      ),
    );
  }
}
