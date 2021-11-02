import 'dart:async';
import 'timer_model.dart';

class CountDownTimer {
  double _radius = 1; // 완료된 시간의 백분율
  bool _isActive = true; // 카운터 활성 유무
  Timer? timer; // 카운트다운 타이머를 생성하는 데 사용하는 클래스
  late Duration _time; // 남은 시간
  late Duration _fullTime; // 진행될 시간
  int work = 30; // 진행 시간: 30분

  void startWork() {
    _radius = 1;
    _time = Duration(minutes: work, seconds: 0);
    _fullTime = _time;
  }

  void stopTimer() {
    _isActive = false;
  }

  /* Stream은 제네릭이므로 모든 타입의 Stream을 반환할 수 있음 */
  // TimerModel의 Stream을 반환하는 함수
  Stream<TimerModel> stream() async* {
    // 1초마다 값을 보냄
    yield* Stream.periodic(const Duration(seconds: 1), (int a) {
      String time;
      if (_isActive) {
        _time = _time - const Duration(seconds: 1);
        _radius = _time.inSeconds / _fullTime.inSeconds;

        if (_time.inSeconds <= 0) {
          _isActive = false;
        }
      }
      time = returnTime(_time);

      return TimerModel(time, _radius);
    });
  }

  // Time Formatter
  String returnTime(Duration time) {
    String minutes = time.inMinutes < 10
        ? '0' + time.inMinutes.toString()
        : time.inMinutes.toString();
    int numSeconds = time.inSeconds - (time.inMinutes * 60);

    String seconds =
        numSeconds < 10 ? '0' + numSeconds.toString() : numSeconds.toString();

    String formattedTime = minutes + ':' + seconds;
    return formattedTime;
  }
}
