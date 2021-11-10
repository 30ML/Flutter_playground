import 'package:events/screens/event_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // testData();

    return MaterialApp(
      title: 'Events',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: EventScreen(),
    );
  }
}

// TEST: Cloud Firestore 데이터베이스에 연결하고 디버그 콘솔에서 일부 데이터를 출력
Future testData() async {
  await Firebase.initializeApp(); // Firebase 인스턴스 생성
  FirebaseFirestore db = FirebaseFirestore.instance;
  var data = await db.collection('event_details').get();
  var details = data.docs.toList();
  for (var detail in details) {
    print('detail: ${detail.id}'); // 세부 정보 목록의 각 아이템에 대해 id 출력
  }
}
