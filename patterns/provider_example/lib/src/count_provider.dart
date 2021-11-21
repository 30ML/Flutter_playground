import 'package:flutter/material.dart';

class CountProvider extends ChangeNotifier {
  int _count = 0;

  // getter를 사용하여 접근 가능하도록 변경
  int get count => _count;

  add() {
    _count += 1;
    notifyListeners();
    // 1. Provider에 있는 상태값이 업데이트 됨을 알림
    // 2. 구독하고 있는 Widget들의 상태값을 업데이트 시킴
  }

  subtract() {
    _count -= 1;
    notifyListeners();
  }
}
