import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_example/tabs_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static FirebaseAnalytics analytics =
      FirebaseAnalytics(); // Firebase Analytics를 사용하기 위한 FirebaseAnalytics 객체 생성.
  static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(
      analytics: analytics); // 사용자의 행동을 관찰하는 FirebaseAnalyticsObserver 객체 생성.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorObservers: <NavigatorObserver>[observer],
      home: FirebaseApp(
        analytics: analytics,
        observer: observer,
      ),
    );
  }
}

class FirebaseApp extends StatefulWidget {
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  const FirebaseApp({
    Key? key,
    required this.analytics,
    required this.observer,
  }) : super(key: key);

  @override
  _FirebaseAppState createState() => _FirebaseAppState();
}

class _FirebaseAppState extends State<FirebaseApp> {
  String _message = '';

  void setMessage(String message) {
    setState(() {
      _message = message;
    });
  }

  Future<void> _sendAnalyticsEvent() async {
    // Analytics의 `logEvent`를 호출해 `test_event`라는 key로 data 저장.
    await widget.analytics.logEvent(
      name: 'test_event',
      parameters: <String, dynamic>{
        'string': 'hello flutter',
        'int': 100,
      },
    );
    setMessage('Send Analytics Successfully!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('TEST'),
              onPressed: _sendAnalyticsEvent,
            ),
            Text(
              _message,
              style: const TextStyle(
                color: Colors.blueAccent,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.tab),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
                settings: const RouteSettings(name: '/tab'),
                builder: (BuildContext context) {
                  return TabsPage(widget.observer);
                }),
          );
        },
      ),
    );
  }
}
