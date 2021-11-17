import 'package:flutter/material.dart';
import 'package:getx/pages/post/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 라우트 설계 필요 없음(GetX 사용 예정)
      home: HomePage(),
    );
  }
}
