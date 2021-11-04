// BottomNavigationBarItem의 '홈' 아이콘(Home)을 눌렀을 때 나타날 위젯

import 'package:carrot_market_ui/theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeScreen AppBar 영역 (index: 0)'),
      ),
      body: Container(
        color: Colors.orange[100],
        child: Center(
          child: Text(
            'HomeScreen Body 영역 (index: 0)',
            style: textTheme().headline2,
          ),
        ),
      ),
    );
  }
}
