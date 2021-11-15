import 'package:flutter/material.dart';
import 'package:noto_sans_korean/screens/first_screen.dart';
import 'package:noto_sans_korean/screens/second_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          FirstScreen(),
          SecondScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            label: 'First',
            icon: Icon(Icons.one_k),
          ),
          BottomNavigationBarItem(
            label: 'Second',
            icon: Icon(Icons.two_k),
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
