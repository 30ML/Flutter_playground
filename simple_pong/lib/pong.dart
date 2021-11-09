import 'package:flutter/material.dart';
import 'ball.dart';
import 'bat.dart';

class Pong extends StatefulWidget {
  @override
  _PongState createState() => _PongState();
}

class _PongState extends State<Pong> {
  double width = 0; // 화면에서 사용 가능한 가로 길이
  double height = 0; // 화면에서 사용 가능한 세로 길이
  double posX = 0; // 공의 수평 위치
  double posY = 0; // 공의 수직 위치
  double batWidth = 0; // 막대 너비
  double batHeight = 0; // 막대 높이
  double batPosition = 0; // 막대의 (수평) 위치

  @override
  Widget build(BuildContext context) {
    // 화면 크기에 따라 크기를 변경 시키기 위해 LayoutBuilder 사용
    return LayoutBuilder(builder: (context, constraints) {
      height = constraints.maxHeight;
      width = constraints.maxWidth;
      batWidth = width / 5; // 부모 위젯 height의 1/5
      batHeight = height / 20; // 부모 위젯 width의 1/20

      return Stack(
        children: [
          Positioned(
            child: Ball(),
            top: 0,
          ),
          Positioned(
            child: Bat(batWidth, batHeight),
            bottom: 0,
          ),
        ],
      );
    });
  }
}
