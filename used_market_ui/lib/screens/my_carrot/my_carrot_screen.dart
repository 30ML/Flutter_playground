// BottomNavigationBarItem의 '나의 당근' 아이콘을 눌렀을 때 나타날 위젯

import 'package:flutter/material.dart';

class MyCarrotScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('나의 당근'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(0.5),
          child: Divider(thickness: 0.5, height: 0.5, color: Colors.grey),
        ),
      ),
      body: ListView(
        children: [
          // MyCarrotHeader()
          const SizedBox(height: 8.0),

          // CardIconMenu(iconMenuList: iconMenu1),
          const SizedBox(height: 8.0),

          // CardIconMenu(iconMenuList: iconMenu2),
          const SizedBox(height: 8.0),

          // CardIconMenu(iconMenuList: iconMenu3),
        ],
      ),
    );
  }
}
