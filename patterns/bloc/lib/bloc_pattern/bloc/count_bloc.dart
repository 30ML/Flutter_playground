import 'dart:async';

class CountBloc {
  int _count = 0;
  final StreamController<int> _countSubject = StreamController<int>();

  add() {
    _count += 1;
    _countSubject.sink.add(_count);
  }

  dispose() {
    _countSubject.close();
  }
}

class 
