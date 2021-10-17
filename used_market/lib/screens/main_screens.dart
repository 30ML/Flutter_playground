// IndexedStack, BottomNavigation 위젯을 가지는 파일

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MainScreens extends StatefulWidget {
  @override
  _MainScreens createState() => _MainScreens();
}

class _MainScreens extends State<MainScreens> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          Container(
            color: Colors.orange[100],
            child: Center(
              child: Text(
                'IndexedStack 1',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ),
          Container(
            color: Colors.redAccent[100],
            child: Center(
              child: Text(
                'IndexedStack 2',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            label: '홈',
            icon: Icon(CupertinoIcons.home),
          ),
          BottomNavigationBarItem(
            label: '채팅',
            icon: Icon(CupertinoIcons.chat_bubble),
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
