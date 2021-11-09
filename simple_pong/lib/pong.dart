import 'dart:math';

import 'package:flutter/material.dart';
import 'ball.dart';
import 'bat.dart';

enum Direction { up, down, left, right }

class Pong extends StatefulWidget {
  @override
  _PongState createState() => _PongState();
}

class _PongState extends State<Pong> with SingleTickerProviderStateMixin {
  double width = 0; // 화면에서 사용 가능한 가로 길이
  double height = 0; // 화면에서 사용 가능한 세로 길이
  double posX = 0; // 공의 수평 위치
  double posY = 0; // 공의 수직 위치
  double batWidth = 0; // 막대 너비
  double batHeight = 0; // 막대 높이
  double batPosition = 0; // 막대의 (수평) 위치
  double increment = 5; // 증분 - 공의 속도
  double randX = 1;
  double randY = 1;
  int score = 0;

  Direction vDir = Direction.down;
  Direction hDir = Direction.right;

  Animation<double>? animation;
  AnimationController? controller;

  @override
  void initState() {
    posX = 0;
    posY = 0;

    controller = AnimationController(
      duration: const Duration(minutes: 10000),
      vsync: this,
    );

    animation = Tween<double>(begin: 0, end: 100).animate(controller!);
    animation!.addListener(() {
      safeSetState(() {
        (hDir == Direction.right)
            ? posX += ((increment * randX).round())
            : posX -= ((increment * randX).round());
        (vDir == Direction.down)
            ? posY += ((increment * randY).round())
            : posY -= ((increment * randY).round());
      });
      checkBorders();
    });
    controller!.forward();
    super.initState();
  }

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
            top: 0,
            right: 24,
            child: Text('Score: ${score.toString()}'),
          ),
          Positioned(
            top: posY,
            left: posX,
            child: Ball(),
          ),
          Positioned(
            bottom: 0,
            left: batPosition,
            child: GestureDetector(
              onHorizontalDragUpdate: (DragUpdateDetails update) =>
                  moveBat(update),
              child: Bat(batWidth, batHeight),
            ),
          ),
        ],
      );
    });
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  void checkBorders() {
    double diameter = 50; // 공의 지름

    if (posX <= 0 && hDir == Direction.left) {
      hDir = Direction.right;
      randX = randomNumber();
    }
    if (posX >= width - diameter && hDir == Direction.right) {
      hDir = Direction.left;
      randX = randomNumber();
    }
    if (posY >= height - diameter && vDir == Direction.down) {
      if (posX >= (batPosition - diameter) &&
          posX <= (batPosition + batWidth + diameter)) {
        vDir = Direction.up;
        randY = randomNumber();
        setState(() {
          score += 1;
        });
      } else {
        controller!.stop();
        showMessage(context);
      }
    }
    if (posY <= 0 && vDir == Direction.up) {
      vDir = Direction.down;
      randY = randomNumber();
    }
  }

  void moveBat(DragUpdateDetails update) {
    safeSetState(() {
      batPosition += update.delta.dx;
    });
  }

  void safeSetState(Function function) {
    if (mounted && controller!.isAnimating) {
      setState(() {
        function();
      });
    }
  }

  double randomNumber() {
    var randNum = Random().nextInt(101);
    return (50 + randNum) / 100; // 0.5 ~ 1.5
  }

  void showMessage(context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Game Over'),
          content: const Text('Would you like to play again?'),
          actions: [
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                setState(() {
                  posX = 0;
                  posY = 0;
                  score = 0;
                });
                Navigator.of(context).pop();
                controller!.repeat();
              },
            ),
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
                dispose();
              },
            ),
          ],
        );
      },
    );
  }
}
