import 'package:flutter/material.dart';
import 'widgets.dart';

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

class TimerHomePage extends StatelessWidget {
  final double defaultPadding = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Work Timer'),
      ),
      body: Column(
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
          const Expanded(child: Text('Hello')),
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
      ),
    );
  }
}
