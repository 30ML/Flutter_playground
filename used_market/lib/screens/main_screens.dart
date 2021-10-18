// IndexedStack, BottomNavigation 위젯을 가지는 파일

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:used_market/screens/home/home_screen.dart';
import 'package:used_market/screens/heighborhood_life/neighborhood_life_screen.dart';
import 'package:used_market/screens/near_me/near_me_screen.dart';
import 'package:used_market/screens/chatting/chatting_screen.dart';
import 'package:used_market/screens/my_page/my_page_screen.dart';

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
          HomeScreen(),
          NeighborhoodLifeScreen(),
          NearMeScreen(),
          ChattingScreen(),
          MyPageScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.orange[800],
        currentIndex: _selectedIndex,
        items: [
          const BottomNavigationBarItem(
            label: '홈',
            icon: Icon(CupertinoIcons.home),
          ),
          const BottomNavigationBarItem(
            label: '동네생활',
            icon: Icon(CupertinoIcons.square_on_square),
          ),
          const BottomNavigationBarItem(
            label: '내 근처',
            icon: Icon(CupertinoIcons.placemark),
          ),
          const BottomNavigationBarItem(
            label: '채팅',
            icon: Icon(CupertinoIcons.chat_bubble_2),
          ),
          const BottomNavigationBarItem(
            label: '내 정보',
            icon: Icon(CupertinoIcons.person),
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
