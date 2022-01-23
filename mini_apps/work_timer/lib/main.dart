import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'procudtivity_button.dart';
import 'timer_model.dart';
import 'count_down_timer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Work Timer',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: TimerHomePage(),
    );
  }
}

final CountDownTimer timer = CountDownTimer();

class TimerHomePage extends StatelessWidget {
  final double defaultPadding = 5.0;

  @override
  Widget build(BuildContext context) {
    timer.startWork();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Work Timer'),
      ),
      // 절대값
      // 화면 사용 가능 공간에 따라 상대적인 크기를 선택하는 것이 좋음
      // 이를 위해 부모 위젯의 제약조건을 제공하는 LayoutBuilder 사용
      body: LayoutBuilder(builder: (context, constraints) {
        final double availableWidth =
            constraints.maxWidth; // 부모 위젯의 제약 조건에 따른 max width를 가져옴

        return Column(
          children: [
            Row(
              children: [
                Padding(padding: EdgeInsets.all(defaultPadding)),
                Expanded(
                  child: ProductivityButton(
                    color: const Color(0xff009688),
                    text: 'Work',
                    onPressed: () {},
                  ),
                ),
                Padding(padding: EdgeInsets.all(defaultPadding)),
                Expanded(
                  child: ProductivityButton(
                    color: const Color(0xff607D8B),
                    text: 'Short Break',
                    onPressed: () {},
                  ),
                ),
                Padding(padding: EdgeInsets.all(defaultPadding)),
                Expanded(
                  child: ProductivityButton(
                    color: const Color(0xff455A64),
                    text: 'Long Break',
                    onPressed: () {},
                  ),
                ),
                Padding(padding: EdgeInsets.all(defaultPadding)),
              ],
            ),
            Expanded(
              child: StreamBuilder(
                initialData: '00:00',
                stream: timer.stream(),
                builder: (context, snapshot) {
                  TimerModel timer = (snapshot.data == '00:00')
                      ? TimerModel('00:00', 1)
                      : snapshot.data as TimerModel; // 타입 변경 필요

                  return CircularPercentIndicator(
                    radius: availableWidth / 2,
                    lineWidth: 12.0,
                    percent: timer.percent,
                    center: Text(
                      timer.time,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    progressColor: const Color(0xff009688),
                  );
                },
              ),
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.all(defaultPadding)),
                Expanded(
                  child: ProductivityButton(
                    color: const Color(0xff212121),
                    text: 'Stop',
                    onPressed: () {},
                  ),
                ),
                Padding(padding: EdgeInsets.all(defaultPadding)),
                Expanded(
                  child: ProductivityButton(
                    color: const Color(0xff009688),
                    text: 'Restart',
                    onPressed: () {},
                  ),
                ),
                Padding(padding: EdgeInsets.all(defaultPadding)),
              ],
            ),
          ],
        );
      }),
    );
  }
}
