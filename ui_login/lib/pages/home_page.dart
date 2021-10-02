import 'package:flutter/material.dart';
import 'package:ui_login/components/logo.dart';
import 'package:ui_login/size.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 200),
            Logo('MJ Soft'),
            SizedBox(height: 50),
            TextButton(
              onPressed: () {
                // 화면 스택 제거
                Navigator.pop(context);
              },
              child: Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}
